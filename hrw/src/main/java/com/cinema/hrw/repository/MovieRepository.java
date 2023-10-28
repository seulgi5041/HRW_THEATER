package com.cinema.hrw.repository;

import com.cinema.hrw.entity.MovieEntity;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface MovieRepository extends JpaRepository<MovieEntity,String>{
    List<MovieEntity> findTop10ByOrderByAdvanceReservationRateDesc(); /*실시간영화중 상위 10개만 띄우기 */
    
    MovieEntity findByCode(String code); /*영화코드로 영화정보 모두 가져오기 */

}

