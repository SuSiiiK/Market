package com.example.demo.entity;


import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.List;

@Data
@Entity
@Table(name="categories")
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @NotNull(message = "Please write name of the category")
    @NotBlank(message = "Please write right name of the category. Not only with spaces.")
    private String name;

    @OneToMany(mappedBy = "category")
    private List<@NotNull Product> products;
}