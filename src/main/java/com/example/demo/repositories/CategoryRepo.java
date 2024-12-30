package com.example.demo.repositories;

import com.example.demo.entity.Category;
import org.jetbrains.annotations.NotNull;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.validation.constraints.NotBlank;
import java.util.List;

@Repository
public interface CategoryRepo extends JpaRepository<Category, Long> {
    List<Category> findAllByNameContaining(@NotBlank String name);

    @NotNull
    List<Category> findAll(); // Получение всех категорий
}
