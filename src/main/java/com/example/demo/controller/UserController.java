package com.example.demo.controller;


import com.example.demo.DTO.UserDto;
import com.example.demo.exception.UserNotFoundException;
import com.example.demo.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@RequestMapping("/users")
public class UserController {
    private final UserService userService;

    @GetMapping("/getUserById/{userId}")
    public UserDto getUserById(@PathVariable("userId") Long userId) {
        var user = userService.getUserById(userId);
        return UserDto.builder()
                .name(user.getName())
                .email(user.getEmail())
                .build();
    }

    @ExceptionHandler(UserNotFoundException.class)
    private String userNotFound(UserNotFoundException uex) {
        return uex.getMessage();
    }
}
