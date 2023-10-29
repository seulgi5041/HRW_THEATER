package com.cinema.hrw.dto;

import com.cinema.hrw.entity.SeatEntity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class SeatDTO {
private int num;

private OrderDTO orderCode;

private String seatName;

public static SeatDTO toSeatDTO(SeatEntity seatEntity){
    SeatDTO seatDTO = new SeatDTO();
    seatDTO.setNum(seatEntity.getNum());
    seatDTO.setOrderCode(OrderDTO.toOrderDTO(seatEntity.getOrderCode()));
    seatDTO.setSeatName(seatEntity.getSeatName());
    return seatDTO;
}
}
