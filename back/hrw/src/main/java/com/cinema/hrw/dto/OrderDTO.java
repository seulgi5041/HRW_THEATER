package com.cinema.hrw.dto;
import com.cinema.hrw.entity.OrderEntity;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class OrderDTO {
    
    private String orderCode;

    private String userId;

    private String orderDate;

    private int num;

    private String movieCode;
    
    private String scheduleCode;
    
    private int teenagerCount;

    private int adultCount;

    private int disabledCount;

    private Long moviePrice;

    private int movieOrderCondition; // 주문안함: 0, 주문함: 1, 수령완료: 2, 취소함: 3

    private String payMethod;

    private String payCompany;

    /*private int installment; // 일시불: 0, 할부시 개월수*/
    private int allPrice;

    public static OrderDTO toOrderDTO(OrderEntity orderEntity){
    OrderDTO orderDTO = new OrderDTO();
    orderDTO.setOrderCode(orderEntity.getOrderCode());
    orderDTO.setUserId(MemberDTO.toMemberDTO(orderEntity.getUserId()).getUserId());
    orderDTO.setOrderDate(orderEntity.getOrderDate());
    orderDTO.setNum(orderEntity.getNum());
    orderDTO.setMovieCode(MovieDTO.toMovieDTO(orderEntity.getMovieCode()).getCode());
    orderDTO.setScheduleCode(ScheduleDTO.toScheduleDTO(orderEntity.getScheduleCode()).getScheduleCode());
    orderDTO.setTeenagerCount(orderEntity.getTeenagerCount());
    orderDTO.setAdultCount(orderEntity.getAdultCount());
    orderDTO.setDisabledCount(orderEntity.getDisabledCount());
    orderDTO.setMoviePrice(orderEntity.getMoviePrice());
    orderDTO.setMovieOrderCondition(orderEntity.getMovieOrderCondition());
    orderDTO.setPayMethod(orderEntity.getPayMethod());
    orderDTO.setPayCompany(orderEntity.getPayCompany());
    /*orderDTO.setInstallment(orderEntity.getInstallment());*/
    return orderDTO;
    }
}
