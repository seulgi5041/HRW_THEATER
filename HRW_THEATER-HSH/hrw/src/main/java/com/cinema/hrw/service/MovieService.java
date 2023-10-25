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
            movieDTO.setSynopsis(movieEntity.getSynopsis());
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
            movieDTO.setAdvanceReservationRate(movieEntity.getAdvanceReservationRate());
            movieDTO.setCumulativeNumberOfAudience(movieEntity.getCumulativeNumberOfAudience());
            movieDTO.setIncreaseDecreaseStatus(movieEntity.getIncreaseDecreaseStatus()); /* 0 : new / 1 : up / 2 : down / 3 : keep */
            movieDTO.setIncreaseDecreaseRate(movieEntity.getIncreaseDecreaseRate()); 
            movieList.add(movieDTO);
        }

        return movieList;
    }

    public MovieDTO selectMovieInfo(MovieDTO movieDTO) {
        MovieEntity choicedMovieInfoEntity = movieRepository.findByCode(movieDTO.getCode());

        MovieDTO choicedMovieInfo = movieDTO.toMovieDTO(choicedMovieInfoEntity);
        return choicedMovieInfo; 
    }

    public List<MovieDTO> selectNowMovieList(String searchInputKeyword) {
       List<MovieEntity> SearchNowMovieListEntity = movieRepository.findTop10ByOrderByAdvanceReservationRateDesc();//키워드 검색하여띄우는 것으로 변경

        return null;
    }

    public List<MovieDTO> selectPrevMovieList(String searchInputKeyword) {
        return null;
    } 
    
    
}
