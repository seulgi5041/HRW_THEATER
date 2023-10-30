package com.cinema.hrw.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "cinema_addressTBL")	
public class CinemaAddressEntity {
    
    @Id
    @Column(name = "cinema_code")
    private String cinemaCode;

    @Column
    private String cinemaName;

    @Column
    private String address;

    @Column
    private String tell;

    @Column
    private String xAxis;
    
    @Column
    private String yAxis;
}
