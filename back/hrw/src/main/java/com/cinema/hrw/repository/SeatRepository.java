package com.cinema.hrw.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.cinema.hrw.entity.SeatEntity;

public interface SeatRepository extends JpaRepository<SeatEntity, String>  {
    @Query("SELECT s.seatName from SeatEntity s inner join OrderEntity o on o.orderCode = s.orderCode where o.scheduleCode = :schedule_code")
    List<SeatEntity> findSeatNameByScheduleCode(@Param("schedule_code") String schedule_code);

    
}
