package com.example.demo.DTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserDto {
    @NotNull(message = "Please write your name.")
    @NotBlank(message = "Please write name not only with spaces.")
    private String name;
    @Email(message = "Please write right syntax of your email.")
    private String email;
}
