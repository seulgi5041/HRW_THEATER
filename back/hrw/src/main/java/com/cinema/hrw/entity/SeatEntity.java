package com.cinema.hrw.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.cinema.hrw.dto.OrderDTO;
import com.cinema.hrw.dto.SeatDTO;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "seatTBL")	
public class SeatEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int num;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "order_code", referencedColumnName = "orderCode")
    private OrderEntity orderCode;

    @Column
    private String seatName;

    public static SeatEntity toSeatEntity(SeatDTO seatDTO){
        SeatEntity seatEntity = new SeatEntity();
        seatEntity.setOrderCode(seatDTO.getOrderCode());
        seatEntity.setSeatName(seatDTO.getSeatName());
        return seatEntity;
        }

        public void setOrderCode(OrderDTO orderDTO){
        this.orderCode=OrderEntity.toOrderEntity(orderDTO);
    }


}
