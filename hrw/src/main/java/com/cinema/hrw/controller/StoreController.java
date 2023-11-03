package com.cinema.hrw.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StoreController {
	@GetMapping("/foodstore/store")
	public String store() {
		return "/foodstore/store";
	}
	
	@GetMapping("/foodstore/popcorn")
	public String popcorn() {
		return "/foodstore/popcorn_store";
	}
	
	@GetMapping("/foodstore/drink")
	public String drink() {
		return "/foodstore/drink_store";
	}
	
	@GetMapping("/foodstore/snack")
	public String snack() {
		return "/foodstore/snack_store";
	}
	


}
