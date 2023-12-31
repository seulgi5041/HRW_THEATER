package com.cinema.hrw.dto;


import com.cinema.hrw.entity.MemberEntity;
import com.cinema.hrw.entity.MovieEntity;
import com.cinema.hrw.entity.OrderEntity;
import com.cinema.hrw.entity.ScheduleEntity;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.Map;
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

    private MemberDTO userId;

    private String orderDate;

    private int num = 0;

    private MovieDTO movieCode;
    
    private ScheduleDTO scheduleCode;
    
    private int teenagerCount = 0;

    private int adultCount = 0;

    private int disabledCount = 0;

    private Long moviePrice;

    private int movieOrderCondition = 0; // 주문안함: 0, 주문함: 1, 수령완료: 2, 취소함: 3

    private String payMethod;

    private String payCompany;

    /*private int installment; // 일시불: 0, 할부시 개월수*/
    private Long allPrice;

    public static OrderDTO toOrderDTO(OrderEntity orderEntity){
    OrderDTO orderDTO = new OrderDTO();
    orderDTO.setOrderCode(orderEntity.getOrderCode() != null ? orderEntity.getOrderCode() : "");
    orderDTO.setUserId(orderEntity.getUserId());
    orderDTO.setOrderDate(orderEntity.getOrderDate()!= null ? orderEntity.getOrderDate() : "");
    orderDTO.setNum(orderEntity.getNum());
    orderDTO.setMovieCode(orderEntity.getMovieCode());
    orderDTO.setScheduleCode(orderEntity.getScheduleCode());
    orderDTO.setTeenagerCount(orderEntity.getTeenagerCount());
    orderDTO.setAdultCount(orderEntity.getAdultCount());
    orderDTO.setDisabledCount(orderEntity.getDisabledCount());
    orderDTO.setMoviePrice(orderEntity.getMoviePrice() != null ? orderEntity.getMoviePrice() :0);
    orderDTO.setMovieOrderCondition(orderEntity.getMovieOrderCondition() );
    orderDTO.setPayMethod(orderEntity.getPayMethod()!= null ? orderEntity.getPayMethod() : "");
    orderDTO.setPayCompany(orderEntity.getPayCompany()!= null ? orderEntity.getPayCompany() : "");
    return orderDTO;
    }

    public static OrderDTO toPersonCountAndTotalPrice(String personCount, Long totalPrice) {
    ObjectMapper objectMapper = new ObjectMapper();
    try {
        Map<String, Integer> jsonMap = objectMapper.readValue(personCount, new TypeReference<Map<String, Integer>>() {});
        OrderDTO orderDTO = new OrderDTO();
        orderDTO.setAdultCount(jsonMap.get("성인"));
        orderDTO.setTeenagerCount(jsonMap.get("청소년"));
        orderDTO.setDisabledCount(jsonMap.get("장애인"));
        orderDTO.setMoviePrice(totalPrice);
        return orderDTO;
    } catch (JsonProcessingException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
        return null;
    }   
    }

    public static OrderDTO toPayInfo(String payInfoJson) {
    ObjectMapper objectMapper = new ObjectMapper();
    try {
        Map<String, String> jsonMap = objectMapper.readValue(payInfoJson, new TypeReference<Map<String, String>>() {});
        OrderDTO orderDTO = new OrderDTO();
        orderDTO.setPayMethod(jsonMap.get("결제방법"));
        if(jsonMap.get("결제방법").equals("카드")||jsonMap.get("결제방법").equals("간편결제")){
        orderDTO.setPayCompany(jsonMap.get("결제사"));}
        return orderDTO;
    } catch (JsonProcessingException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
        return null;
    }   
    }

    public void setUserId(MemberEntity memberEntity){
        this.userId=MemberDTO.toMemberDTO(memberEntity);
    }
    public void setMovieCode(MovieEntity movieEntity){
        this.movieCode=MovieDTO.toMovieDTO(movieEntity);
    }

    public void setScheduleCode(ScheduleEntity scheduleEntity){
        this.scheduleCode=ScheduleDTO.toScheduleDTO(scheduleEntity);
    }

}