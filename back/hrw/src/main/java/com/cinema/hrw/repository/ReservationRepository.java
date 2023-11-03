package com.cinema.hrw.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.cinema.hrw.entity.CinemaAddressEntity;
import com.cinema.hrw.entity.ScheduleEntity;

@Repository
public interface ReservationRepository extends JpaRepository<CinemaAddressEntity, String>{

   @Query("SELECT ca.cinemaName FROM CinemaAddressEntity ca WHERE ca.local = '서울'")
   List<String> findCinemaNamesInSeoul();

   @Query("SELECT s.auditorium, s.startTime, s.endTime, s.takeDate, s.movieCode.title, "+
   "s.movieCode.rating, s.cinemaCode.cinemaName, s.adultPrice, s.disabledPrice, s."+
   "teenagerPrice FROM ScheduleEntity s JOIN s.movieCode m JOIN s.cinemaCode c WHERE s.scheduleCode = :scheduleCode")
    ScheduleEntity findScheduleInfoByScheduleCode(@Param("scheduleCode") String scheduleCode);
}
   
