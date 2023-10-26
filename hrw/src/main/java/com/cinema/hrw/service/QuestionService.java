package com.cinema.hrw.service;

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

}
