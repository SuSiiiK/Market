package com.example.demo.entity;


import lombok.*;


import javax.persistence.*;
import javax.validation.constraints.*;
import java.util.List;

@Data
@Entity
@Table(name="products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @NotNull(message = "Please write name of the product.")
    @NotBlank(message = "Please write right name of the product.")
    private String name;

    @NotNull(message = "Please download an image of the product.")
    private String image;

    private String description;

    @PositiveOrZero
    private int quantity;

    @Positive
    private int price;

    @ManyToOne
    @NotNull
    private Category category;
    @ManyToOne
    @NotNull
    private User user;
    @OneToMany(mappedBy = "product")
    private List<@NotNull Order> orders;
}
