<<<<<<< HEAD
package com.cinema.hrw.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cinema.hrw.dto.CinemaAddressDTO;
import com.cinema.hrw.entity.CinemaAddressEntity;
import com.cinema.hrw.service.MemberService;
import com.cinema.hrw.service.MovieService;
import com.cinema.hrw.service.QuestionService;
import com.cinema.hrw.service.ReservationService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ReservationController {
	
	private final ReservationService reservationService;
	
	@GetMapping("/reservation/first")
	public String reservationFirst(Model model) {
		List<CinemaAddressDTO> allCinemaList = reservationService.findAll();
		model.addAttribute("allCinemaList", allCinemaList);
		
		return "/reservation/reservationFirst";
//		// HttpSession에서 "loginId" 속성을 가져옴
//		String loginId = (String) session.getAttribute("loginId");
//		
//		// "loginId" 속성이 존재하면 reservationFirst 페이지로 이동
//		if (loginId != null && !loginId.isEmpty()) {
//			return "reservation/reservationFirst";
//		} else {
//			session.setAttribute("loginError", "로그인 후 이용하실 수 있습니다.");
//			return "redirect:/member/login";
//		}
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
	
	@GetMapping("/getCinemaNamesInLocation")
    @ResponseBody
    public List<String> getCinemaNamesInLocation(@RequestParam("location") String location) {
        List<String> cinemaNames = reservationService.getCinemaNamesInLocation(location);
        return cinemaNames;
    }
}



=======
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
>>>>>>> 167ea023502192dc31f8cd1a7cbf773bda115a24
