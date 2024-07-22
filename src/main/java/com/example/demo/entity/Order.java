package com.example.demo.entity;


import lombok.*;


import javax.persistence.*;
import javax.validation.constraints.*;



@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name="orders")
@Builder
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String address;
    private String tel;


    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "basket_id", referencedColumnName = "id")
    private Basket basket;

    private double total;
}
