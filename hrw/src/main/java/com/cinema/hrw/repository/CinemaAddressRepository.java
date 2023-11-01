package com.cinema.hrw.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

import com.cinema.hrw.entity.CinemaAddressEntity;

public interface CinemaAddressRepository extends JpaRepository<CinemaAddressEntity, String> {
  @Query("SELECT DISTINCT c.local FROM CinemaAddressEntity c ORDER BY CASE c.local " +
      "WHEN '서울' THEN 1 " +
      "WHEN '경기' THEN 2 " +
      "WHEN '인천' THEN 3 " +
      "WHEN '부산' THEN 4 " +
      "WHEN '대구' THEN 5 " +
      "WHEN '광주' THEN 6 " +
      "WHEN '대전' THEN 7 " +
      "WHEN '울산' THEN 8 " +
      "WHEN '세종' THEN 9 " +
      "WHEN '강원' THEN 10 " +
      "WHEN '충청' THEN 11 " +
      "WHEN '전라' THEN 12 " +
      "WHEN '경상' THEN 13 " +
      "WHEN '제주' THEN 14 " +
      "ELSE 15 END")
  List<String> findAllLocalValues();

  @Query("SELECT c.cinemaName FROM CinemaAddressEntity c WHERE c.local = :local")
  List<String> findCinemaNamesByLocal(@Param("local") String local);
}