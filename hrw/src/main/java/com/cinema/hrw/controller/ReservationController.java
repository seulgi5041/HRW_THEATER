package com.cinema.hrw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReservationController {
	
	@GetMapping("/reservation/first")
	public String reservationFirst() {
		return "reservation/reservationFirst";
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
