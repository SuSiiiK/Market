package com.example.demo.service;


import com.example.demo.entity.Basket;
import com.example.demo.repositories.BasketRepo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor

public class BasketService {
    private final BasketRepo basketRepo;


    public Basket findBySession(String session) {
        return basketRepo.findBySession(session);
    }

    public void save(Basket basket) {
        basketRepo.save(basket);
    }

    public void delete(Basket basket) {
        basketRepo.delete(basket);
    }

    public boolean existById(Long id) {
        return basketRepo.existsById(id);
    }

    public Basket getById(Long id) {
        return basketRepo.findById(id).get();
    }
}