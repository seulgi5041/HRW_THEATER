package com.cinema.hrw.repository;

import com.cinema.hrw.entity.ScheduleEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface MovieSelectRepository extends JpaRepository<ScheduleEntity, String> {
  @Query("SELECT s, m.title, m.rating FROM ScheduleEntity s " +
      "INNER JOIN s.movieCode m " +
      "WHERE STR_TO_DATE(CONCAT(s.takeDate, ' ', s.endTime), '%Y-%m-%d %H:%i:%s') >= CURRENT_TIMESTAMP " +
      "AND s.cinemaCode.cinemaCode = :cinemaCode")
  List<Object[]> findSchedulesMovieTitleRating(@Param("cinemaCode") String cinemaCode);
}
