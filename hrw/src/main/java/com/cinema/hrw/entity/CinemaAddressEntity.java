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
    private Double xAxis;
    
    @Column
    private Double yAxis;

    public static CinemaAddressEntity toCinemaAddressEntity(CinemaAddressDTO cinemaAddressDTO) {
        CinemaAddressEntity cinemaAddressEntity = new CinemaAddressEntity();
        cinemaAddressEntity.setCinemaCode(cinemaAddressDTO.getCinemaCode() != null ? cinemaAddressDTO.getCinemaCode() : "");
        cinemaAddressEntity.setCinemaName(cinemaAddressDTO.getCinemaName() != null ? cinemaAddressDTO.getCinemaName() : "");
        cinemaAddressEntity.setAddress(cinemaAddressDTO.getAddress() != null ? cinemaAddressDTO.getAddress() : "");
        cinemaAddressEntity.setTell(cinemaAddressDTO.getTell() != null ? cinemaAddressDTO.getTell() : "");
        cinemaAddressEntity.setXAxis(cinemaAddressDTO.getXAxis() != null ? cinemaAddressDTO.getXAxis() : 0);
        cinemaAddressEntity.setYAxis(cinemaAddressDTO.getYAxis() != null ? cinemaAddressDTO.getYAxis() : 0);
        cinemaAddressEntity.setLocal(cinemaAddressDTO.getLocal() != null ? cinemaAddressDTO.getLocal() : "");
        return cinemaAddressEntity;
    }


}