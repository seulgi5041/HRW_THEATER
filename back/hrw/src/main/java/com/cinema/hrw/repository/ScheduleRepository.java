package com.cinema.hrw.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.cinema.hrw.entity.ScheduleEntity;

public interface ScheduleRepository extends JpaRepository<ScheduleEntity, String>{
    @Query("SELECT s.movieCode, m.title, m.rating, s.takeDate, s.startTime, s.endTime, c.cinemaName, " +
    "s.auditorium, s.teenagerPrice, s.adultPrice, s.disabledPrice " +
    "FROM ScheduleEntity s " +
    "INNER JOIN MovieEntity m ON m.code = s.movieCode " +
    "INNER JOIN CinemaAddressEntity c ON s.cinemaCode = c.cinemaCode " +
    "WHERE s.scheduleCode = :scheduleCode")
    Object[] findScheduleDetailsByScheduleCode(@Param("scheduleCode") String scheduleCode);
}
