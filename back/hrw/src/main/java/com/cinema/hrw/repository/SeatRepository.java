package com.cinema.hrw.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cinema.hrw.entity.OrderEntity;
import com.cinema.hrw.entity.SeatEntity;

@Repository
public interface SeatRepository extends JpaRepository<SeatEntity,Integer>{

    List<SeatEntity> findByOrderCode(OrderEntity oderCode);

    
}
