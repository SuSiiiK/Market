package com.example.demo.DTO;

import com.example.demo.entity.User;
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
    private int id;
    @NotNull(message = "Please write your name.")
    @NotBlank(message = "Please write name not only with spaces.")
    private String fullname;
    @Email(message = "Please write right syntax of your email.")
    private String email;

    public static UserDto from(User user) {
        return builder()
                .id(user.getId())
                .fullname(user.getFullname())
                .email(user.getEmail())
                .build();
    }
}
