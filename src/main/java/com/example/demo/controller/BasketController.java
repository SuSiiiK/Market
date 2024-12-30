package com.example.demo.controller;

import com.example.demo.entity.*;
import com.example.demo.exception.ResourceNotFoundException;
import com.example.demo.form.AddingProductToBasketForm;
import com.example.demo.form.OrderForm;
import com.example.demo.repositories.OrderRepo;
import com.example.demo.repositories.ReviewRepo;
import com.example.demo.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.security.Principal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
@RequiredArgsConstructor
@RequestMapping("/basket")
public class BasketController {
    private final BasketService basketService;
    private final BasketProductService basketProductService;
    private final UserService userService;
    private final ProductService productService;
    private final OrderRepo orderRepository;
    private final ReviewRepo reviewRepo;

    @PostMapping("/add")
    public String addFood(@Valid AddingProductToBasketForm form, BindingResult bindingResult, Principal principal, HttpSession session) throws BindException {

        if (bindingResult.hasFieldErrors()) {
            throw new BindException(bindingResult);
        }
        var user = userService.getByEmail(principal.getName());
        if (!productService.existById(form.getProductId())) {
            throw new ResourceNotFoundException("Not Found");
        }
        var product = productService.getById(form.getProductId());
        int a = 0;
        if (form.getQty() == null) {
            a = 1;
        } else {
            a = form.getQty();
        }

        if (basketService.findBySession(session.getId()) == null) {
            List<BasketProduct> list = new ArrayList<>();
            Basket basket = new Basket(session.getId(), user);
            BasketProduct basketProduct = new BasketProduct(a, basket, product);
            list.add(basketProduct);
            basketService.save(basket);
            basketProductService.save(basketProduct);
            basketService.save(basket);

        } else {
            Basket basket = basketService.findBySession(session.getId());
            BasketProduct basketProduct = new BasketProduct(a, basket, product);
            basketProductService.save(basketProduct);
        }
        session.removeAttribute(Constants.CART_ID);
        session.setAttribute(Constants.CART_ID, basketService.findBySession(session.getId()));

        return "redirect:/product/list";
    }

    @Autowired
    private EmailService emailService;


    @GetMapping()
    public String showBasket(Principal principal, HttpSession session, Model model) {
        var user = userService.getByEmail(principal.getName());
        try {
            model.addAttribute("user", user);
        } catch (NullPointerException ex) {
            model.addAttribute("not authorized", true);
        }
        if (basketService.findBySession(session.getId()) == null) {
//            throw new ResourceNotFoundException("Basket is Empty");
            return "index";
        }
        Basket bySession = basketService.findBySession(session.getId());

        List<BasketProduct> products = bySession.getProducts();

        double total = products.stream()
                .mapToDouble(basketProduct -> basketProduct.getProduct().getPrice() * basketProduct.getQty())
                .sum();

        basketService.save(bySession);
        model.addAttribute("products", products);
        model.addAttribute("user", user);

        // Передаем итоговую стоимость в OrderForm
        OrderForm orderForm = new OrderForm();
        orderForm.setTotal(total); // Убедитесь, что у вас есть метод setTotal в OrderForm
        model.addAttribute("form", orderForm);

        return "basket";
    }

    @PostMapping("/delete")
    public String deletefromBasket(@Valid AddingProductToBasketForm form, BindingResult bindingResult, Principal principal, HttpSession session) throws BindException {
        if (bindingResult.hasFieldErrors()) {
            throw new BindException(bindingResult);
        }
        var user = userService.getByEmail(principal.getName());
        if (!productService.existById(form.getProductId())) {
            throw new ResourceNotFoundException("Not Found");
        }
        var product = productService.getById(form.getProductId());
        Basket bySession = basketService.findBySession(session.getId());

        List<BasketProduct> products = bySession.getProducts();

        for (BasketProduct b :
                products) {
            if (b.getProduct().getId() == product.getId()) {
                products.remove(b);
                basketProductService.delete(b);
            }
        }

        bySession.setProducts(products);
        basketProductService.saveAll(products);
        basketService.save(bySession);
        session.removeAttribute(Constants.CART_ID);
        session.setAttribute(Constants.CART_ID, basketService.findBySession(session.getId()));

        return "redirect:/"; // Перенаправляем на страницу корзины
    }

    @PostMapping("/order")
    public String makeOrder(@Valid OrderForm orderForm, BindingResult bindingResult,
                            HttpSession session, Principal principal) throws BindException {

        // Проверка валидации формы
        if (bindingResult.hasErrors()) {
            throw new BindException(bindingResult);
        }

        // Получение корзины из сессии
        Basket basket = basketService.findBySession(session.getId());
        if (basket == null) {
            throw new ResourceNotFoundException("Корзина пуста");
        }

        // Получение email пользователя
        var user = userService.getByEmail(principal.getName());

        // Получение общей суммы из корзины
        double total = basket.getProducts().stream()
                .mapToDouble(basketProduct -> basketProduct.getProduct().getPrice() * basketProduct.getQty())
                .sum();

        // Создание заказа
        Order order = Order.builder()
                .address(orderForm.getAddress())
                .name(orderForm.getName())
                .tel(orderForm.getTel())
                .basket(basket)
                .total(total)  // Используем вычисленную сумму
                .build();
        orderRepository.save(order);

        // Отправка email-уведомлений
        try {
            emailService.sendOrderConfirmationEmail(
                    user.getEmail(),
                    orderForm.getName(),
                    orderForm.getAddress(),
                    orderForm.getTel(),
                    total  // Отправляем total как double
            );
        } catch (Exception e) {
            // Логирование ошибки отправки email
            System.err.println("Ошибка отправки email: " + e.getMessage());
        }

        return "redirect:/basket";
    }

    @GetMapping("/review")
    public String getRewiewPage(Principal principal, Model model) {
        var user = userService.getByEmail(principal.getName());
        if (orderRepository.findAllByBasket_User(user).isEmpty()) {
            throw new ResourceNotFoundException("You cant write any reviews");
        }
        List<Order> allByBasket_user = orderRepository.findAllByBasket_User(user);
        Set<Product> products = new HashSet<>();
        for (Order o :
                allByBasket_user) {
            List<BasketProduct> products1 = o.getBasket().getProducts();
            for (BasketProduct f :
                    products1) {
                products.add(f.getProduct());
            }
        }
        model.addAttribute("products", products);
        return "review";
    }

    @PostMapping("/review")
    public String getReview(Principal principal, @RequestParam Long productId, @RequestParam String text) {
        var user = userService.getByEmail(principal.getName());

        if (!productService.existById(productId)) {
            throw new ResourceNotFoundException("There is not such product");
        }

        if (text.isEmpty() || text.isBlank()) {
            throw new ResourceNotFoundException("Review input is empty");
        }

        Product product = productService.getById(productId);

        ReviewForProduct review = ReviewForProduct.builder()
                .name(text)
                .product(product)
                .date(LocalDate.now())
                .user(user)
                .build();

        reviewRepo.save(review);

        // Перенаправление на страницу продукта
        return String.format("redirect:/product/%s", product.getId());
    }
}
