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

    private String local;

    private String tell;

    private double xAxis;

    private double yAxis;

    public static CinemaAddressDTO toCinemaAddressDTO(CinemaAddressEntity cinemaAddressEntity) {
        CinemaAddressDTO cinemaAddressDTO = new CinemaAddressDTO();
        cinemaAddressDTO.setCinemaCode(cinemaAddressEntity.getCinemaCode());
        cinemaAddressDTO.setCinemaName(cinemaAddressEntity.getCinemaName());
        cinemaAddressDTO.setAddress(cinemaAddressEntity.getAddress());
        cinemaAddressDTO.setLocal(cinemaAddressEntity.getLocal());
        cinemaAddressDTO.setTell(cinemaAddressEntity.getTell());
        cinemaAddressDTO.setXAxis(cinemaAddressEntity.getXAxis());
        cinemaAddressDTO.setYAxis(cinemaAddressEntity.getYAxis());
        return cinemaAddressDTO;
    }

}
