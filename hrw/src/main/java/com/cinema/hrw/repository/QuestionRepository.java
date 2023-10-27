<<<<<<< HEAD
package com.cinema.hrw.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.cinema.hrw.entity.QuestionEntity;

public interface QuestionRepository extends JpaRepository<QuestionEntity, Long>{
	
	Page<QuestionEntity> findAll(Pageable pageable);

}
=======
package com.cinema.hrw.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.cinema.hrw.entity.QuestionEntity;

public interface QuestionRepository extends JpaRepository<QuestionEntity, Long>{
	
	Page<QuestionEntity> findAll(Pageable pageable);

}
>>>>>>> 03b06105d6f9e96da199e74b8d3458d69e5fafb9
