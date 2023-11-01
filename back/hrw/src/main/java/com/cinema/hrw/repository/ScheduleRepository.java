package com.cinema.hrw.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cinema.hrw.entity.ScheduleEntity;

public interface ScheduleRepository extends JpaRepository<ScheduleEntity, String>{
    
}
