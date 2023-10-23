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
	
	//생성자 주입.
	
	private final MemberService memberService;
	
	
	// 회원가입 페이지 출력 요청.
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
	        session.setAttribute("loginId", loginResult.getUserName()); // 예를 들어, 'getId()'는 사용자의 ID를 반환한다고 가정
	        return "main";
	    } else {
	        return "/member/login"; // 실패 
	    }
	}

	
	@GetMapping("/member/findPassword")
	public String findPasswordForm() {
		return "/member/find_password";
	}
	
	@PostMapping("/member/findPassword")
	public String findPassword() {
		// 회원 정보 있을시 보여주는 페이지
		return "/member/find_password_ok";
		
		// 회원 정보 없을 시 보여주는 페이지
		// return "/member/find_password_ng";
	}
	
	@GetMapping("/member/findId")
	public String findIdForm() {
		return "/member/find_id";
	}
	
	@PostMapping("/member/findId")
	public String findId(@ModelAttribute MemberDTO memberDTO) {
		// 회원 정보 있을시 보여주는 페이지 
		
		return "/member/find_id_ok";
		
		// 회원 정보 없을시 보여주는 페이지
		// return "/member/find_id_ng";
	}
	
	@GetMapping("/member/logout")		// 로그아웃 버튼 누르면 세션 무효화.
	public String logout(HttpSession session) {
		session.invalidate();
		return "main";
	}
	
	@GetMapping("/member/userInfo")
	public String userInfoForm() {
		return "/member/userInfo";
	}

}
