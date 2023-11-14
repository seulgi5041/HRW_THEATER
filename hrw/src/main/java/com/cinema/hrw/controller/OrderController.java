package com.cinema.hrw.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cinema.hrw.dto.FoodOrderDTO;
import com.cinema.hrw.dto.OrderJoinDTO;
import com.cinema.hrw.dto.OrderDTO;
import com.cinema.hrw.dto.SeatDTO;
import com.cinema.hrw.entity.FoodOrderEntity;
import com.cinema.hrw.service.OrderServiec;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class OrderController {
    private final OrderServiec orderServiec;
    
    @PostMapping("/order/detail")
    public String orderDetail(@RequestParam("orderCode") String orderCode, Model model){
        OrderJoinDTO oderJoinDTO=  orderServiec.selectOrderInfoByOrderCode(orderCode);
        List<SeatDTO> seatDTOList = orderServiec.seletSeatListByOrderCode(orderCode);
        model.addAttribute("orderInfo",oderJoinDTO);
        model.addAttribute("seatList",seatDTOList);
        return "order/order_confirmation";
    }

    @PostMapping("/choiceFoodOrder")
    @ResponseBody
    public List<FoodOrderDTO> orderDetail(@RequestBody Map<String, String> requestBody){
        List<FoodOrderDTO> foodOrderEntityList = orderServiec.getFoodOrderList(requestBody);
        return foodOrderEntityList;
    }

    @GetMapping("/order/history")
    public String orderHistory(HttpSession session , Model model ){
        String loginId =(String)session.getAttribute("loginId");
        if(loginId==null){
            return "redirect:/member/login";
        }else{
        List<OrderJoinDTO> OderDTOList = orderServiec.getOrderListByUserId(loginId);
        model.addAttribute("userOrder", OderDTOList);
        return "order/order_history";
    
    }
    }
}