package com.cinema.hrw.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReservationController {
	
	@GetMapping("/reservation/first")
	public String reservationFirst(HttpSession session) {
		// HttpSession에서 "loginId" 속성을 가져옴
		String loginId = (String) session.getAttribute("loginId");
    
		// "loginId" 속성이 존재하면 reservationFirst 페이지로 이동
		if (loginId != null && !loginId.isEmpty()) {
			return "reservation/reservationFirst";
		} else {
			// "loginId" 속성이 존재하지 않으면 로그인 페이지로 리다이렉트
			return "redirect:/member/login";
		}
	}
	
	@GetMapping("/reservation/second")
	public String reservationSecond() {
		return "reservation/reservationSecond";
	}
	
	@GetMapping("/reservation/third_combo")
	public String reservationThirdCombo() {
		return "reservation/reservationThird_Combo";
	}
	
	@GetMapping("/reservation/third_popcorn")
	public String reservationThirdPopcorn() {
		return "reservation/reservationThird_Popcorn";
	}
	
	@GetMapping("/reservation/third_drink")
	public String reservationThirdDrink() {
		return "reservation/reservationThird_Drink";
	}
	
	@GetMapping("/reservation/third_snack")
	public String reservationThirdSnack() {
		return "reservation/reservationThird_Snack";
	}
	
	@GetMapping("/reservation/payment")
	public String reservationPayment() {
		return "reservation/payment";
	}
	
	@GetMapping("/reservation/paymentCompleted")
	public String reservationPaymentCompleted() {
		return "reservation/paymentCompleted";
	}

}
