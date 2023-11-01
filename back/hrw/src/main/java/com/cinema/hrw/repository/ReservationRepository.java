package com.cinema.hrw.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.cinema.hrw.entity.CinemaAddressEntity;

@Repository
public interface ReservationRepository extends JpaRepository<CinemaAddressEntity, String>{

   @Query("SELECT ca.cinemaName FROM CinemaAddressEntity ca WHERE ca.local = '서울'")
   List<String> findCinemaNamesInSeoul();
   
}