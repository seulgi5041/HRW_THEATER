package com.cinema.hrw.dto;


import java.util.Map;
import java.util.List;
import java.util.ArrayList;

import com.cinema.hrw.entity.FoodEntity;
import com.cinema.hrw.entity.FoodOrderEntity;
import com.cinema.hrw.entity.MemberEntity;
import com.cinema.hrw.entity.OrderEntity;
import com.fasterxml.jackson.core.JsonProcessingException;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class FoodOrderDTO {
    private int num;
   
    private OrderDTO orderCode;
    
    private FoodDTO foodName;
   
    private Long foodCount;

    private Long foodPrice;

    private int foodOrderCondition;

    private String foodImgName; /*db에들어가지도 조인하지도 않지만 서버에서 이미지 체크위해 넣는 정보*/

    public static FoodOrderDTO toFoodOrderDTO(FoodOrderEntity foodOrderEntity){
    FoodOrderDTO foodOrderDTO = new FoodOrderDTO();
    foodOrderDTO.setOrderCode(foodOrderEntity.getOrderCode());
    foodOrderDTO.setFoodName(foodOrderEntity.getFoodName());
    foodOrderDTO.setFoodCount(foodOrderEntity.getFoodCount());
    foodOrderDTO.setFoodPrice(foodOrderEntity.getFoodPrice());
    foodOrderDTO.setFoodOrderCondition(foodOrderEntity.getFoodOrderCondition());
        return foodOrderDTO;
    }
    public void setOrderCode(OrderEntity orderEntity){
        this.orderCode=OrderDTO.toOrderDTO(orderEntity);
    }

    public void setFoodName(FoodEntity foodEntity){
        this.foodName=FoodDTO.toFoodDTO(foodEntity);
    }

    public String getFoodNameStr(){
        FoodDTO foodDTO = this.foodName;
        String foodNameStr = foodDTO.getFoodName();
        return foodNameStr ;
    }
  
}
