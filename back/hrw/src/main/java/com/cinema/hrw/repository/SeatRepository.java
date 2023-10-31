package com.cinema.hrw.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cinema.hrw.entity.SeatEntity;

public interface SeatRepository extends JpaRepository<SeatEntity, String>  {
    

    
}
