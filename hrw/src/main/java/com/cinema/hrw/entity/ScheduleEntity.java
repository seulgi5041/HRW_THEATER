package com.cinema.hrw.entity;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.cinema.hrw.dto.CinemaAddressDTO;
import com.cinema.hrw.dto.MovieDTO;
import com.cinema.hrw.dto.ScheduleDTO;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "scheduleTBL")	
public class ScheduleEntity {
    @Id
    @Column(name = "schedule_code")
    private String scheduleCode;

   
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "cinema_code", referencedColumnName = "cinema_code")
    private CinemaAddressEntity cinemaCode;

    @Transient
    private CinemaAddressEntity cinemaName;

    @Column
    private String auditorium;

    @Column
    private String takeDate;

    @Transient
    private String takeDateOfWeek;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "movie_code", referencedColumnName = "code")
    private MovieEntity movieCode;

    @Transient
    private MovieEntity movieTitle;

    @Transient
    private MovieEntity movieRating;

    @Column
    private String startTime;

    @Column
    private String endTime;

    @Column
    private String screenType;

    @Column
    private Long allSeatCount;

    @Column
    private Long teenagerPrice;

    @Column
    private Long adultPrice;

    @Column
    private Long disabledPrice;

    public String getMovieTitle() {
        if (movieTitle != null) {
            String movieTitleStr =MovieDTO.toMovieDTO(movieTitle).getTitle();

            return movieTitleStr;
        }
        return null;
    }

    public String getMovieRating() {
        if (movieRating != null) {
            String movieRatingStr = MovieDTO.toMovieDTO(movieRating).getRating();

            return movieRatingStr;
        }
        return null;
    }

    public String getCinemaName() {
        if (cinemaName != null) {
            String cinemaNameStr = CinemaAddressDTO.toCinemaAddressDTO(cinemaName).getCinemaName();

            return cinemaNameStr;
        }
        return null;
    }

    public String getTakeDateOfWeek(){
        if (takeDate != null){

        LocalDate date = LocalDate.parse(takeDate, DateTimeFormatter.ofPattern("yyyy-MM-dd"));

        // 날짜에서 요일 추출
        DayOfWeek dayOfWeek = date.getDayOfWeek();

        // 요일 이름 가져오기
        String dayOfWeekName = dayOfWeek.toString();
         String koreaWeekName = "";

        switch (dayOfWeekName) {
            case "SUNDAY":
                koreaWeekName = "일";
                break;
            case "MONDAY":
                koreaWeekName = "월";
                break;
            case "TUESDAY":
                koreaWeekName = "화";
                break;
            case "WEDNESDAY":
                koreaWeekName = "수";
                break;
            case "THURSDAY":
                koreaWeekName = "목";
                break;
            case "FRIDAY":
                koreaWeekName = "금";
                break;
            case "SATURDAY":
                koreaWeekName = "토";
                break;
        }

            return koreaWeekName;
        }
        return null;
    }

    public static ScheduleEntity toScheduleEntity(ScheduleDTO scheduleDTO) {
        ScheduleEntity scheduleEntity = new ScheduleEntity();
        scheduleEntity.setScheduleCode(scheduleDTO.getScheduleCode()!= null ? scheduleDTO.getScheduleCode() : "");
        scheduleEntity.setCinemaCode(scheduleDTO.getCinemaCode());
        scheduleEntity.setAuditorium(scheduleDTO.getAuditorium()!= null ? scheduleDTO.getAuditorium() : "");
        scheduleEntity.setTakeDate(scheduleDTO.getTakeDate()!= null ? scheduleDTO.getTakeDate() : "");
        scheduleEntity.setTakeDateOfWeek(scheduleDTO.getTakeDateOfWeek()!= null ? scheduleDTO.getTakeDateOfWeek() : "");
        scheduleEntity.setMovieCode(scheduleDTO.getMovieCode());
        scheduleEntity.setStartTime(scheduleDTO.getStartTime()!= null ? scheduleDTO.getStartTime() : "");
        scheduleEntity.setEndTime(scheduleDTO.getEndTime()!= null ? scheduleDTO.getEndTime() : "");
        scheduleEntity.setScreenType(scheduleDTO.getScreenType()!= null ? scheduleDTO.getScreenType() : "");
        scheduleEntity.setAllSeatCount(scheduleDTO.getAllSeatCount()!= null ? scheduleDTO.getAllSeatCount() : 0);
        scheduleEntity.setTeenagerPrice(scheduleDTO.getTeenagerPrice()!= null ? scheduleDTO.getTeenagerPrice() : 0);
        scheduleEntity.setAdultPrice(scheduleDTO.getAdultPrice()!= null ? scheduleDTO.getAdultPrice() : 0);
        scheduleEntity.setDisabledPrice(scheduleDTO.getDisabledPrice()!= null ? scheduleDTO.getDisabledPrice() : 0);
        return scheduleEntity;
    }


    public void setMovieCode(MovieDTO movieDTO){
        this.movieCode=MovieEntity.toMovieEntity(movieDTO);
    }

    public void setCinemaCode(CinemaAddressDTO cinemaAddressDTO){
        this.cinemaCode=CinemaAddressEntity.toCinemaAddressEntity(cinemaAddressDTO);
    }
}