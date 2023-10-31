package com.cinema.hrw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cinema.hrw.dto.CinemaAddressDTO;
import com.cinema.hrw.service.CinemaAddressService;

@Controller
public class MapController {

	@GetMapping("/map")
	public String map() {
		return "map";
	}

	@RestController
	@RequestMapping("/api")
	public class CinemaApiController {

		@Autowired
		private CinemaAddressService cinemaAddressService;

		@GetMapping("/getCinemaData")
		public List<CinemaAddressDTO> getCinemaData() {
			return cinemaAddressService.getAllCinemaAddresses();
		}
	}

}