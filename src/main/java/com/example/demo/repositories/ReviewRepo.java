package com.example.demo.repositories;


import com.example.demo.entity.Product;
import com.example.demo.entity.ReviewForProduct;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ReviewRepo extends JpaRepository<ReviewForProduct, Long> {

    List<ReviewForProduct> findAllByProduct(Product product);
}
