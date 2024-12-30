package com.example.demo.service;

import com.example.demo.entity.Category;
import com.example.demo.entity.Product;
import com.example.demo.repositories.CategoryRepo;
import com.example.demo.repositories.ProductRepo;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductService {
    private final ProductRepo productRepo;
    private final CategoryRepo categoryRepo;

    public Page<Product> getByName(Pageable pageable, String text) {
        return productRepo.findAllByNameContaining(text, pageable);
    }
    public List<Product> findAll() {

        return productRepo.findAll(); // Fetch all products from the database

    }
        public Page<Product> getByType(Pageable pageable, String text) {
        List<Product> products = new ArrayList<>();
        List<Category> categories = categoryRepo.findAllByNameContaining(text);

        for (Category t :
                categories) {
            List<Product> allByType = productRepo.findAllByCategory(t);
            products.addAll(allByType);
        }

        int start = (int) pageable.getOffset();
        int end = Math.min((start + pageable.getPageSize()), products.size());
        Page<Product> productPage = new PageImpl<>(products.subList(start, end), pageable, products.size());
        return productPage;
    }


    public Page<Product> getByDesc(Pageable pageable, String text) {
        return productRepo.findAllByDescriptionContaining(text, pageable);
    }

    public Page<Product> getAllProduct(Pageable pageable) {
        return productRepo.findAll(pageable);
    }

    public boolean existById(Long id) {
        return productRepo.existsById(id);
    }

    public Product getById(Long id) {
        return productRepo.findById(id).get();
    }
}
