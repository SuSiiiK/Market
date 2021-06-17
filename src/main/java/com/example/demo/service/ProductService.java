package com.example.demo.service;


import com.example.demo.entity.Product;
import com.example.demo.repositories.ProductRepo;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class ProductService {
    private final ProductRepo productRepo;

    public List<Product> getAllProduct(){
        return productRepo.findAll();
    }

    public Page<Product> getAllProductsByName (String name, Pageable pageable){
        return productRepo.findByNameContains(name,pageable);
    }

    public Page<Product> getAllProductsByPrice (Integer price , Pageable pageable){
        return  productRepo.findByPriceLessThanEqual(price, pageable);
    }

    public Page<Product> getAllProductsByDescription (String description, Pageable pageable){
        return productRepo.findByDescriptionContains(description, pageable);
    }

    public Page<Product> getAllProductsByQuantity (Integer quantity, Pageable pageable){
        return productRepo.findByQuantityLessThanEqual(quantity, pageable);
    }
}
