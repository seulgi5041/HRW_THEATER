package com.cinema.hrw.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class OrderJoinDTO {
    private String orderCode;
    private String orderDate;
    private String movieCode;
    private String movieTitle;
    private String movieRating;
    private String cinemaName;
    private String auditorium;
    private String takeDate;
    private String startTime;
    private String endTime;
    private String screenType;
    private int teenagerCount;
    private int adultCount;
    private int disabledCount;
    private Long moviePrice;
    private int movieOrderCondition; 
    private String payMethod;
    private String payCompany;
    private String representFoodName;
    private Long totalPrice;
}