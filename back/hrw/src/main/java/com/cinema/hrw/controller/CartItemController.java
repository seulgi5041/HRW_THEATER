package com.cinema.hrw.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinema.hrw.entity.CartItemEntity;
import com.cinema.hrw.service.CartItemService;

//백엔드 컨트롤러
@Controller
@RequestMapping("/foodstore/shopping_basket")
public class CartItemController {
 private final CartItemService cartItemService;

 @Autowired
 public CartItemController(CartItemService cartItemService) {
     this.cartItemService = cartItemService;
 }

 @GetMapping
 public String viewCart(Model model, HttpSession session) {
     // 세션에서 사용자 ID 가져오기
     String loggedInUserId = (String) session.getAttribute("loginId");
     List<CartItemEntity> cartItems = cartItemService.getAllCartItems(loggedInUserId);
     model.addAttribute("cartItems", cartItems);
     return "/foodstore/shopping_basket";
 }

 @PostMapping("/add")
 public String addToCart(@ModelAttribute CartItemEntity cartItem, HttpSession session) {
     // 세션에서 사용자 ID 가져오기
     String loggedInUserId = (String) session.getAttribute("loginId");
     cartItem.setUserId(loggedInUserId);

     cartItemService.addToCart(cartItem);
     return "redirect:/foodstore/shopping_basket";
 }

 @GetMapping("/remove/{id}")
 public String removeFromCart(@PathVariable Long id) {
     cartItemService.removeFromCart(id);
     return "redirect:/foodstore/shopping_basket";
 }
}
