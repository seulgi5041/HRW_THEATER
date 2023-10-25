package com.cinema.hrw.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cinema.hrw.dto.MemberDTO;
import com.cinema.hrw.service.MemberService;
import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class MemberController {
	
    // 멤버 서비스 주입
	private final MemberService memberService;
	
	// 회원 가입 폼 요청
	@GetMapping("/member/join")
	public String joinForm() {
		return "/member/join";
	}
	
	// 회원 가입 처리
	@PostMapping("/member/join")
	public String join(@ModelAttribute MemberDTO memberDTO, Model model) {
	    try {
	        memberService.join(memberDTO);
	        return "redirect:/member/login";  // 가입 성공 시 리다이렉트
	    } catch (Exception e) {
	        model.addAttribute("errorMessage", e.getMessage());
	        return "/member/join";  // 오류 발생 시, 다시 회원 가입 페이지로 이동
	    }
	}

	
	// 로그인 폼 요청
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
	        session.setAttribute("loginId", loginResult.getUserId()); 
	        return "main";
	    } else {
	        // 로그인 실패
	    	session.setAttribute("loginError", "아이디 또는 비밀번호가 일치하지 않습니다.");
	        return "/member/login";
	    }
	}
	
	// 비밀번호 찾기 폼 요청
	@GetMapping("/member/findPassword")
	public String findPasswordForm() {
		return "/member/find_password";
	}
	
	// 비밀번호 찾기 처리 (보안상 직접 비밀번호를 보여주는 것은 위험합니다.)
	@PostMapping("/member/findPassword")
	public String findPassword(@ModelAttribute MemberDTO memberDTO, Model model) {
	    MemberDTO foundMember = memberService.searchPw(memberDTO);
	    if (foundMember != null) {
	        model.addAttribute("foundUserId", foundMember.getUserId());
	        model.addAttribute("foundUserPassword", foundMember.getUserPassword());
	        return "/member/find_password_ok";
	    } else {
	        return "/member/find_password_ng";
	    }		
	}

	
	// ID 찾기 폼 요청
	@GetMapping("/member/findId")
	public String findIdForm() {
		return "/member/find_id";
	}
	
	// ID 찾기 처리
	@PostMapping("/member/findId")
	public ModelAndView findId(@ModelAttribute MemberDTO memberDTO) {
	    ModelAndView mv = new ModelAndView();
	    MemberDTO foundMember = memberService.searchId(memberDTO);

	    if (foundMember != null) {
	        mv.addObject("foundId", foundMember.getUserId());
	        mv.setViewName("/member/find_id_ok");
	    } else {
	        mv.setViewName("/member/find_id_ng");
	    }
	    return mv;
	}

	
	// 로그아웃 처리 (세션 종료)
	@GetMapping("/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "main";
	}
	
	// 현재 사용자 정보 폼 요청
	@GetMapping("/member/userInfo")
	public String userInfoForm(HttpSession session, Model model) {
	    String currentUserId = (String) session.getAttribute("loginId");
	    System.out.println(currentUserId);
	    if(currentUserId != null) {
	        MemberDTO currentUserInfo = memberService.getCurrentUserInfo(currentUserId);
	        model.addAttribute("userInfo", currentUserInfo);
	    }
	    return "/member/userInfo";
	}
	
	// 현재 사용자 정보 업데이트 요청
	@PostMapping("/member/update")
	public String userUpdate(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
	    try {
	        memberService.updateUserInfo(memberDTO); // 정보 업데이트 로직 호출
	        session.setAttribute("message", "정보가 성공적으로 업데이트되었습니다.");
	        return "redirect:/member/userInfo";
	    } catch (Exception e) {
	        session.setAttribute("message", "정보 업데이트를 실패하였습니다.");
	        return "/member/userInfo"; 
	    }
	}
	
	// 현재 사용자 삭제 요청
	@PostMapping("/member/delete")
	public String userDelete(@ModelAttribute MemberDTO memberDTO, HttpSession session) {
		memberService.deleteId(memberDTO);
		session.invalidate();
		return "redirect:/";
	}
}
