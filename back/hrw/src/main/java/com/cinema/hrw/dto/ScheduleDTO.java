package com.cinema.hrw.dto;

import com.cinema.hrw.entity.CinemaAddressEntity;
import com.cinema.hrw.entity.MovieEntity;
import com.cinema.hrw.entity.ScheduleEntity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class ScheduleDTO {

    private String scheduleCode;

    private CinemaAddressDTO cinemaCode;

    private String cinemaName;

    private String auditorium;

    private String takeDate;

    private String takeDateOfWeek;

    private MovieDTO movieCode;

    private String movieTitle;

    private String movieRating;

    private String startTime;

    private String endTime;

    private String screenType;

    private Long allSeatCount;

    private Long teenagerPrice;

    private Long adultPrice;

    private Long disabledPrice;

    public static ScheduleDTO toScheduleDTO (ScheduleEntity scheduleEntity){
        ScheduleDTO scheduleDTO = new ScheduleDTO();
        scheduleDTO.setScheduleCode(scheduleEntity.getScheduleCode());
        scheduleDTO.setCinemaCode(scheduleEntity.getCinemaCode());
        scheduleDTO.setCinemaName(scheduleEntity.getCinemaName());
        scheduleDTO.setAuditorium(scheduleEntity.getAuditorium());
        scheduleDTO.setTakeDate(scheduleEntity.getTakeDate());
        scheduleDTO.setTakeDateOfWeek(scheduleEntity.getTakeDateOfWeek());
        scheduleDTO.setMovieCode(scheduleEntity.getMovieCode());
        scheduleDTO.setMovieTitle(scheduleEntity.getMovieTitle());
        scheduleDTO.setMovieRating(scheduleEntity.getMovieRating());
        scheduleDTO.setStartTime(scheduleEntity.getStartTime());
        scheduleDTO.setEndTime(scheduleEntity.getEndTime());
        scheduleDTO.setScreenType(scheduleEntity.getScreenType());
        scheduleDTO.setAllSeatCount(scheduleEntity.getAllSeatCount());
        scheduleDTO.setTeenagerPrice(scheduleEntity.getTeenagerPrice());
        scheduleDTO.setAdultPrice(scheduleEntity.getAdultPrice());
        scheduleDTO.setDisabledPrice(scheduleEntity.getDisabledPrice());
        return scheduleDTO;
    }

    public String getMovieCodeStr(){
        MovieDTO MovieCodeDTO=this.movieCode;
        String movieCodeStr=MovieCodeDTO.getCode();
        return movieCodeStr;
    }

    public void setMovieCode(MovieEntity movieEntity){
        this.movieCode=MovieDTO.toMovieDTO(movieEntity);
    }

    public String getCinemaCodeStr(){
        CinemaAddressDTO cinemaAddressDTO = this.cinemaCode;
        String cinemaCodeStr = cinemaAddressDTO.getCinemaCode();
        return cinemaCodeStr;
    }

    public void setCinemaCode(CinemaAddressEntity cinemaAddressEntity){
        this.cinemaCode=CinemaAddressDTO.toCinemaAddressDTO(cinemaAddressEntity);
    }


}
