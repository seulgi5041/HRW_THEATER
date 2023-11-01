package com.cinema.hrw.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "orderTBL")	
public class OrderEntity {
    @Id
    @Column
    private String orderCode;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id", referencedColumnName = "userId")
    private MemberEntity userId;

    @Column
    private String orderDate;

    @Column
    private int num;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "movie_code", referencedColumnName = "code") // name 및 referencedColumnName 추가
    private MovieEntity movieCode;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "schedule_code", referencedColumnName = "schedule_code")
    private ScheduleEntity scheduleCode;
    
    @Column
    private int teenagerCount;

    @Column
    private int adultCount;

    @Column
    private int disabledCount;

    @Column
    private Long moviePrice;

    @Column
    private int movieOrderCondition; // 주문안함: 0, 주문함: 1, 수령완료: 2, 취소함: 3

    @Column
    private String payMethod;

    @Column
    private String payCompany;


    @Transient
    private int allPrice; // 총결제액


}