package com.example.demo.form;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

@Getter
@Setter
public class ResetForm {
    @NotBlank
    @Email
    private String email = "";
}