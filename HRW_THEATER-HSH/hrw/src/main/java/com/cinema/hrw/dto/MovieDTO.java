package com.cinema.hrw.dto;


import com.cinema.hrw.entity.MovieEntity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString

public class MovieDTO { 
    private String code;
    
    private String title;
    
    private String aka;
    
    private String summary;
    
    private String rating;
    
    private String releaseDate;
    
    private String productionYear;
    
    private String productionCondition;
    
    private String crankInUp;
    
    private String filmingCount;
    
    private String screenType;
    
    private String synopsis;
    
    private String director;
    
    private String actor;
    
    private String producer;
    
    private String distributor;
    
    private String importer;

    private Float advanceReservationRate;

    private String cumulativeNumberOfAudience;

    private Integer increaseDecreaseStatus;

    private Integer increaseDecreaseRate;

    private Integer advance_reservation_rate_rank;

    private String posterUrl;


    public MovieDTO toMovieDTO(MovieEntity movieEntity){
        MovieDTO movieDTO = new MovieDTO();
        movieDTO.setCode(movieEntity.getCode());
        movieDTO.setTitle(movieEntity.getTitle());
        movieDTO.setAka(movieEntity.getAka());
        movieDTO.setSummary(movieEntity.getSummary());
        movieDTO.setRating(movieEntity.getRating());
        movieDTO.setReleaseDate(movieEntity.getReleaseDate());
        movieDTO.setProductionYear(movieEntity.getProductionYear());
        movieDTO.setProductionCondition(movieEntity.getProductionCondition());
        movieDTO.setCrankInUp(movieEntity.getCrankInUp());
        movieDTO.setFilmingCount(movieEntity.getFilmingCount());
        movieDTO.setScreenType(movieEntity.getScreenType());
        movieDTO.setSynopsis(movieEntity.getSynopsis());
        movieDTO.setDirector(movieEntity.getDirector());
        movieDTO.setActor(movieEntity.getActor());
        movieDTO.setProducer(movieEntity.getProducer());
        movieDTO.setDistributor(movieEntity.getDistributor());
        movieDTO.setImporter(movieEntity.getImporter());
        movieDTO.setAdvanceReservationRate(movieEntity.getAdvanceReservationRate());
        movieDTO.setCumulativeNumberOfAudience(movieEntity.getCumulativeNumberOfAudience());
        movieDTO.setIncreaseDecreaseStatus(movieEntity.getIncreaseDecreaseStatus());
        movieDTO.setIncreaseDecreaseRate(movieEntity.getIncreaseDecreaseRate());
        movieDTO.setPosterUrl(movieEntity.getPosterUrl());

        return movieDTO;
    }
}
