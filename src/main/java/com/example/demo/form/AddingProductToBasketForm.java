package com.example.demo.form;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Positive;

@Getter
@Setter
public class AddingProductToBasketForm {

    @NotNull
    private Long productId;

    @Positive
    private Integer qty;
}