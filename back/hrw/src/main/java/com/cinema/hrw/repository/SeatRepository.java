package com.cinema.hrw.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.cinema.hrw.entity.SeatEntity;

@Repository
public interface SeatRepository extends JpaRepository<SeatEntity,Integer>{

    
}
