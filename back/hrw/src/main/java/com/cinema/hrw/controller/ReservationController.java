package com.cinema.hrw.controller;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cinema.hrw.dto.CinemaAddressDTO;
import com.cinema.hrw.dto.FoodOrderDTO;
import com.cinema.hrw.dto.ScheduleDTO;
import com.cinema.hrw.dto.SeatDTO;
import com.cinema.hrw.service.ReservationService;



@Controller
public class ReservationController {
	@Autowired
	ReservationService reservationService;
	
	   @GetMapping("/reservation/first")
   public String reservationFirst( Model model) {
      List<CinemaAddressDTO> sss = reservationService.getsss();
	  model.addAttribute("sss", sss);
	  return "reservation/reservationFirst";
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
	public String reservationThirdCombo(@RequestParam("seat_list") List<String> seatList,
    @RequestParam("person_count") String personCount,
    @RequestParam("total_price") int totalPrice,
    HttpSession session, Model model) {
    // 받은 데이터를 세션에 추가 
    session.setAttribute("seatList", seatList);
    session.setAttribute("personCount", personCount);
    session.setAttribute("totalPrice", totalPrice);

	//세션에서 스케쥴코드 출력하기
	String scheduleCode = (String) session.getAttribute("scheduleCode");
	ScheduleDTO choiceScheduleInfo= reservationService.getChoiceScheduleInfo(scheduleCode);
	String person_count = (String) session.getAttribute("personCount");
	List<String> seat_list = (List<String>) session.getAttribute("seatList");

	model.addAttribute("choiceScheduleInfo", choiceScheduleInfo);
	person_count=person_count.replace(":", " : ");
	person_count=person_count.replace("\"", "");
	person_count=person_count.replace("{", "");
	person_count=person_count.replace("}", "");
	person_count=person_count.replace(",", " , ");
	model.addAttribute("personCount", person_count);
	model.addAttribute("seatList", seat_list);
    return "reservation/reservationThird_Combo";
}

@GetMapping("/reservation/third_combo")
	public String showReservationThirdComboPage(HttpSession session , Model model) {

	//세션에서 스케쥴코드 출력하기
	String scheduleCode = (String) session.getAttribute("scheduleCode");
	ScheduleDTO choiceScheduleInfo= reservationService.getChoiceScheduleInfo(scheduleCode);
	String person_count = (String) session.getAttribute("personCount");
	List<String> seat_list = (List<String>) session.getAttribute("seatList");

	model.addAttribute("choiceScheduleInfo", choiceScheduleInfo);
	person_count=person_count.replace(":", " : ");
	person_count=person_count.replace("\"", "");
	person_count=person_count.replace("{", "");
	person_count=person_count.replace("}", "");
	person_count=person_count.replace(",", " , ");
	model.addAttribute("personCount", person_count);
	model.addAttribute("seatList", seat_list);

    return "reservation/reservationThird_Combo";
	}
	
	
	@GetMapping("/reservation/third_popcorn")
	public String reservationThirdPopcorn(HttpSession session , Model model) {
		//세션에서 스케쥴코드 출력하기
	String scheduleCode = (String) session.getAttribute("scheduleCode");
	ScheduleDTO choiceScheduleInfo= reservationService.getChoiceScheduleInfo(scheduleCode);
	String person_count = (String) session.getAttribute("personCount");
	List<String> seat_list = (List<String>) session.getAttribute("seatList");

	model.addAttribute("choiceScheduleInfo", choiceScheduleInfo);
	person_count=person_count.replace(":", " : ");
	person_count=person_count.replace("\"", "");
	person_count=person_count.replace("{", "");
	person_count=person_count.replace("}", "");
	person_count=person_count.replace(",", " , ");
	model.addAttribute("personCount", person_count);
	model.addAttribute("seatList", seat_list);

		return "reservation/reservationThird_Popcorn";
	}
	
	@GetMapping("/reservation/third_drink")
	public String reservationThirdDrink(HttpSession session , Model model) {
		//세션에서 스케쥴코드 출력하기
	String scheduleCode = (String) session.getAttribute("scheduleCode");
	ScheduleDTO choiceScheduleInfo= reservationService.getChoiceScheduleInfo(scheduleCode);
	String person_count = (String) session.getAttribute("personCount");
	List<String> seat_list = (List<String>) session.getAttribute("seatList");

	model.addAttribute("choiceScheduleInfo", choiceScheduleInfo);
	person_count=person_count.replace(":", " : ");
	person_count=person_count.replace("\"", "");
	person_count=person_count.replace("{", "");
	person_count=person_count.replace("}", "");
	person_count=person_count.replace(",", " , ");
	model.addAttribute("personCount", person_count);
	model.addAttribute("seatList", seat_list);

		return "reservation/reservationThird_Drink";
	}
	
	@GetMapping("/reservation/third_snack")
	public String reservationThirdSnack(HttpSession session , Model model) {
		//세션에서 스케쥴코드 출력하기
	String scheduleCode = (String) session.getAttribute("scheduleCode");
	ScheduleDTO choiceScheduleInfo= reservationService.getChoiceScheduleInfo(scheduleCode);
	String person_count = (String) session.getAttribute("personCount");
	List<String> seat_list = (List<String>) session.getAttribute("seatList");

	model.addAttribute("choiceScheduleInfo", choiceScheduleInfo);
	person_count=person_count.replace(":", " : ");
	person_count=person_count.replace("\"", "");
	person_count=person_count.replace("{", "");
	person_count=person_count.replace("}", "");
	person_count=person_count.replace(",", " , ");
	model.addAttribute("personCount", person_count);
	model.addAttribute("seatList", seat_list);

		return "reservation/reservationThird_Snack";
	}
	
	@PostMapping("/reservation/payment")
	public String reservationPayment(@RequestParam("choice_food_info") String choiceFoodInfoList, HttpSession session , Model model) {
		System.out.println(choiceFoodInfoList);
		session.setAttribute("choiceFoodInfoList", choiceFoodInfoList);
		String scheduleCode = (String) session.getAttribute("scheduleCode");
		ScheduleDTO choiceScheduleInfo= reservationService.getChoiceScheduleInfo(scheduleCode);
		String person_count = (String) session.getAttribute("personCount");
		List<String> seat_list = (List<String>) session.getAttribute("seatList");

		model.addAttribute("choiceScheduleInfo", choiceScheduleInfo);
		person_count=person_count.replace(":", " : ");
		person_count=person_count.replace("\"", "");
		person_count=person_count.replace("{", "");
		person_count=person_count.replace("}", "");
		person_count=person_count.replace(",", " , ");
		model.addAttribute("personCount", person_count);
		model.addAttribute("seatList", seat_list);

		return "reservation/payment";
	}
	
	@GetMapping("/reservation/paymentCompleted")
	public String reservationPaymentCompleted() {
		return "reservation/paymentCompleted";
	}

}
