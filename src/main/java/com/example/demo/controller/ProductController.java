package com.example.demo.controller;


import com.example.demo.entity.*;
import com.example.demo.exception.ResourceNotFoundException;
import com.example.demo.repositories.OrderRepo;
import com.example.demo.repositories.ReviewRepo;
import com.example.demo.service.CategoryService;
import com.example.demo.service.ProductService;
import com.example.demo.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequiredArgsConstructor
@RequestMapping
public class ProductController {
    private final ProductService productService;
    private final UserService userService;
    private final ReviewRepo reviewRepo;
    private final OrderRepo orderRepository;
    private final Integer size = 20;
    @Autowired
    private CategoryService categoryService; // Сервис для получения категорий

    @GetMapping("/product/{id}")
    public String foodInfo(@PathVariable Long id, Principal principal, Model model) {
        if (!productService.existById(id)) {
            throw new ResourceNotFoundException("There is no such product with " + id + " id");
        }

        Product byId = productService.getById(id);

        try {
            var user = userService.getByEmail(principal.getName());
            model.addAttribute("user", user);
            List<Order> allByBasket_user = orderRepository.findAllByBasket_User(user);
            for (Order r :
                    allByBasket_user) {
                for (BasketProduct f :
                        r.getBasket().getProducts()) {
                    if (f.getProduct().getId() == id) {
                        model.addAttribute("addReview", true);
                    }
                }
            }

        } catch (NullPointerException ex) {
            model.addAttribute("not authorized", true);
        }

        List<ReviewForProduct> allByProduct = reviewRepo.findAllByProduct(byId);
        model.addAttribute("reviews", allByProduct);
        model.addAttribute("product",byId);

        return "product";
    }

    @GetMapping("/found")
    public String getFoodBySearch(Principal principal,
                                  @RequestParam(defaultValue = "1") Integer page,
                                  @RequestParam String text,
                                  Model model) {
        if (text == null || text.trim().isEmpty()) {
            model.addAttribute("error", "Input is empty");
            return "index"; // Возвращаем на страницу с ошибкой
        }

        Page<Product> products = productService.getByDesc(PageRequest.of(page - 1, size), text);

        // Если товары не найдены, добавляем сообщение об ошибке в модель
        if (products.getContent().isEmpty()) {
            model.addAttribute("error", "No products found for your search.");
        }

        model.addAttribute("pages", products.getTotalPages());
        model.addAttribute("elems", products.getTotalElements());
        model.addAttribute("products", products.getContent());
        model.addAttribute("text", text);

        try {
            var user = userService.getByEmail(principal.getName());
            model.addAttribute("user", user);
        } catch (NullPointerException ex) {
            model.addAttribute("not authorized", true);
        }

        return "searchResults"; // Возвращаем на страницу результатов поиска
    }

    @GetMapping("/products")
    public String getProductsByCategory(@RequestParam String category,
                                        @RequestParam(defaultValue = "1") Integer page,
                                        Model model) {
        Pageable pageable = PageRequest.of(page - 1, 10); // Пример: 10 продуктов на страницу
        Page<Product> productPage = productService.getByType(pageable, category);

        model.addAttribute("products", productPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", productPage.getTotalPages());
        model.addAttribute("category", category);

        return "partials/main"; // Имя шаблона для отображения продуктов
    }
    @GetMapping("/product/list")
    public String listProducts(
            @RequestParam(required = false, defaultValue = "") String category,
            @RequestParam(defaultValue = "1") Integer page,
            Model model,  Principal principal) {
        Pageable pageable = PageRequest.of(page - 1, 10); // 10 продуктов на страницу
        Page<Product> productPage;

        if (category.isEmpty()) {
            // Если категория не указана, показать все продукты
            productPage = productService.getAllProduct(pageable);
        } else {
            // Показать продукты по указанной категории
            productPage = productService.getByType(pageable, category);
        }
        List<Category> categories = categoryService.getAllCategories();
        model.addAttribute("products", productPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("selectedCategory", category != null ? category : "");
        model.addAttribute("totalPages", productPage.getTotalPages());
        model.addAttribute("category", category);
        model.addAttribute("categories", categories);
        try {
            var user = userService.getByEmail(principal.getName());
            model.addAttribute("user", user);
        } catch (NullPointerException ex) {
            model.addAttribute("not authorized", true);
        }
        return "ListProduct"; // Имя шаблона без расширения .ftlh
    }


}

