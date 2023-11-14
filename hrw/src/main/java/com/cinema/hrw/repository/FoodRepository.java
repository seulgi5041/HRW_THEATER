package com.cinema.hrw.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cinema.hrw.entity.FoodEntity;

@Repository
public interface FoodRepository extends JpaRepository<FoodEntity, String>{

    FoodEntity findByFoodName(String foodName);
    
}