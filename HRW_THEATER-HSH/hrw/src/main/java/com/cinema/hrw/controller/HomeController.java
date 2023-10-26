package com.cinema.hrw.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.cinema.hrw.dto.MovieDTO;
import com.cinema.hrw.service.MovieService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class HomeController {
private final MovieService movieService;

	@GetMapping("/")
	public String index(Model model) {
		List<MovieDTO> top10MovieList = movieService.selectTop10ByAdvanceReservationRate();
        model.addAttribute("top10MovieList", top10MovieList); /*실시간영화목록중 상위 10개 전달 */

		return "main";
	}

}

