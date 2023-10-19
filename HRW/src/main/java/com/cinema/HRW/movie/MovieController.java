package com.cinema.HRW.movie;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/movielist")
public class MovieController {
	@RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
	public String home() {
		System.out.println("[AdminHomeController] home()");
		
		String nextPage = "admin/home";
		
		return nextPage;
		
	}
}
