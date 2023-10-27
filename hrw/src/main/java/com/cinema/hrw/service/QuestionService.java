<<<<<<< HEAD
package com.cinema.hrw.service;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.cinema.hrw.dto.QuestionDTO;
import com.cinema.hrw.entity.QuestionEntity;
import com.cinema.hrw.repository.QuestionRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QuestionService {
	
	private final QuestionRepository questionRepository;

	public void save(QuestionDTO questionDTO) {
		QuestionEntity questionEntity = QuestionEntity.toQuestionEntity(questionDTO);
		questionRepository.save(questionEntity);
	}
	
	public Page<QuestionEntity> findPaginated(int pageNo, int pageSize) {
	    Pageable pageable = PageRequest.of(pageNo - 1, pageSize, Sort.by(Sort.Direction.DESC, "idx")); // 페이지 번호는 0부터 시작합니다.
	    return questionRepository.findAll(pageable);
	}
	
	public Optional<QuestionEntity> findById(Long idx) {
	    return questionRepository.findById(idx);
	}

	
	

}
=======
package com.cinema.hrw.service;

import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.cinema.hrw.dto.QuestionDTO;
import com.cinema.hrw.entity.QuestionEntity;
import com.cinema.hrw.repository.QuestionRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QuestionService {
	
	private final QuestionRepository questionRepository;

	public void save(QuestionDTO questionDTO) {
		QuestionEntity questionEntity = QuestionEntity.toQuestionEntity(questionDTO);
		questionRepository.save(questionEntity);
	}
	
	public Page<QuestionEntity> findPaginated(int pageNo, int pageSize) {
	    Pageable pageable = PageRequest.of(pageNo - 1, pageSize, Sort.by(Sort.Direction.DESC, "idx")); // 페이지 번호는 0부터 시작합니다.
	    return questionRepository.findAll(pageable);
	}
	
	public Optional<QuestionEntity> findById(Long idx) {
	    return questionRepository.findById(idx);
	}

	
	

}
>>>>>>> 03b06105d6f9e96da199e74b8d3458d69e5fafb9
