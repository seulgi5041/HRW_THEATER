package com.cinema.hrw.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

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
    
    @Column(name = "increase_decrease_status")
    private Integer increaseDecreaseStatus;
    
    @Column(name = "increase_decrease_rate")
    private Integer increaseDecreaseRate;

    @Column(name = "poster_url")
    private String posterUrl;
}
