package com.cinema.hrw.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.cinema.hrw.dto.QuestionDTO;
import com.cinema.hrw.service.QuestionService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class QuestionController {
	
	private final QuestionService questionService;

	@GetMapping("/question/list")
	public String listForm() {
		return "/question/list";
	}
	
	@GetMapping("/question/write")
	public String writeForm() {
		return "/question/write";
	}
	
	@PostMapping("/question/write")
	public String questionSave(@ModelAttribute QuestionDTO questionDTO) {
		try {
			questionService.save(questionDTO);
			return "/question/list";
		} catch (Exception e) {
			return "/question/write";
		}
	}
	
	@GetMapping("/question/listMore")
	public String listMoreForm() {
		return "/question/listMore";
	}
	
	
}
