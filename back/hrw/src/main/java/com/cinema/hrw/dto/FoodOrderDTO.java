package com.cinema.hrw.dto;


import java.util.Map;

import com.cinema.hrw.entity.FoodOrderEntity;

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
    
    private String foodName;
   
    private Long foodCount;

    private Long foodPrice;

    private int foodOrderCondition;

    public static FoodOrderDTO toFoodOrderDTO(FoodOrderEntity foodOrderEntity){
    FoodOrderDTO foodOrderDTO = new FoodOrderDTO();
    foodOrderDTO.setNum(foodOrderEntity.getNum());
    foodOrderDTO.setOrderCode(OrderDTO.toOrderDTO(foodOrderEntity.getOrderCode()));
    foodOrderDTO.setFoodName(foodOrderEntity.getFoodName());
    foodOrderDTO.setFoodCount(foodOrderEntity.getFoodCount());
    foodOrderDTO.setFoodPrice(foodOrderEntity.getFoodPrice());
    foodOrderDTO.setFoodOrderCondition(foodOrderEntity.getFoodOrderCondition());
        return foodOrderDTO;
    }

    public static FoodOrderDTO mapToFoodOrderDTO(Map<String, Object> choiceFoodInfo) {
        FoodOrderDTO foodOrderDTO = new FoodOrderDTO();

        if (choiceFoodInfo.containsKey("이름")) {
            foodOrderDTO.setFoodName((String) choiceFoodInfo.get("이름"));
        }

        if (choiceFoodInfo.containsKey("구매 가격")) {
            foodOrderDTO.setFoodPrice(((Number) choiceFoodInfo.get("구매 가격")).longValue());
        }

        if (choiceFoodInfo.containsKey("수량")) {
            foodOrderDTO.setFoodCount(((Number) choiceFoodInfo.get("수량")).longValue());
        }

        return foodOrderDTO;
        
    }
}
