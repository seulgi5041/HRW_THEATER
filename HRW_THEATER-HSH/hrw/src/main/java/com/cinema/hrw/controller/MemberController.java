package com.cinema.hrw.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.cinema.hrw.dto.MemberDTO;
import com.cinema.hrw.service.MemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MemberController {
	
	private final MemberService memberService;
	
	@GetMapping("/member/join")
	public String joinForm() {
		return "/member/join";
	}
	
	@PostMapping("/member/join")
	public String join(@ModelAttribute MemberDTO memberDTO) {
		
		memberService.join(memberDTO);
		return "/member/login";
	}
	
	@GetMapping("/member/login")
	public String loginForm() {
		return "/member/login";
	}
	
	@PostMapping("/member/login")
	public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
		MemberDTO loginResult = memberService.login(memberDTO);
		
		if (loginResult != null) {
			//login 성공
			session.setAttribute("loginId", loginResult.getUserId());
			return "main";
		} else {
			return "/member/login"; // 실패
		}
	}
	
	@GetMapping("/member/findPassword")
	public String findPasswordForm() {
		return "/member/find_password";
	}
	
	@GetMapping("/member/findId")
	public String findIdForm() {
		return "/member/find_id";
	}

}
