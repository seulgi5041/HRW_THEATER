package com.cinema.hrw.repository;

import com.cinema.hrw.entity.ScheduleEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

// 테이블 ScheduleEntity와 MovieEntity을 조인
// 현재 시간 이후의 특정 극장에 대한 상영 일정 정보를 검색
// 해당 일정 정보에는 영화의 제목과 등급이 포함
public interface MovieSelectRepository extends JpaRepository<ScheduleEntity, String> {
  @Query("SELECT s, m.title, m.rating FROM ScheduleEntity s " +
      "INNER JOIN s.movieCode m " +
      "WHERE STR_TO_DATE(CONCAT(s.takeDate, ' ', s.endTime), '%Y-%m-%d %H:%i:%s') >= CURRENT_TIMESTAMP " +
      "AND s.cinemaCode.cinemaCode = :cinemaCode")
  List<Object[]> findSchedulesMovieTitleRating(@Param("cinemaCode") String cinemaCode);

  // STR_TO_DATE 함수는 s.takeDate와 s.endTime 열에서 날짜 및 시간 정보를 추출
  // 현재 시간 (CURRENT_TIMESTAMP)과 비교

  // cinemaCode 열과 :cinemaCode 매개 변수 값을 비교
  // :cinemaCode는 쿼리를 실행할 때 외부에서 제공되는 매개 변수
}
