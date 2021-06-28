package com.example.demo.form;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Getter
@Setter
public class RegisterForm {
    @NotBlank
    private String name = "";

    @NotBlank
    @Email
    private String email = "";

    @Size(min = 8, max = 24, message = "length must be >=8 and <=24")
    private String password;
}