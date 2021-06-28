package com.example.demo.controller;

import com.example.demo.entity.*;
import com.example.demo.exception.ResourceNotFoundException;
import com.example.demo.form.AddingProductToBasketForm;
import com.example.demo.form.OrderForm;
import com.example.demo.repositories.OrderRepo;
import com.example.demo.repositories.ReviewRepo;
import com.example.demo.service.BasketProductService;
import com.example.demo.service.BasketService;
import com.example.demo.service.ProductService;
import com.example.demo.service.UserService;
import lombok.RequiredArgsConstructor;
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

        return "redirect:/";
    }

    @GetMapping()
    public String showBasket(Principal principal, HttpSession session, Model model) {
        var user = userService.getByEmail(principal.getName());

        if (basketService.findBySession(session.getId()) == null) {
            throw new ResourceNotFoundException("Basket is Empty");
        }
        Basket bySession = basketService.findBySession(session.getId());


        List<BasketProduct> products = bySession.getProducts();

        double total = 0;
        for (BasketProduct b :
                bySession.getProducts()) {
            total = total + b.getProduct().getPrice() * b.getQty();
        }

        basketService.save(bySession);
        model.addAttribute("products", products);
        model.addAttribute("user, user");
        model.addAttribute("form", new OrderForm(total));
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

        return "redirect:/";
    }

    @PostMapping("/order")
    public String makeOrder(@Valid OrderForm orderForm, BindingResult bindingResult, HttpSession session) throws BindException {

        if (bindingResult.hasFieldErrors()) {
            throw new BindException(bindingResult);
        }
        Basket basket;
        try {
            basket = basketService.findBySession(session.getId());
        } catch (ResourceNotFoundException e) {
            throw new ResourceNotFoundException("There is nit such basket");
        }

        if (basket == null) {
            throw new ResourceNotFoundException("There is not such basket");
        }

        Order order = Order.builder()
                .address(orderForm.getAddress())
                .name(orderForm.getName())
                .tel(orderForm.getTel())
                .basket(basket)
                .total(orderForm.getTotal())
                .build();
        orderRepository.save(order);
        return "redirect:/basket/review";
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
            throw new ResourceNotFoundException("There is not such food");
        }
        if (text.isEmpty() || text.isBlank()) {
            throw new ResourceNotFoundException("Review input is empty");
        }
        Product byId = productService.getById(productId);

        ReviewForProduct r = ReviewForProduct.builder()
                .name(text)
                .product(byId)
                .date(LocalDate.now())
                .user(user)
                .build();

        reviewRepo.save(r);
        String m = String.format("redirect:/product/%s", byId.getId());
        return m;
    }
}
