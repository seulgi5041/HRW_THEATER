package com.cinema.hrw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.hrw.entity.CartItemEntity;
import com.cinema.hrw.repository.CartItemRepository;

@Service
public class CartItemService {
    private final CartItemRepository cartItemRepository;

    @Autowired
    public CartItemService(CartItemRepository cartItemRepository) {
        this.cartItemRepository = cartItemRepository;
    }

    public List<CartItemEntity> getAllCartItems(String userId) {
        return cartItemRepository.findByUserId(userId);
    }

    public CartItemEntity addToCart(CartItemEntity cartItem) {
        return cartItemRepository.save(cartItem);
    }

    public void removeFromCart(Long id) {
        cartItemRepository.deleteById(id);
    }
}
