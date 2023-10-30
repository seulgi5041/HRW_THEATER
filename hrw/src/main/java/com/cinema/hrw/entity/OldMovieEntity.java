package com.cinema.hrw.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "OldMovieTBL")
@Getter
@Setter
public class OldMovieEntity {
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
    
    @Column(name = "poster_url")
    private String posterUrl;

    @Transient
    private double matchRate;
}
