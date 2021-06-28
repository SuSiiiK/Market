package com.example.demo.controller;


import com.example.demo.entity.BasketProduct;
import com.example.demo.entity.Order;
import com.example.demo.entity.Product;
import com.example.demo.entity.ReviewForProduct;
import com.example.demo.exception.ResourceNotFoundException;
import com.example.demo.repositories.OrderRepo;
import com.example.demo.repositories.ReviewRepo;
import com.example.demo.service.ProductService;
import com.example.demo.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping
public class ProductController {
    private final ProductService productService;
    private final UserService userService;
    private final ReviewRepo reviewRepo;
    private final OrderRepo orderRepository;
    private final Integer size = 4;


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
    public String getFoodBySearch(Principal principal, @RequestParam(defaultValue = "1") Integer page, @RequestParam String text, @RequestParam String param, Model model) {
        if (text.equals("") || text.isBlank() || text.isEmpty()) {
            throw new RuntimeException("Input is empty");
        }
        Page<Product> products;
        switch (param) {
            case "name":
                text = text.toUpperCase();
                products = productService.getByName(PageRequest.of(page - 1, size), text);
                break;
            case "type":
                products = productService.getByType(PageRequest.of(page - 1, size), text);
                break;
            case "desc":
                products = productService.getByDesc(PageRequest.of(page - 1, size), text);
                break;
            default:
                throw new ResourceNotFoundException("Method Error");
        }

        if (products.getContent().size() < 1) {
            throw new RuntimeException("Not Found");
        }
        model.addAttribute("pages", products.getTotalPages());
        model.addAttribute("elems", products.getTotalElements());
        model.addAttribute("products", products.getContent());
        model.addAttribute("type", param);
        model.addAttribute("text", text);
        try {
            var user = userService.getByEmail(principal.getName());
            model.addAttribute("user", user);
        } catch (NullPointerException ex) {
            model.addAttribute("not authorized", true);
        }
        return "index";
    }
}

