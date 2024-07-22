package com.example.demo.form;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
public class ReviewForm {

    @NotBlank
    private Long productId;

    @NotBlank
    private String text;

}
