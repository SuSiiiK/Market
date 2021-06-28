package com.example.demo.entity;


import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

@Data
@Entity
@Table(name="categories")
public class Category {
    @Id
    private Long id;

    @NotBlank
    @Size(min = 3, max = 128)
    private String name;

    @OneToMany(mappedBy = "category")
    @OrderBy("name ASC")
    List<Product> products;
}