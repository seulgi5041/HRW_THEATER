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
        scheduleDTO.setScheduleCode(scheduleEntity.getScheduleCode() != null ? scheduleEntity.getScheduleCode() :"");
        scheduleDTO.setCinemaCode(scheduleEntity.getCinemaCode() );
        scheduleDTO.setCinemaName(scheduleEntity.getCinemaName() != null ? scheduleEntity.getCinemaName() :"");
        scheduleDTO.setAuditorium(scheduleEntity.getAuditorium() != null ? scheduleEntity.getAuditorium() :"");
        scheduleDTO.setTakeDate(scheduleEntity.getTakeDate() != null ? scheduleEntity.getTakeDate() :"");
        scheduleDTO.setTakeDateOfWeek(scheduleEntity.getTakeDateOfWeek() != null ? scheduleEntity.getTakeDateOfWeek() :"");
        scheduleDTO.setMovieCode(scheduleEntity.getMovieCode() );
        scheduleDTO.setMovieTitle(scheduleEntity.getMovieTitle() != null ? scheduleEntity.getMovieTitle() :"");
        scheduleDTO.setMovieRating(scheduleEntity.getMovieRating() != null ? scheduleEntity.getMovieRating() :"");
        scheduleDTO.setStartTime(scheduleEntity.getStartTime() != null ? scheduleEntity.getStartTime() :"");
        scheduleDTO.setEndTime(scheduleEntity.getEndTime() != null ? scheduleEntity.getEndTime() :"");
        scheduleDTO.setScreenType(scheduleEntity.getScreenType() != null ? scheduleEntity.getScreenType() :"");
        scheduleDTO.setAllSeatCount(scheduleEntity.getAllSeatCount() != null ? scheduleEntity.getAllSeatCount() :0);
        scheduleDTO.setTeenagerPrice(scheduleEntity.getTeenagerPrice() != null ? scheduleEntity.getTeenagerPrice() :0);
        scheduleDTO.setAdultPrice(scheduleEntity.getAdultPrice() != null ? scheduleEntity.getAdultPrice() :0);
        scheduleDTO.setDisabledPrice(scheduleEntity.getDisabledPrice() != null ? scheduleEntity.getDisabledPrice() :0);
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