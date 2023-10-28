package com.cinema.hrw.dto;

import com.cinema.hrw.entity.MovieEntity;
import com.cinema.hrw.entity.OldMovieEntity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class OldMovieDTO {
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

    private String posterUrl;

    private double matchRate;


    public OldMovieDTO toMovieDTO(OldMovieEntity oldMovieEntity){
        OldMovieDTO oldMovieDTO = new OldMovieDTO();
        oldMovieDTO.setCode(oldMovieEntity.getCode());
        oldMovieDTO.setTitle(oldMovieEntity.getTitle());
        oldMovieDTO.setAka(oldMovieEntity.getAka());
        oldMovieDTO.setSummary(oldMovieEntity.getSummary());
        oldMovieDTO.setRating(oldMovieEntity.getRating());
        oldMovieDTO.setReleaseDate(oldMovieEntity.getReleaseDate());
        oldMovieDTO.setProductionYear(oldMovieEntity.getProductionYear());
        oldMovieDTO.setProductionCondition(oldMovieEntity.getProductionCondition());
        oldMovieDTO.setCrankInUp(oldMovieEntity.getCrankInUp());
        oldMovieDTO.setFilmingCount(oldMovieEntity.getFilmingCount());
        oldMovieDTO.setScreenType(oldMovieEntity.getScreenType());
        oldMovieDTO.setSynopsis(oldMovieEntity.getSynopsis());
        oldMovieDTO.setDirector(oldMovieEntity.getDirector());
        oldMovieDTO.setActor(oldMovieEntity.getActor());
        oldMovieDTO.setProducer(oldMovieEntity.getProducer());
        oldMovieDTO.setDistributor(oldMovieEntity.getDistributor());
        oldMovieDTO.setImporter(oldMovieEntity.getImporter());
        oldMovieDTO.setPosterUrl(oldMovieEntity.getPosterUrl());
        return oldMovieDTO;
    }
}
