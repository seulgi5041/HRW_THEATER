package com.cinema.hrw.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.cinema.hrw.dto.MovieDTO;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "MovieTBL")
@Getter
@Setter
public class MovieEntity {
    @Id
    @Column(name = "code")
    private String code;
    
    @Column(name = "title")
    private String title;
    
    @Column(name = "aka")
    private String aka;
    
    @Column(name = "summary")
    private String summary;
    
    @Column(name = "rating")
    private String rating;
    
    @Column(name = "release_date")
    private String releaseDate;
    
    @Column(name = "production_year")
    private String productionYear;
    
    @Column(name = "production_condition")
    private String productionCondition;
    
    @Column(name = "crank_in_up")
    private String crankInUp;
    
    @Column(name = "filming_count")
    private String filmingCount;
    
    @Column(name = "screen_type")
    private String screenType;
    
    @Column(name = "synopsis", columnDefinition = "TEXT")
    private String synopsis;
    
    @Column(name = "director")
    private String director;
    
    @Column(name = "actor" , columnDefinition = "TEXT")
    private String actor;
    
    @Column(name = "producer")
    private String producer;
    
    @Column(name = "distributor")
    private String distributor;
    
    @Column(name = "importer")
    private String importer;
    
    @Column(name = "advance_reservation_rate")
    private Float advanceReservationRate;
    
    @Column(name = "cumulative_number_of_audience")
    private String cumulativeNumberOfAudience;
    
    @Column(name = "increase_decrease_status" ,columnDefinition = "INTEGER DEFAULT 0") /* 0 : new / 1 :up / 2 : down / 3 : keep */
    private Integer increaseDecreaseStatus;
    
    @Column(name = "increase_decrease_rate")
    private Integer increaseDecreaseRate;

    @Column(name = "advance_reservation_rate_rank")
    private Integer advance_reservation_rate_rank;

    @Column(name = "poster_url")
    private String posterUrl;

    @Column(name = "update_date")
    private String updateDate;

    public static MovieEntity toMovieEntity(MovieDTO movieDTO) {
        
        MovieEntity movieEntity = new MovieEntity();
        movieEntity.setCode(movieDTO.getCode());
        movieEntity.setTitle(movieDTO.getTitle());
        movieEntity.setAka(movieDTO.getAka());
        movieEntity.setSummary(movieDTO.getSummary());
        movieEntity.setRating(movieDTO.getRating());
        movieEntity.setReleaseDate(movieDTO.getReleaseDate());
        movieEntity.setProductionYear(movieDTO.getProductionYear());
        movieEntity.setProductionCondition(movieDTO.getProductionCondition());
        movieEntity.setCrankInUp(movieDTO.getCrankInUp());
        movieEntity.setFilmingCount(movieDTO.getFilmingCount());
        movieEntity.setScreenType(movieDTO.getScreenType());
        movieEntity.setSynopsis(movieDTO.getSynopsis());
        movieEntity.setDirector(movieDTO.getDirector());
        movieEntity.setActor(movieDTO.getActor());
        movieEntity.setProducer(movieDTO.getProducer());
        movieEntity.setDistributor(movieDTO.getDistributor());
        movieEntity.setImporter(movieDTO.getImporter());
        movieEntity.setAdvanceReservationRate(movieDTO.getAdvanceReservationRate());
        movieEntity.setCumulativeNumberOfAudience(movieDTO.getCumulativeNumberOfAudience());
        movieEntity.setIncreaseDecreaseStatus(movieDTO.getIncreaseDecreaseStatus());
        movieEntity.setIncreaseDecreaseRate(movieDTO.getIncreaseDecreaseRate());
        movieEntity.setPosterUrl(movieDTO.getPosterUrl());
        movieEntity.setUpdateDate(movieDTO.getUpdateDate());
    
            return movieEntity;
        
    }
    
}