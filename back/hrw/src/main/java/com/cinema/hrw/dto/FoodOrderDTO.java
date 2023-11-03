package com.cinema.hrw.dto;


import java.util.Map;
import java.util.List;
import java.util.ArrayList;

import com.cinema.hrw.entity.FoodOrderEntity;
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
    
    private String foodName;
   
    private Long foodCount;

    private Long foodPrice;

    private int foodOrderCondition;

    private String foodImgName; /*db에들어가지도 조인하지도 않지만 서버에서 이미지 체크위해 넣는 정보*/

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




    public static List<FoodOrderDTO> mapToFoodOrderDTOList(String choiceFoodInfo) {
         ObjectMapper objectMapper = new ObjectMapper();
            try {
                Map<String, Object>[] choiceFoodInfoMaps = objectMapper.readValue(choiceFoodInfo, Map[].class);
                List<FoodOrderDTO> choiceFoodInfoList =new ArrayList<>();
                for(Map<String, Object> choiceFoodInfoMap : choiceFoodInfoMaps ){
                    FoodOrderDTO foodOrderDTO = FoodOrderDTO.mapToFoodOrderDTO(choiceFoodInfoMap);
                    choiceFoodInfoList.add(foodOrderDTO);
                }
                return choiceFoodInfoList;

            } catch (JsonProcessingException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                return null;
            }
        
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

        if (choiceFoodInfo.containsKey("이미지명")) {
            foodOrderDTO.setFoodImgName((String) choiceFoodInfo.get("이미지명"));
        }

        return foodOrderDTO;
        
    }
}
