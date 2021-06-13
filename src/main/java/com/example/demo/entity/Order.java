package com.example.demo.entity;


import lombok.*;


import javax.persistence.*;
import javax.validation.constraints.*;



@Data
@Entity
@Table(name="orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @NotNull
    private User user;

    @ManyToOne
    @NotNull
    private Product product;
}
