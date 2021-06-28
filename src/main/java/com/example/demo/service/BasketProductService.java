package com.example.demo.service;

import com.example.demo.entity.BasketProduct;
import com.example.demo.repositories.BasketProductRepo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
@RequiredArgsConstructor
public class BasketProductService {
    private final BasketProductRepo basketProductRepo;

    public void save(BasketProduct basketFood) {
        basketProductRepo.save(basketFood);
    }

    public void delete(BasketProduct basketFood) {
        basketProductRepo.delete(basketFood);
    }
    public void saveAll(List<BasketProduct> foodList){
        basketProductRepo.saveAll(foodList);
    }
}
