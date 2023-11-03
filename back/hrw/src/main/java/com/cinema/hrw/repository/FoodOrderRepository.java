package com.cinema.hrw.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cinema.hrw.entity.FoodOrderEntity;

@Repository
public interface FoodOrderRepository extends JpaRepository<FoodOrderEntity,Integer>{

    
}
