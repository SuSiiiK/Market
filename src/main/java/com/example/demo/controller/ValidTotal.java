package com.example.demo.controller;

import javax.validation.Constraint;
import javax.validation.Payload;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ ElementType.FIELD, ElementType.PARAMETER })
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = TotalValidator.class)  // Указываем валидатор
public @interface ValidTotal {

    String message() default "Invalid total format";  // Сообщение по умолчанию

    Class<?>[] groups() default {};  // Группы валидации

    Class<? extends Payload>[] payload() default {};  // Дополнительная информация

}
