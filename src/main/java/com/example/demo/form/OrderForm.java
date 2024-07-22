package com.example.demo.form;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Positive;

@Getter
@Setter
public class OrderForm {

    @NotBlank
    private String name = "";

    @NotBlank
    private String address = "";

    @NotBlank(message = "error")
    private String tel = "";


    @Positive
    private double total;

    public OrderForm(double total) {
        this.total = total;
    }
}
