package com.cinema.hrw.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.cinema.hrw.entity.ScheduleEntity;

import java.util.List;

public interface ScheduleRepository extends JpaRepository<ScheduleEntity, String> {
    @Query("SELECT s FROM ScheduleEntity s " +
           "INNER JOIN s.movieCode m " +
           "WHERE CONCAT(s.takeDate, ' ', s.endTime) > CURRENT_TIMESTAMP " +
           "AND CONCAT(s.takeDate, ' ', s.startTime) > CURRENT_TIMESTAMP " +
           "AND FUNCTION('TIME_FORMAT', CONCAT(s.takeDate, ' ', s.startTime), '%H:%i:%s') > FUNCTION('TIME_FORMAT', CURRENT_TIMESTAMP, '%H:%i:%s') " +
           "AND m.code = :movieCode")
    List<ScheduleEntity> findSchedulesAndCurrentTime(@Param("movieCode") String movieCode);


    // New method for fetching available dates
    @Query("SELECT DISTINCT s.takeDate FROM ScheduleEntity s WHERE s.movieCode.code = :movieCode")
    List<String> findCurrentDatesByMovieCode(@Param("movieCode") String movieCode);
}
