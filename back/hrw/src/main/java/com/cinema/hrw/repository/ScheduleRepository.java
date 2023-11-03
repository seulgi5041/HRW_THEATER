package com.cinema.hrw.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.cinema.hrw.entity.ScheduleEntity;

@Repository
public interface ScheduleRepository extends JpaRepository<ScheduleEntity, String>{
    @Query("SELECT ca.cinemaName FROM CinemaAddressEntity ca WHERE ca.local = '서울'")
   ScheduleEntity findCinemaNamesInSeoul();
}
