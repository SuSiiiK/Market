package com.example.demo.service;

import com.example.demo.exception.UserNotFoundException;
import com.example.demo.entity.User;
import com.example.demo.repositories.UserRepo;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@AllArgsConstructor
public class UserService {
private final UserRepo userRepo;

    public User getUserById(Long id) {
        return userRepo.findById(id).orElseThrow(()-> new UserNotFoundException("User not found."));
    }
}
