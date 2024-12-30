package com.example.demo.entity;

import org.springframework.data.domain.Page;

import java.util.List;

public class ProductCategoryResponse {
    private Page<Product> productPage;
    private List<String> categories;

    // Конструкторы, геттеры и сеттеры

    public ProductCategoryResponse(Page<Product> productPage, List<String> categories) {
        this.productPage = productPage;
        this.categories = categories;
    }

    public Page<Product> getProductPage() {
        return productPage;
    }

    public void setProductPage(Page<Product> productPage) {
        this.productPage = productPage;
    }

    public List<String> getCategories() {
        return categories;
    }

    public void setCategories(List<String> categories) {
        this.categories = categories;
    }
}