package com.cinema.hrw.repository;
import com.cinema.hrw.entity.OldMovieEntity;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
@Repository
public interface OldMovieRepository extends JpaRepository<OldMovieEntity,String>{
    OldMovieEntity findByCode(String code); /*영화코드로 영화정보 모두 가져오기 */

}


