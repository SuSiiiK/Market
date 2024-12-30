package com.example.demo.form;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Positive;

@Getter
@Setter
public class OrderForm {

    @NotBlank(message = "Имя не может быть пустым")
    private String name = "";

    @NotBlank(message = "Адрес не может быть пустым")
    private String address = "";

    @NotBlank(message = "Телефон не может быть пустым")
    private String tel = "";

//    @Positive(message = "Сумма должна быть положительной")
    private double total;

    // Пустой конструктор
    public OrderForm() {}

    // Конструктор с общей суммой
    public OrderForm(double total) {
        this.total = total;
    }

    // Конструктор с форматированием строки
//    public OrderForm(String total) {
//        this.total = Double.parseDouble(total.replace(" ", ""));
//    }
}