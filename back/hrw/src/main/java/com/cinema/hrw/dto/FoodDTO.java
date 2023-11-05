package com.cinema.hrw.dto;


import com.cinema.hrw.entity.FoodEntity;



import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@NoArgsConstructor
@ToString
public class FoodDTO {
    private String foodName;

    private Long foodPrice;

    private String foodImgName;
    
    private String foodDescription; 

    public static FoodDTO toFoodDTO(FoodEntity foodEntity){
        FoodDTO foodDTO = new FoodDTO();
        foodDTO.setFoodName(foodEntity.getFoodName());
        foodDTO.setFoodPrice(foodEntity.getFoodPrice());
        foodDTO.setFoodImgName(foodEntity.getFoodImgName());
        foodDTO.setFoodDescription(foodEntity.getFoodDescription());
        return foodDTO;
    }
}
