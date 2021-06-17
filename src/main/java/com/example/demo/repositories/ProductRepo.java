package com.example.demo.repositories;

import com.example.demo.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductRepo extends JpaRepository<Product,Long> {
    Page<Product> findByNameContains(String name , Pageable pageable);
    Page<Product> findByDescriptionContains (String description, Pageable pageable);
    Page<Product> findByPriceLessThanEqual (Integer price , Pageable pageable);
    Page<Product> findByQuantityLessThanEqual (Integer quantity, Pageable pageable);
}

