package com.cinema.hrw.dto;


import com.cinema.hrw.entity.CinemaAddressEntity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class CinemaAddressDTO {

    private String cinemaCode;

    private String cinemaName;

    private String address;

    private String tell;

    private Double  xAxis;
    
    private Double  yAxis;
    private String local;

    public static CinemaAddressDTO toCinemaAddressDTO(CinemaAddressEntity cinemaAddressEntity){
    CinemaAddressDTO cinemaAddressDTO = new CinemaAddressDTO();
    cinemaAddressDTO.setCinemaCode(cinemaAddressEntity.getCinemaCode() != null ? cinemaAddressEntity.getCinemaCode() : "");
    cinemaAddressDTO.setCinemaName(cinemaAddressEntity.getCinemaName() != null ? cinemaAddressEntity.getCinemaName() : "");
    cinemaAddressDTO.setAddress(cinemaAddressEntity.getAddress() != null ? cinemaAddressEntity.getAddress() : "");
    cinemaAddressDTO.setTell(cinemaAddressEntity.getTell() != null ? cinemaAddressEntity.getTell() : "");
    cinemaAddressDTO.setXAxis(cinemaAddressEntity.getXAxis() != null ? cinemaAddressEntity.getXAxis() :0);
    cinemaAddressDTO.setYAxis(cinemaAddressEntity.getYAxis() != null ? cinemaAddressEntity.getYAxis() : 0);
    cinemaAddressDTO.setLocal(cinemaAddressEntity.getLocal() != null ? cinemaAddressEntity.getLocal() : "");
    return cinemaAddressDTO;
    }

}