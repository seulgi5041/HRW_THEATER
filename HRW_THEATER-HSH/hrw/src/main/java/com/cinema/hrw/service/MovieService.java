package com.cinema.hrw.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.cinema.hrw.dto.MovieDTO;
import com.cinema.hrw.entity.MovieEntity;
import com.cinema.hrw.repository.MovieRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MovieService {
    private final MovieRepository movieRepository;

    public List<MovieDTO> selectAllTitle() {
        List<MovieEntity> movieEntities = movieRepository.findAll();
    
        List<MovieDTO> movieList = new ArrayList<>();
        for (MovieEntity movieEntity : movieEntities) {
            MovieDTO movieDTO = new MovieDTO();
            movieDTO.setTitle(movieEntity.getTitle());
            movieDTO.setCode(movieEntity.getCode());
            movieDTO.setSummary(movieEntity.getSummary());
            movieList.add(movieDTO);
        }
    
        return movieList;
    }

    public List<MovieDTO> selectTop10ByAdvanceReservationRate() {
        List<MovieEntity> top10Movies = movieRepository.findTop10ByOrderByAdvanceReservationRateDesc();

        List<MovieDTO> movieList = new ArrayList<>();
        for (MovieEntity movieEntity : top10Movies) {
            MovieDTO movieDTO = new MovieDTO();
            movieDTO.setTitle(movieEntity.getTitle());
            movieDTO.setCode(movieEntity.getCode());
            movieDTO.setAdvance_reservation_rate(movieEntity.getAdvanceReservationRate());
            movieDTO.setCumulative_number_of_audience(movieEntity.getCumulativeNumberOfAudience());
            movieDTO.setIn_decrease(movieEntity.getInDecrease()); /* 0 : new / 1 : up / 2 : down / 3 : keep */
            movieDTO.setIn_decrease_rate(movieEntity.getInDecrease_rate()); 
            movieList.add(movieDTO);
        }

        return movieList;
    } 
    
    
}
