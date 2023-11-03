package com.cinema.hrw.controller;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cinema.hrw.dto.QuestionDTO;
import com.cinema.hrw.entity.QuestionEntity;
import com.cinema.hrw.service.QuestionService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class QuestionController {
	
	private final QuestionService questionService;

	@GetMapping("/question/list")
	public String listForm(Model model, @RequestParam(defaultValue = "1") int page) {
	    int pageSize = 5;
	    Page<QuestionEntity> pageQuestions = questionService.findPaginated(page, pageSize);
	    model.addAttribute("currentPage", page);
	    model.addAttribute("totalPages", pageQuestions.getTotalPages());
	    model.addAttribute("totalItems", pageQuestions.getTotalElements());
	    model.addAttribute("questions", pageQuestions.getContent());
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
			return "redirect:/question/list"; // 데이터 저장 후 페이지를 리디렉션합니다.
		} catch (Exception e) {
			return "/question/write";
		}
	}
	
	
	@GetMapping("/question/listMore")
	public String listMoreForm(@RequestParam Long idx, Model model) {
	    Optional<QuestionEntity> optionalQuestion = questionService.findById(idx);
	    if(optionalQuestion.isPresent()) {
	        QuestionEntity question = optionalQuestion.get();
	        model.addAttribute("question", question);
	    }
	    return "/question/listMore";
	}

	
}
