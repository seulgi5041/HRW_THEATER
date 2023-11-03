package com.cinema.hrw.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.cinema.hrw.dto.FoodOrderDTO;
import com.cinema.hrw.dto.OrderDTO;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "food_orderTBL")	
public class FoodOrderEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int num;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "order_code", referencedColumnName = "orderCode")
    private OrderEntity orderCode;

    @Column
    private String foodName;

    @Column
    private Long foodCount;

    @Column
    private Long foodPrice;

    @Column 
    private int foodOrderCondition;

    @Transient
    private String foodImgName;


    public static FoodOrderEntity toFoodOrderEntity(FoodOrderDTO foodOrderDTO){
        FoodOrderEntity foodOrderEntity = new FoodOrderEntity();
        foodOrderEntity.setNum(foodOrderDTO.getNum());
        foodOrderEntity.setOrderCode(OrderEntity.toOrderEntity(foodOrderDTO.getOrderCode()));
        foodOrderEntity.setFoodName(foodOrderDTO.getFoodName());
        foodOrderEntity.setFoodCount(foodOrderDTO.getFoodCount());
        foodOrderEntity.setFoodPrice(foodOrderDTO.getFoodPrice());
        foodOrderEntity.setFoodOrderCondition(foodOrderDTO.getFoodOrderCondition());
            return foodOrderEntity;
    }
}
