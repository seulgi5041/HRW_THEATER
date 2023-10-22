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
    @Column(name = "Code")
    private String code;
    @Column(name = "Title")
    private String title;
    @Column(name = "AKA")
    private String aka;
    @Column(name = "Summary")
    private String summary;
    @Column(name = "image_url")
    private String imageUrl;
    @Column(name = "advance_reservation_rate")
    private float advanceReservationRate;
    @Column(name = "cumulative_number_of_audience")
    private Long cumulativeNumberOfAudience;
     @Column(name = "in_decrease")
    private int inDecrease;
    @Column(name = "in_decrease_rate")
    private Integer inDecrease_rate;
}
