package com.example.demo.controller;


import com.example.demo.entity.Category;
import com.example.demo.entity.Product;
import com.example.demo.service.CategoryService;
import com.example.demo.service.ProductService;
import com.example.demo.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class MainController {
    private final UserService userService;
    private final ProductService productService;
    private final CategoryService categoryService;

    @GetMapping
    public String index(@RequestParam(defaultValue = "1") Integer page, Model model, Principal principal, HttpServletRequest uriBuilder) {
        Page<Product> allFood = productService.getAllProduct(PageRequest.of(page - 1, 10));
        List<Category> categories = categoryService.getAllCategories();

        model.addAttribute("products", allFood.getContent());
        model.addAttribute("pages", allFood.getTotalPages());
        model.addAttribute("categories", categories);
        var uri = uriBuilder.getRequestURI();
        try {
            var user = userService.getByEmail(principal.getName());
            model.addAttribute("user", user);
        } catch (NullPointerException ex) {
            model.addAttribute("not authorized", true);
        }
        return "index";
    }
}
