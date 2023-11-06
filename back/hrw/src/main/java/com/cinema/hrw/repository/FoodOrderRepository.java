package com.cinema.hrw.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.cinema.hrw.entity.FoodOrderEntity;
import com.cinema.hrw.entity.OrderEntity;

@Repository
public interface FoodOrderRepository extends JpaRepository<FoodOrderEntity,Integer>{

    @Query("SELECT f.foodName, f.foodDescription, f.foodImgName, f.foodPrice, o.foodCount, o.foodOrderCondition, o.foodPrice FROM FoodOrderEntity o JOIN FoodEntity f ON f.foodName = o.foodName WHERE o.orderCode = :orderCode")
    List<Object[]> getFoodInfoByOrderCode(@Param("orderCode") OrderEntity orderCode);

    
}
