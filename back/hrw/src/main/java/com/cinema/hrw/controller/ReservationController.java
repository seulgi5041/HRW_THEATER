package com.cinema.hrw.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cinema.hrw.dto.ScheduleDTO;
import com.cinema.hrw.dto.SeatDTO;
import com.cinema.hrw.service.ReservationService;



@Controller
public class ReservationController {
	@Autowired
	ReservationService reservationService;
	
	   @GetMapping("/reservation/first")
   public String reservationFirst(HttpSession session) {
      // HttpSession에서 "loginId" 속성을 가져옴
      String loginId = (String) session.getAttribute("loginId");
      
      // "loginId" 속성이 존재하면 reservationFirst 페이지로 이동
      if (loginId != null && !loginId.isEmpty()) {
         return "reservation/reservationFirst";
      } else {
         session.setAttribute("loginError", "로그인 후 이용하실 수 있습니다.");
         return "redirect:/member/login";
      }
   }
   
   @GetMapping("/getSeoulCinemaNames")
   @ResponseBody
   public List<String> getSeoulCinemaNames() {
       List<String> seoulCinemaNames = reservationService.getCinemaNamesInSeoul();
       return seoulCinemaNames;
   }

	
	@PostMapping("/reservation/second")
	public String reservationSecond(@RequestParam("scheduleCode") String scheduleCode, Model model, HttpSession session) {
	  	session.setAttribute("scheduleCode",scheduleCode); 
		/*List<SeatDTO>remainingSeats=reservationService.getRemainingSeats(scheduleCode);*/
	 	ScheduleDTO choiceScheduleInfo= reservationService.getChoiceScheduleInfo(scheduleCode);
	
        // 사용된좌석체크위해 임시로 정보 넣기
        List<SeatDTO> remainingSeats = new ArrayList<>();
		String[]aa={"A열4", "A열13", "G열12", "G열9"};
		for(String aaa:aa){
			SeatDTO ss = new SeatDTO();
			ss.setSeatName(aaa);
			remainingSeats.add(ss);
		}

	 model.addAttribute("remainingSeats", remainingSeats);
	model.addAttribute("choiceScheduleInfo", choiceScheduleInfo);
	String nextPage = "reservation/reservationSecond";
	return nextPage;
}
	
	
	@PostMapping("/reservation/third_combo")
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
