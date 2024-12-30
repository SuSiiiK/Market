package com.example.demo.repositories;

import com.example.demo.entity.Category;
import com.example.demo.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.validation.constraints.NotBlank;
import java.util.List;

@Repository
public interface ProductRepo extends JpaRepository<Product,Long> {
    Page<Product> findAllByNameContaining(@NotBlank String name, Pageable pageable);

    List<Product> findAllByCategory(Category category);

    Page<Product> findAllByDescriptionContaining(@NotBlank String description, Pageable pageable);

}

