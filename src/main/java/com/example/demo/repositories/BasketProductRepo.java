package com.example.demo.repositories;


import com.example.demo.entity.Basket;
import com.example.demo.entity.BasketProduct;
import com.example.demo.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BasketProductRepo extends JpaRepository<BasketProduct, Long> {
    BasketProduct findBasketProductByBasketAndProduct(Basket basket, Product product);

    List<BasketProduct> findBasketProductByBasket(Basket basket);
}
