package com.example.demo.service;

import com.example.demo.DTO.UserDto;
import com.example.demo.exception.CustomerAlreadyRegisteredException;
import com.example.demo.exception.UserRegisterForm;
import com.example.demo.exception.UserNotFoundException;
import com.example.demo.entity.User;
import com.example.demo.repositories.UserRepo;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class UserService {
private final UserRepo userRepo;

    public User getUserById(Long id) {
        return userRepo.findById(id).orElseThrow(UserNotFoundException::new);
    }

    private final PasswordEncoder encoder;

    public UserDto register(UserRegisterForm form) {
        if (userRepo.existsByEmail(form.getEmail())) {
            throw new CustomerAlreadyRegisteredException();
        }

        var user = User.builder()
                .email(form.getEmail())
                .fullname(form.getName())
                .password(encoder.encode(form.getPassword()))
                .build();

        userRepo.save(user);

        return UserDto.from(user);
    }

    public UserDto getByEmail(String email) {
        var user = userRepo.findByEmail(email)
                .orElseThrow(UserNotFoundException::new);

        return UserDto.from(user);
    }
}
