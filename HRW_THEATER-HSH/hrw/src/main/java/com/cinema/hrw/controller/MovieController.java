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
public class MovieController {
    private final MovieService movieService;

    @GetMapping("/movielist")
    public String Movielist(Model model){
        List<MovieDTO> allMovieLiat = movieService.selectAllTitle();
        model.addAttribute("allMovie", allMovieLiat);
        return "movie/movie_list";
    }
    
}
