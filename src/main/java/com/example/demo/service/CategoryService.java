package com.example.demo.service;


import com.example.demo.entity.Category;
import com.example.demo.entity.Product;
import com.example.demo.entity.ProductCategoryResponse;
import com.example.demo.repositories.CategoryRepo;
import com.example.demo.repositories.ProductRepo;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.stereotype.Service;
import org.springframework.data.domain.Pageable;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor

public class CategoryService {
    @Autowired
    private final CategoryRepo categoryRepo;
    private final ProductRepo productRepo;

    public List<Category> getAllCategories() {
        return categoryRepo.findAll(); // Возвращаем все категории
    }

//    public ProductCategoryResponse getByType(Pageable pageable, String text) {
//        List<Product> products = new ArrayList<>();
//        List<Category> categories = categoryRepo.findAllByNameContaining(text);
//
//        for (Category category : categories) {
//            List<Product> allByType = productRepo.findAllByCategory(category);
//            products.addAll(allByType);
//        }
//
//        // Преобразование списка продуктов в объект Page
//        int start = (int) pageable.getOffset();
//        int end = Math.min(start + pageable.getPageSize(), products.size());
//        Page<Product> productPage = new PageImpl<>(products.subList(start, end), pageable, products.size());
//
//        // Получение всех категорий
//        List<String> allCategories = categoryRepo.findAllCategoryNames();
//
//        // Создание и возврат объекта ProductCategoryResponse
//        return new ProductCategoryResponse(productPage, allCategories);
//    }
}