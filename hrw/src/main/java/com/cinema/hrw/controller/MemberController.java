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
	
    // 멤버 서비스 의존성 주입
	private final MemberService memberService;
	
	// 회원 가입 페이지 출력 요청
	@GetMapping("/member/join")
	public String joinForm() {
		return "/member/join";
	}
	
	// 회원 가입 처리
	@PostMapping("/member/join")
	public String join(@ModelAttribute MemberDTO memberDTO) {
		memberService.join(memberDTO);
		return "/member/login";
	}
	
	// 로그인 페이지 출력 요청
	@GetMapping("/member/login")
	public String loginForm() {
		return "/member/login";
	}
	
	// 로그인 처리
	@PostMapping("/member/login")
	public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
	    MemberDTO loginResult = memberService.login(memberDTO);
	    
	    // 로그인 성공시, 세션에 ID 저장
	    if (loginResult != null) {
	        session.setAttribute("loginId", loginResult.getUserName()); 
	        return "main";
	    } else {
	        // 로그인 실패시
	        return "/member/login";
	    }
	}
	
	// 비밀번호 찾기 페이지 출력 요청
	@GetMapping("/member/findPassword")
	public String findPasswordForm() {
		return "/member/find_password";
	}
	
	// 비밀번호 찾기 처리 (현재 논리가 누락되어 있음)
	@PostMapping("/member/findPassword")
	public String findPassword(@ModelAttribute MemberDTO memberDTO) {
		MemberDTO foundMember = memberService.searchPw(memberDTO);
		if (foundMember != null) {
			// 회원 정보가 있을 경우 출력 페이지	
			return "/member/find_password_ok";
		} else {
			return "/member/find_password_ng";
		}
		
	}
	
	// ID 찾기 페이지 출력 요청
	@GetMapping("/member/findId")
	public String findIdForm() {
		return "/member/find_id";
	}
	
	// ID 찾기 처리 (현재 논리가 누락되어 있음)
	@PostMapping("/member/findId")
	public String findId(@ModelAttribute MemberDTO memberDTO) {
	    MemberDTO foundMember = memberService.searchId(memberDTO);

	    if (foundMember != null) {
	        // 회원 정보가 있을 경우 출력 페이지
	        return "/member/find_id_ok";
	    } else {
	        // 회원 정보가 없을 경우 출력 페이지
	        return "/member/find_id_ng";
	    }
	}

	
	// 로그아웃 처리 (세션 종료)
	@GetMapping("/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "main";
	}
	
	// 사용자 정보 페이지 출력 요청
	@GetMapping("/member/userInfo")
	public String userInfoForm() {
		return "/member/userInfo";
	}
	
	// 사용자 프로필 회원 수정 요청
	@PostMapping("/member/update")
	public String userUpdate() {
		return null;
	}
	
	// 사용자 탈퇴 요청
	@PostMapping("/mmeber/delete")
	public String userDelete() {
		return null;
	}

}
