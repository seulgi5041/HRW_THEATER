package com.cinema.hrw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class OrderController {
    @PostMapping("/order/detail")
    public String orderDetail(@RequestParam("orderCode") String orderCode, Model model){
        System.out.println("코드 : " + orderCode);
        return "order/oder_confirmation";
    }
}
