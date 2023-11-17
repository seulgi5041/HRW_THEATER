package com.cinema.hrw.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

import com.cinema.hrw.entity.CinemaAddressEntity;

public interface CinemaAddressRepository extends JpaRepository<CinemaAddressEntity, String> {
  @Query("SELECT DISTINCT c.local FROM CinemaAddressEntity c " +
      "ORDER BY CASE " +
      "WHEN c.local = '서울' THEN 1 " +
      "WHEN c.local = '경기' THEN 2 " +
      "WHEN c.local = '인천' THEN 3 " +
      "WHEN c.local = '부산' THEN 4 " +
      "WHEN c.local = '대구' THEN 5 " +
      "WHEN c.local = '광주' THEN 6 " +
      "WHEN c.local = '대전' THEN 7 " +
      "WHEN c.local = '울산' THEN 8 " +
      "WHEN c.local = '세종' THEN 9 " +
      "WHEN c.local = '강원' THEN 10 " +
      "WHEN c.local = '충청' THEN 11 " +
      "WHEN c.local = '전라' THEN 12 " +
      "WHEN c.local = '경상' THEN 13 " +
      "WHEN c.local = '제주' THEN 14 " +
      "ELSE 15 END")
  List<String> findAllLocalValues();

  @Query("SELECT c.cinemaName, c.cinemaCode FROM CinemaAddressEntity c WHERE c.local = :local ORDER BY " +
      "CASE " +
      "WHEN c.local = '서울' THEN 1 " +
      "WHEN c.local = '경기' THEN 2 " +
      "WHEN c.local = '인천' THEN 3 " +
      "WHEN c.local = '부산' THEN 4 " +
      "WHEN c.local = '대구' THEN 5 " +
      "WHEN c.local = '광주' THEN 6 " +
      "WHEN c.local = '대전' THEN 7 " +
      "WHEN c.local = '울산' THEN 8 " +
      "WHEN c.local = '세종' THEN 9 " +
      "WHEN c.local = '강원' THEN 10 " +
      "WHEN c.local = '충청' THEN 11 " +
      "WHEN c.local = '전라' THEN 12 " +
      "WHEN c.local = '경상' THEN 13 " +
      "WHEN c.local = '제주' THEN 14 " +
      "ELSE 15 END")
  List<String> findCinemaNamesByLocal(@Param("local") String local);

  

}