package com.example.demo.controller;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class TotalValidator implements ConstraintValidator<ValidTotal, String> {

    @Override
    public void initialize(ValidTotal constraintAnnotation) {
    }

    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        if (value == null || value.isEmpty()) {
            return true;  // Если значение пустое, то валидация не срабатывает
        }

        // Заменить запятую на точку и проверить, является ли строка числом
        try {
            // Заменяем запятую на точку
            String formattedValue = value.replace(",", ".");
            // Проверяем, является ли после преобразования строка допустимым числом
            Double.parseDouble(formattedValue);
            return true;
        } catch (NumberFormatException e) {
            // Если ошибка, значит строка не является валидным числом
            context.disableDefaultConstraintViolation();
            context.buildConstraintViolationWithTemplate("Некорректный формат числа")
                    .addConstraintViolation();
            return false;
        }
    }
}
