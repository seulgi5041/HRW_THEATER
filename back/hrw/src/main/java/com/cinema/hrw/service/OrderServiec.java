package com.cinema.hrw.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.cinema.hrw.dto.CinemaAddressDTO;
import com.cinema.hrw.dto.FoodOrderDTO;
import com.cinema.hrw.dto.MovieDTO;
import com.cinema.hrw.dto.OderJoinDTO;
import com.cinema.hrw.dto.OrderDTO;
import com.cinema.hrw.dto.ScheduleDTO;
import com.cinema.hrw.dto.SeatDTO;
import com.cinema.hrw.entity.CinemaAddressEntity;
import com.cinema.hrw.entity.FoodOrderEntity;
import com.cinema.hrw.entity.MovieEntity;
import com.cinema.hrw.entity.OrderEntity;
import com.cinema.hrw.entity.ScheduleEntity;
import com.cinema.hrw.entity.SeatEntity;
import com.cinema.hrw.repository.FoodOrderRepository;
import com.cinema.hrw.repository.OrderRepository;
import com.cinema.hrw.repository.SeatRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrderServiec {
    private final OrderRepository orderRepository;
    private final SeatRepository seatRepository;
    private final FoodOrderRepository foodOrderRepository;
    
    public OderJoinDTO selectOrderInfoByOrderCode(String orderCode) {
        
        OrderDTO orderDTO = new OrderDTO();
        orderDTO.setOrderCode(orderCode);
        List<Object[]> results  = orderRepository.findOrderDetailsByOrderCode(orderDTO.getOrderCode());

        if (!results.isEmpty()) {
            Object[] result = results.get(0);
            OderJoinDTO oderJoinDTO = new OderJoinDTO();
            oderJoinDTO.setOrderCode(result[0] != null ? (String) result[0] : "");
            oderJoinDTO.setOrderDate(result[1] != null ? (String) result[1] : "");
            oderJoinDTO.setMovieCode(result[2] != null ? (String) result[2] : "");
            oderJoinDTO.setMovieTitle(result[3] != null ? (String) result[3] : "");
            oderJoinDTO.setMovieRating(result[4] != null ? (String) result[4] : "");
            oderJoinDTO.setCinemaName(result[5] != null ? (String) result[5] : "");
            oderJoinDTO.setAuditorium(result[6] != null ? (String) result[6] : "");
            oderJoinDTO.setTakeDate(result[7] != null ? (String) result[7] : "");
            oderJoinDTO.setStartTime(result[8] != null ? (String) result[8] : "");
            oderJoinDTO.setEndTime(result[9] != null ? (String) result[9] : "");
            oderJoinDTO.setScreenType(result[10] != null ? (String) result[10] : "");
            oderJoinDTO.setTeenagerCount(result[11] != null ? (int) result[11] : 0);
            oderJoinDTO.setAdultCount(result[12] != null ? (int) result[12] : 0);
            oderJoinDTO.setDisabledCount(result[13] != null ? (int) result[13] : 0);
            oderJoinDTO.setMoviePrice(result[14] != null ? (Long) result[14] : 0);
            oderJoinDTO.setMovieOrderCondition(result[15] != null ? (int) result[15] : 0);
            oderJoinDTO.setPayMethod(result[16] != null ? (String) result[16] : "");
            oderJoinDTO.setPayCompany(result[17] != null ? (String) result[17] : "");
        return oderJoinDTO;
            
    }return null;
}

    public List<SeatDTO> seletSeatListByOrderCode(String orderCode) {
        OrderEntity orderEntity = orderRepository.findByOrderCode(orderCode);
        List<SeatEntity> seatListEntity = seatRepository.findByOrderCode(orderEntity);
        List<SeatDTO> seatList = new ArrayList<>();

        for(SeatEntity seatEntity : seatListEntity){
        SeatDTO seatDTO = new SeatDTO();
        seatDTO.setSeatName(seatEntity.getSeatName());
        seatList.add(seatDTO);
        }

        return seatList;
    }

    public List<FoodOrderDTO> getFoodOrderList(Map<String, String> requestBody) {
        String orderCode = requestBody.get("choice_order_code");
        OrderEntity orderEntity = orderRepository.findByOrderCode(orderCode);
        List<Object[]> results = foodOrderRepository.getFoodInfoByOrderCode(orderEntity);
        List<FoodOrderDTO> FoodOrderListDTO = new ArrayList<>();
        if (!results.isEmpty()) {
            for(int i=0; i<results.size();i++){
                Object[] result = results.get(i);
                FoodOrderDTO foodOrderDTO = new FoodOrderDTO();
                foodOrderDTO.setFoodNameStr((String)result[0]);
                foodOrderDTO.setFoodDescription((String)result[1]);
                foodOrderDTO.setFoodImgName((String)result[2]);
                foodOrderDTO.setFoodCost((Long)result[3]);
                foodOrderDTO.setFoodCount((Long)result[4]);
                foodOrderDTO.setFoodOrderCondition((int)result[5]);
                foodOrderDTO.setFoodPrice((Long)result[6]);
                FoodOrderListDTO.add(foodOrderDTO);
            }
        }
        
        
        return FoodOrderListDTO;
    }

    public List<OderJoinDTO> getOrderListByUserId(String loginId) {
        

        return null;
    }
    
}
