package com.cinema.hrw.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

        @GetMapping("/movieinfo")
        public String movieinfo(MovieDTO movieDTO, Model model){
        MovieDTO choicedMovieInfo = movieService.selectMovieInfo(movieDTO); /*DTO에 코드만 들어있다 코드받아서 정보 받아오기 */

        model.addAttribute("MovieInfo", choicedMovieInfo);

        return "movie/movie_info";
    }

    @PostMapping("/movierecommend")
    public String movierecommend(@RequestParam("searchQuery") String searchInputKeyword, Model model){
       List<MovieDTO> searchNowMovieList= movieService.selectNowMovieList(searchInputKeyword);
       //List<MovieDTO> searchPrevMovieList= movieService.selectPrevMovieList(searchInputKeyword);
       model.addAttribute("searchNowMovieList",searchNowMovieList);
      // model.addAttribute("searchPrevMovieList",searchPrevMovieList);
      
       return "movie/movie_recommend";
    }
    
}
