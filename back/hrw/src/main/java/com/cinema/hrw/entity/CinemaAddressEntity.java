package com.cinema.hrw.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import com.cinema.hrw.dto.CinemaAddressDTO;

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
    private String local;

    @Column
    private String tell;

    @Column
    private double xAxis;
    
    @Column
    private double yAxis;

    public static CinemaAddressEntity toCinemaAddressEntity(CinemaAddressDTO cinemaAddressDTO) {
        CinemaAddressEntity cinemaAddressEntity = new CinemaAddressEntity();
        cinemaAddressEntity.setCinemaCode(cinemaAddressDTO.getCinemaCode());
        cinemaAddressEntity.setCinemaName(cinemaAddressDTO.getCinemaName());
        cinemaAddressEntity.setAddress(cinemaAddressDTO.getAddress());
        cinemaAddressEntity.setTell(cinemaAddressDTO.getTell());
        cinemaAddressEntity.setXAxis(cinemaAddressDTO.getXAxis());
        cinemaAddressEntity.setYAxis(cinemaAddressDTO.getYAxis());
        cinemaAddressEntity.setLocal(cinemaAddressDTO.getLocal());
        return cinemaAddressEntity;
    }


}
