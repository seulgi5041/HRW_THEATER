package com.cinema.hrw.dto;


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

    private String posterUrl;
}
