package com.cinema.hrw.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.cinema.hrw.dto.ScheduleDTO;
import com.cinema.hrw.dto.SeatDTO;
import com.cinema.hrw.service.ReservationService;



@Controller
public class ReservationController {
	@Autowired
	ReservationService reservationService;
	
	@GetMapping("/reservation/first")
	public String reservationFirst() {
	
			return "reservation/reservationFirst";
		
	}
	
	@PostMapping("/reservation/second")
	public String reservationSecond(@RequestParam("scheduleCode")  String schedule_code, Model model, HttpSession session) {
	//String  scheduleCode = scheduleDTO.getScheduleCode();
		System.out.println("컨트롤러 1 " + schedule_code);
	session.setAttribute("scheduleCode",schedule_code); 
	
	List<SeatDTO> remainingSeats = reservationService.getRemainingSeats(schedule_code);
	System.out.println("컨트롤러 2 " + schedule_code);
	Object[] choiceScheduleInfo= reservationService.getChoiceScheduleInfo(schedule_code); //{choiceScheduleDTO,choiceMovieDTO,choiceCinemaAddressDTO}

	model.addAttribute("choiceSchedule", choiceScheduleInfo[0]);
	model.addAttribute("choiceMovie", choiceScheduleInfo[1]);
	model.addAttribute("choiceCinemaAddress", choiceScheduleInfo[2]);
	model.addAttribute("remainingSeats", remainingSeats);
	//model.addAttribute("choiceScheduleInfo", choiceScheduleInfo);
	String nextPage = "reservation/reservationSecond";
	return nextPage;
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
