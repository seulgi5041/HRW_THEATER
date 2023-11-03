package com.cinema.hrw.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Service;

import com.cinema.hrw.dto.CinemaAddressDTO;
import com.cinema.hrw.dto.FoodOrderDTO;
import com.cinema.hrw.dto.MemberDTO;
import com.cinema.hrw.dto.OrderDTO;
import com.cinema.hrw.dto.ScheduleDTO;
import com.cinema.hrw.dto.SeatDTO;
import com.cinema.hrw.entity.CinemaAddressEntity;
import com.cinema.hrw.entity.MovieEntity;
import com.cinema.hrw.entity.OrderEntity;
import com.cinema.hrw.entity.ScheduleEntity;
import com.cinema.hrw.entity.SeatEntity;
import com.cinema.hrw.repository.FoodOrderRepository;
import com.cinema.hrw.repository.OrderRepository;
import com.cinema.hrw.repository.ReservationRepository;
import com.cinema.hrw.repository.SeatRepository;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import lombok.RequiredArgsConstructor;



@Service
@RequiredArgsConstructor
public class ReservationService {
    @PersistenceContext
    private EntityManager entityManager;
    private final ReservationRepository reservationRepository;
    private final OrderRepository orderRepository;
    private final FoodOrderRepository foodOrderRepository;
    private final SeatRepository seatRepository;


    

    public List<SeatDTO> getRemainingSeats(ScheduleDTO scheduleCodeDTO) {
        String scheduleCode = scheduleCodeDTO.getScheduleCode();
        String jpql = "SELECT s FROM SeatEntity s " +
                     "INNER JOIN s.orderCode o " +
                     "WHERE o.scheduleCode = = :scheduleCode";
    
        TypedQuery<SeatEntity> query = entityManager.createQuery(jpql, SeatEntity.class);
        query.setParameter("scheduleCode", scheduleCode);
        
        List<SeatEntity> remainingSeatEntities = query.getResultList();
    
        // SeatEntity를 SeatDTO로 변환
        List<SeatDTO> remainingSeats = new ArrayList<>();
        
        for (SeatEntity seatEntity : remainingSeatEntities) {
            SeatDTO seatDTO = SeatDTO.toSeatDTO(seatEntity);
            remainingSeats.add(seatDTO);
        }
        
        return remainingSeats;
    }


    public ScheduleDTO getChoiceScheduleInfo(ScheduleDTO scheduleCodeDTO) {
        String scheduleCode = scheduleCodeDTO.getScheduleCode();
       String jpql = "SELECT s FROM ScheduleEntity s INNER JOIN FETCH s.movieCode m INNER JOIN FETCH s.cinemaCode c WHERE s.scheduleCode = :scheduleCode";
       TypedQuery<ScheduleEntity> query = entityManager.createQuery(jpql, ScheduleEntity.class);
       query.setParameter("scheduleCode", scheduleCode);
       
    List<ScheduleEntity> result = query.getResultList();

    if (result.isEmpty()) {
        System.out.println("선택된 스케쥴없음");
        return null;
    }

    ScheduleEntity scheduleEntity = result.get(0);
    MovieEntity movieEntity = scheduleEntity.getMovieCode();
    CinemaAddressEntity cinemaAddressEntity = scheduleEntity.getCinemaCode();

    ScheduleDTO choiceScheduleInfoDTO = ScheduleDTO.toScheduleDTO(scheduleEntity);
    choiceScheduleInfoDTO.setMovieTitle(movieEntity.getTitle());
    choiceScheduleInfoDTO.setMovieRating(movieEntity.getRating());
    choiceScheduleInfoDTO.setCinemaName(cinemaAddressEntity.getCinemaName());

    return choiceScheduleInfoDTO;
    } 

    


    public List<String> getCinemaNamesInSeoul() {
        return reservationRepository.findCinemaNamesInSeoul();
    }


    public int orderSuccessOrFailCheck(OrderDTO payInfoDTO, ScheduleDTO scheduleDTO, OrderDTO person_count,
            List<SeatDTO> seat_list,List<FoodOrderDTO> foodInfoList, String currentUserId) {
                int order_check= 0;
                MemberDTO memberDTO = new MemberDTO();
                memberDTO.setUserId(currentUserId);
                LocalDate defalt = LocalDate.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                String orderDate  = defalt.format(formatter);

                /**주문정보테이블 */
                OrderDTO setOrderDTO = new OrderDTO();
                setOrderDTO.setUserId(memberDTO);
                setOrderDTO.setOrderDate(orderDate);
                setOrderDTO.setMovieCode(scheduleDTO.getMovieCode());
                setOrderDTO.setScheduleCode(scheduleDTO);
                setOrderDTO.setTeenagerCount(person_count.getTeenagerCount());
                setOrderDTO.setAdultCount(person_count.getAdultCount());
                setOrderDTO.setDisabledCount(person_count.getDisabledCount());
                setOrderDTO.setMoviePrice(person_count.getMoviePrice());
                setOrderDTO.setMovieOrderCondition(1);
                setOrderDTO.setPayMethod(payInfoDTO.getPayMethod());
                setOrderDTO.setPayCompany(payInfoDTO.getPayCompany());
                OrderEntity orderEntity = OrderEntity.toOrderEntity(setOrderDTO);
                orderRepository.save(orderEntity);
                
                /**좌석 테이블 */

                /**음식주문 테이블 */

        return order_check; //주문 성공 : 0 , 주문 실패 : 1 그외
    }





    }
    

