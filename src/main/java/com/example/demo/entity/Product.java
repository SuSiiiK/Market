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

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id")
    @NotNull
    private Category category;

}
