package com.example.demo.repositories;


import com.example.demo.entity.ResetPass;
import com.example.demo.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ResetPassRepo extends JpaRepository<ResetPass, Long> {

    boolean existsByUser(User user);

    ResetPass findByUser(User user);

    boolean existsByTokenAndUser(String token, User user);

    void deleteAllByUser(User user);
}
