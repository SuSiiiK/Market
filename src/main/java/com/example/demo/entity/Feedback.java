package com.example.demo.entity;


import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.*;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "feedbacks")
public class Feedback {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    private User user;

    @ManyToOne
    private Product product;

    @NotBlank(message = "Please write down stars.")
    @NotNull(message = "Please write down stars.")
    @Size(min = 1, max = 5)
    private int stars;
    @NotNull(message = "Please write a description.")
    @NotBlank(message = "Please write a right description.")
    private String description;
}
