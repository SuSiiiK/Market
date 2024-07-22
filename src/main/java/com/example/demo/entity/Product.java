package com.example.demo.entity;


import lombok.*;


import javax.persistence.*;
import javax.validation.constraints.*;
import java.util.List;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name="products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull(message = "Please write name of the product.")
    @NotBlank(message = "Please write right name of the product.")
    private String name;

    @NotNull(message = "Please download an image of the product.")
    private String image;


    @NotBlank
    @Size(min = 10, max = 240)
    private String description;

    @Positive
    private int quantity;

    @Positive
    private double price;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

}
