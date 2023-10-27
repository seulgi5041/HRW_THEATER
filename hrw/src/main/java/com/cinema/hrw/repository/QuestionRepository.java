package com.cinema.hrw.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.cinema.hrw.entity.QuestionEntity;

public interface QuestionRepository extends JpaRepository<QuestionEntity, Long>{
	
	Page<QuestionEntity> findAll(Pageable pageable);

}
