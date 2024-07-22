package com.example.demo.repositories;


import com.example.demo.entity.Basket;
import com.example.demo.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BasketRepo extends JpaRepository<Basket, Long> {

    Basket findBySession(String session);

    Basket findByUserAndSession(User user, String session);
}
