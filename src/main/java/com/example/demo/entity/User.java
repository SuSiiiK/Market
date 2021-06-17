package com.example.demo.entity;


import lombok.*;


import javax.persistence.*;
import java.util.List;
import javax.validation.constraints.*;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @NotNull(message = "Please write your name.")
    @NotBlank(message = "Please write name not only with spaces.")
    private String name;

    @Email(message = "Please write right syntax of your email.")
    private String email;

    @Size(min = 4 , max = 10, message = "Please write password between 4 and 10 symbols.")
    private String password;



}
