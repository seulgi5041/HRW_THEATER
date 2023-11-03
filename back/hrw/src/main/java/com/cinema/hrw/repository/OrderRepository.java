package com.cinema.hrw.repository;

import java.time.LocalDate;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.cinema.hrw.entity.OrderEntity;

@Repository
public interface OrderRepository extends JpaRepository<OrderEntity,String>{

    int countByOrderDate(LocalDate insertDate);

    
}
