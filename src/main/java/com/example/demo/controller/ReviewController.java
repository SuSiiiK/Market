package com.example.demo.controller;


import com.example.demo.entity.ReviewForProduct;
import com.example.demo.repositories.ReviewRepo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/review")
public class ReviewController {

    private final ReviewRepo reviewRepo;

    @GetMapping
    public String showRiviews(Model model) {
        List<ReviewForProduct> all = reviewRepo.findAll();
        model.addAttribute("all", all);
        return "productscomments";
    }
}