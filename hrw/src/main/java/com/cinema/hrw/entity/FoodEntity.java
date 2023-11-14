package com.cinema.hrw.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.cinema.hrw.dto.FoodDTO;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "foodTBL")
public class FoodEntity {
    @Id
    private String foodName;

    @Column 
    private Long foodPrice;

    @Column
    private String foodImgName;

    @Column
    private String foodDescription; 

    public static FoodEntity toFoodEntity(FoodDTO foodDTO){
        FoodEntity foodEntity = new FoodEntity();
        foodEntity.setFoodName(foodDTO.getFoodName());
        foodEntity.setFoodPrice(foodDTO.getFoodPrice());
        foodEntity.setFoodImgName(foodDTO.getFoodImgName());
        foodEntity.setFoodDescription(foodDTO.getFoodDescription());
        return foodEntity;
    }

}