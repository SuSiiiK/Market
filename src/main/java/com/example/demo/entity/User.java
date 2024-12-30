package com.example.demo.entity;


import lombok.*;


import javax.persistence.*;
import javax.validation.constraints.*;

@Data
@Entity
@AllArgsConstructor(access = AccessLevel.PACKAGE)
@NoArgsConstructor
@Builder
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Email(message = "Please write right syntax of your email.")
    @NotBlank(message = "Please write name not only with spaces.")
    @Size(min = 1, max = 128)
    @Column(length = 128)
    private String email;

    @NotBlank
    @Size(min = 8, max = 128, message = "Please write password between 4 and 10 symbols.")
    @Column(length = 128)
    private String password;

    @NotBlank(message = "Please write name not only with spaces.")
    @Size(min = 1, max = 128)
    @Column(length = 128)
    private String userName;

    @Column
    @Builder.Default
    private boolean enabled = true;

    @NotBlank
    @Size(min = 1, max = 128)
    @Column(length = 128)
    @Builder.Default
    private String role = "USER";

}
