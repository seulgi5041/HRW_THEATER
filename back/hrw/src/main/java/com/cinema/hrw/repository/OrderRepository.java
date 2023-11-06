package com.cinema.hrw.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.cinema.hrw.entity.OrderEntity;

@Repository
public interface OrderRepository extends JpaRepository<OrderEntity,String>{

    int countByOrderDate(String orderDate);

    OrderEntity findByOrderCode(String orderCode);

    @Query("SELECT o.orderCode, o.orderDate, m.code, m.title, m.rating, a.cinemaName, s.auditorium, s.takeDate, s.startTime, s.endTime, s.screenType," +
    "o.teenagerCount, o.adultCount, o.disabledCount, o.moviePrice, o.movieOrderCondition, o.payMethod, o.payCompany " +
    "FROM MovieEntity m " +
       "INNER JOIN OrderEntity o ON o.movieCode = m.code " +
       "INNER JOIN ScheduleEntity s ON o.scheduleCode = s.scheduleCode " +
       "INNER JOIN CinemaAddressEntity a ON s.cinemaCode = a.cinemaCode " +
       "WHERE o.orderCode = :orderCode")
       List<Object[]> findOrderDetailsByOrderCode(@Param("orderCode") String orderCode);

    
}
