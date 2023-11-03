package com.cinema.hrw.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cinema.hrw.dto.FoodOrderDTO;
import com.cinema.hrw.dto.OrderDTO;
import com.cinema.hrw.dto.ScheduleDTO;
import com.cinema.hrw.dto.SeatDTO;
import com.cinema.hrw.service.ReservationService;



@Controller
public class ReservationController {
	@Autowired
	ReservationService reservationService;
	
	   @GetMapping("/reservation/first")
   public String reservationFirst( Model model) {
      
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
		ScheduleDTO scheduleCodeDTO = new ScheduleDTO();
		scheduleCodeDTO.setScheduleCode(scheduleCode);
		ScheduleDTO choiceScheduleInfo= reservationService.getChoiceScheduleInfo(scheduleCodeDTO);
	  	session.setAttribute("scheduleCode",choiceScheduleInfo);
		
		/*List<SeatDTO>remainingSeats=reservationService.getRemainingSeats(scheduleCodeDTO);*/
	 	
	
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
    @RequestParam("total_price") Long totalPrice,
    HttpSession session, Model model) {
		OrderDTO countAndPrice = OrderDTO.toPersonCountAndTotalPrice(personCount, totalPrice);
		List<SeatDTO>  seatListDTO = new ArrayList<>();
		for(String seat : seatList){
			SeatDTO seatDTO = new SeatDTO();
			seatDTO.setSeatName(seat);
			seatListDTO.add(seatDTO);
		}
		// 받은 데이터를 세션에 추가 
		session.setAttribute("seatList", seatListDTO);
		session.setAttribute("countAndPrice", countAndPrice);

		//세션에서 스케쥴코드 출력하기
		ScheduleDTO choiceScheduleInfo = (ScheduleDTO) session.getAttribute("scheduleCode");
		OrderDTO person_count = (OrderDTO) session.getAttribute("countAndPrice");
		List<SeatDTO> seat_list = (List<SeatDTO>) session.getAttribute("seatList");

		model.addAttribute("choiceScheduleInfo", choiceScheduleInfo);
		model.addAttribute("personCount", person_count);
		model.addAttribute("seatList", seat_list);
		return "reservation/reservationThird_Combo";
}

@GetMapping("/reservation/third_combo")
	public String showReservationThirdComboPage(HttpSession session , Model model) {

		//세션에서 스케쥴코드 출력하기
		ScheduleDTO choiceScheduleInfo = (ScheduleDTO) session.getAttribute("scheduleCode");
		OrderDTO person_count = (OrderDTO) session.getAttribute("countAndPrice");
		List<SeatDTO> seat_list = (List<SeatDTO>) session.getAttribute("seatList");

		model.addAttribute("choiceScheduleInfo", choiceScheduleInfo);
		model.addAttribute("personCount", person_count);
		model.addAttribute("seatList", seat_list);
		return "reservation/reservationThird_Combo";
	}
	
	
	@GetMapping("/reservation/third_popcorn")
	public String reservationThirdPopcorn(HttpSession session , Model model) {
		//세션에서 스케쥴코드 출력하기
		ScheduleDTO choiceScheduleInfo = (ScheduleDTO) session.getAttribute("scheduleCode");
		OrderDTO person_count = (OrderDTO) session.getAttribute("countAndPrice");
		List<SeatDTO> seat_list = (List<SeatDTO>) session.getAttribute("seatList");

		model.addAttribute("choiceScheduleInfo", choiceScheduleInfo);
		model.addAttribute("personCount", person_count);
		model.addAttribute("seatList", seat_list);

		return "reservation/reservationThird_Popcorn";
	}
	
	@GetMapping("/reservation/third_drink")
	public String reservationThirdDrink(HttpSession session , Model model) {
		//세션에서 스케쥴코드 출력하기
		ScheduleDTO choiceScheduleInfo = (ScheduleDTO) session.getAttribute("scheduleCode");
		OrderDTO person_count = (OrderDTO) session.getAttribute("countAndPrice");
		List<SeatDTO> seat_list = (List<SeatDTO>) session.getAttribute("seatList");

		model.addAttribute("choiceScheduleInfo", choiceScheduleInfo);
		model.addAttribute("personCount", person_count);
		model.addAttribute("seatList", seat_list);

		return "reservation/reservationThird_Drink";
	}
	
	@GetMapping("/reservation/third_snack")
	public String reservationThirdSnack(HttpSession session , Model model) {
		//세션에서 스케쥴코드 출력하기
		ScheduleDTO choiceScheduleInfo = (ScheduleDTO) session.getAttribute("scheduleCode");
		OrderDTO person_count = (OrderDTO) session.getAttribute("countAndPrice");
		List<SeatDTO> seat_list = (List<SeatDTO>) session.getAttribute("seatList");

		model.addAttribute("choiceScheduleInfo", choiceScheduleInfo);
		model.addAttribute("personCount", person_count);
		model.addAttribute("seatList", seat_list);
	
	

		return "reservation/reservationThird_Snack";
	}
	
	@PostMapping("/reservation/payment")
	public String reservationPayment(@RequestParam("choice_food_info") String choiceFoodInfoList, HttpSession session , 
	Model model) {
		List<FoodOrderDTO> foodInfoList = FoodOrderDTO.mapToFoodOrderDTOList(choiceFoodInfoList);
		session.setAttribute("foodInfoList", foodInfoList);

		String currentUserId = (String) session.getAttribute("loginId");
		if(currentUserId == null){
			String returnUrl = "/reservation/third_combo"; 
			session.setAttribute("returnUrl", returnUrl);
	
			return "redirect:/member/login";
		}else{

		//세션에서 스케쥴코드 출력하기
		ScheduleDTO choiceScheduleInfo = (ScheduleDTO) session.getAttribute("scheduleCode");
		OrderDTO person_count = (OrderDTO) session.getAttribute("countAndPrice");
		List<SeatDTO> seat_list = (List<SeatDTO>) session.getAttribute("seatList");
	

		model.addAttribute("choiceScheduleInfo", choiceScheduleInfo);
		model.addAttribute("personCount", person_count);
		model.addAttribute("seatList", seat_list);
		model.addAttribute("foodInfoList", foodInfoList);

		return "reservation/payment";}
	}

	@PostMapping("/reservation/paymentCheck")
	public String reservationpaymentCheck(@RequestParam("pay_info") String payInfo, HttpSession session) {
		OrderDTO payInfoDTO = OrderDTO.toPayInfo(payInfo);
		ScheduleDTO scheduleDTO = (ScheduleDTO) session.getAttribute("scheduleCode");
		OrderDTO person_count = (OrderDTO) session.getAttribute("countAndPrice");
		List<SeatDTO> seat_list = (List<SeatDTO>) session.getAttribute("seatList");
		List<FoodOrderDTO> foodInfoList = (List<FoodOrderDTO>) session.getAttribute("foodInfoList");
		String currentUserId = (String) session.getAttribute("loginId");

		int orderSuccessOrFail = reservationService.orderSuccessOrFailCheck(payInfoDTO, scheduleDTO, person_count, seat_list,foodInfoList, currentUserId);

		return "";
	}
	
	@PostMapping("/reservation/paymentCompleted")
	public String reservationPaymentCompleted() {
		return "reservation/paymentCompleted";
	}


}
