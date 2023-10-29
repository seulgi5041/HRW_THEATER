package com.cinema.hrw.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



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

   
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cinema_code", referencedColumnName = "cinema_code")
    private CinemaAddressEntity cinemaCode;

    @Column
    private String auditorium;

    @Column
    private String takeDate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "movie_code", referencedColumnName = "code")
    private MovieEntity movieCode;

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


}
