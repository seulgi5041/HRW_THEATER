package com.cinema.hrw.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.cinema.hrw.dto.FoodOrderDTO;

import com.cinema.hrw.dto.OrderJoinDTO;
import com.cinema.hrw.dto.OrderDTO;

import com.cinema.hrw.dto.SeatDTO;

import com.cinema.hrw.entity.FoodEntity;
import com.cinema.hrw.entity.FoodOrderEntity;
import com.cinema.hrw.entity.MemberEntity;

import com.cinema.hrw.entity.OrderEntity;
import com.cinema.hrw.entity.SeatEntity;
import com.cinema.hrw.repository.FoodOrderRepository;
import com.cinema.hrw.repository.FoodRepository;
import com.cinema.hrw.repository.MemberRepository;
import com.cinema.hrw.repository.OrderRepository;
import com.cinema.hrw.repository.SeatRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OrderServiec {
    private final OrderRepository orderRepository;
    private final SeatRepository seatRepository;
    private final FoodOrderRepository foodOrderRepository;
    private final MemberRepository memberRepository;
    private final FoodRepository foodRepository;

    
    public OrderJoinDTO selectOrderInfoByOrderCode(String orderCode) {
        System.out.println("주문번호01 : "+orderCode);
        List<Object[]> results  = orderRepository.findOrderDetailsByOrderCode(orderCode);
        
        if (!results.isEmpty()) {
            Object[] result = results.get(0);
            OrderJoinDTO oderJoinDTO = new OrderJoinDTO();
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

    public List<OrderJoinDTO> getOrderListByUserId(String loginId) {
        Optional<MemberEntity> memberEntity = memberRepository.findByUserId(loginId);
        MemberEntity member = memberEntity.orElse(null);
           List<Object[]> results =orderRepository.getOrdersAndFoodItems(member);
           List<OrderJoinDTO> orderHistory = new ArrayList<>();

           
            for(Object[] row : results){
                OrderJoinDTO orderJoinDTO = new OrderJoinDTO();
                orderJoinDTO.setOrderDate((String)row[0]);
                orderJoinDTO.setOrderCode((String)row[1]);
                orderJoinDTO.setMovieTitle((String)row[2]);
                orderJoinDTO.setRepresentFoodName(row[4] != null ? ((String) row[4]) : "정보없음");
                Long foodPrice = row[3] != null ? (Long)row[3] : 0;
                orderJoinDTO.setTotalPrice((Long)row[5] + foodPrice);
                orderHistory.add(orderJoinDTO);
            }
            
           
       return orderHistory;
       
        

        
    }
    @Transactional
    public int orderRefund(String update_food_order, int oder_movie_check, String orderCode) {
        ObjectMapper objectMapper = new ObjectMapper();
        /*{'foodName': name, 'foodCount': count, 'foodPrice': price 형식의 제이슨} */
        OrderEntity orderEntity = new OrderEntity();
        orderEntity.setOrderCode(orderCode);
        OrderEntity orderRefund = orderRepository.findByOrderCode(orderEntity.getOrderCode());
        
        List<FoodOrderEntity> foodOrderEntityList = new ArrayList<>();
        int check = 0;
        try {
            List<Map<String, Object>> updateFoodOrder = objectMapper.readValue(update_food_order, new TypeReference<List<Map<String, Object>>>(){});
             for (Map<String, Object> foodMap : updateFoodOrder) {
                String foodName = (String) foodMap.get("foodName");
                int foodCountInt = (int)foodMap.get("foodCount");
                Long foodCount = Long.valueOf(foodCountInt);
                int foodPriceInt = (int) foodMap.get("foodPrice");
                Long foodPrice = Long.valueOf(foodPriceInt);

        // FoodDTO 객체 생성 및 리스트에 추가    
                FoodEntity foodEntity = foodRepository.findByFoodName(foodName);
                FoodOrderEntity foodOrderEntity = foodOrderRepository.findByOrderCodeAndFoodName(orderRefund,foodEntity);
                foodOrderEntity.setFoodCount(foodCount);
                foodOrderEntity.setFoodPrice(foodPrice);
                foodOrderEntityList.add(foodOrderEntity);
        }
           
        

        if(oder_movie_check ==3){
            
            orderRefund.setMovieOrderCondition(oder_movie_check);
            orderRefund.setMoviePrice((long) 0);
            orderRefund.setAdultCount(0);
            orderRefund.setTeenagerCount(0);
            orderRefund.setDisabledCount(0);
            orderRefund.setMovieCode(null);
            orderRefund.setScheduleCode(null);
            
            orderRepository.save(orderRefund);
            seatRepository.deleteByOrderCode(orderRefund);
        }

        for(FoodOrderEntity foodOrderEntity : foodOrderEntityList){
            if(foodOrderEntity.getFoodCount()==0){
                foodOrderRepository.deleteByOrderCodeAndFoodName(foodOrderEntity.getOrderCode(), foodOrderEntity.getFoodName());
            }
            else{
                foodOrderRepository.save(foodOrderEntity);
            }
        }

        } catch (JsonProcessingException e) {
                e.printStackTrace();
                check = 1;
            }
        
        return check;
    }
    
}
