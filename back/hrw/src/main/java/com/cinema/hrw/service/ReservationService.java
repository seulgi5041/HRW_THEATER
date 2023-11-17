package com.cinema.hrw.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

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
import com.cinema.hrw.entity.FoodEntity;
import com.cinema.hrw.entity.FoodOrderEntity;
import com.cinema.hrw.entity.MemberEntity;
import com.cinema.hrw.entity.MovieEntity;
import com.cinema.hrw.entity.OrderEntity;
import com.cinema.hrw.entity.ScheduleEntity;
import com.cinema.hrw.entity.SeatEntity;
import com.cinema.hrw.repository.FoodOrderRepository;
import com.cinema.hrw.repository.FoodRepository;
import com.cinema.hrw.repository.MemberRepository;
import com.cinema.hrw.repository.OrderRepository;
import com.cinema.hrw.repository.ReservationRepository;
import com.cinema.hrw.repository.ScheduleRepository;
import com.cinema.hrw.repository.SeatRepository;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

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
    private final MemberRepository memberRepository;
    private final FoodRepository foodRepository;
    

    public List<SeatDTO> getRemainingSeats(String scheduleCode) {
        String jpql = "SELECT s FROM SeatEntity s " +
                     "INNER JOIN s.orderCode o " +
                     "WHERE o.scheduleCode = :scheduleCode";
    
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


    public String orderSuccessOrFailCheck(OrderDTO payInfoDTO, ScheduleDTO scheduleDTO, OrderDTO person_count,
            List<SeatDTO> seat_list,List<FoodOrderDTO> foodInfoList, String currentUserId) {
                Optional<MemberEntity> optionalMemberEntity = memberRepository.findByUserId(currentUserId);
                MemberEntity memberEntity = optionalMemberEntity.orElse(null);
                MemberDTO memberDTO = MemberDTO.toMemberDTO(memberEntity);
                LocalDate defalt = LocalDate.now();
                DateTimeFormatter formatter02 = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                String orderDate  = defalt.format(formatter02);
                
                int maxIncrement = orderRepository.countByOrderDate(orderDate);
                if (maxIncrement == 0) {
                    maxIncrement += 1;
                } else {
                    maxIncrement++;
                }
                String formattedIncrement = String.format("%03d", maxIncrement);
                int num = maxIncrement;
                String orderCode = defalt.format(DateTimeFormatter.ofPattern("yyyyMMdd")) + formattedIncrement;
                
                

                /**주문정보테이블 */
                OrderDTO setOrderDTO = new OrderDTO();
                setOrderDTO.setOrderCode(orderCode);
                setOrderDTO.setUserId(MemberEntity.toMemberEntity(memberDTO));
                setOrderDTO.setOrderDate(orderDate);
                setOrderDTO.setMovieCode(scheduleDTO.getMovieCode().getCode());
                setOrderDTO.setScheduleCode(scheduleDTO.getScheduleCode());
                setOrderDTO.setTeenagerCount(person_count.getTeenagerCount());
                setOrderDTO.setAdultCount(person_count.getAdultCount());
                setOrderDTO.setDisabledCount(person_count.getDisabledCount());
                setOrderDTO.setMoviePrice(person_count.getMoviePrice());
                setOrderDTO.setMovieOrderCondition(1);
                setOrderDTO.setNum(num);              
                setOrderDTO.setPayMethod(payInfoDTO.getPayMethod());
                if(payInfoDTO.getPayCompany()==null){setOrderDTO.setPayCompany("정보없음");}
                else{ setOrderDTO.setPayCompany(payInfoDTO.getPayCompany());}
            
                OrderEntity orderEntity = OrderEntity.toOrderEntity(setOrderDTO);
                OrderEntity orderSavecheck = orderRepository.save(orderEntity);
               
                OrderEntity afterOrder = orderRepository.findByOrderCode(orderCode);
               
                /**좌석 테이블 */
                if(seat_list != null){
                for (SeatDTO seatDTO : seat_list) {
                    seatDTO.setOrderCode(afterOrder);
                    SeatEntity seatEntity = SeatEntity.toSeatEntity(seatDTO);
                    SeatEntity seatSavecheck= seatRepository.save(seatEntity);
                    
                }}

                /**음식주문 테이블 */
                if(foodInfoList != null){
                for (FoodOrderDTO foodOrderDTO : foodInfoList) {
                    foodOrderDTO.setOrderCode(afterOrder);
                    foodOrderDTO.setFoodOrderCondition(0);
                    FoodOrderEntity foodOrderEntity = FoodOrderEntity.toFoodOrderEntity(foodOrderDTO);
                    FoodOrderEntity foodSavecheck= foodOrderRepository.save(foodOrderEntity);
                }}


        return afterOrder.getOrderCode(); //주문 성공 : 0 , 주문 실패 : 1 그외
    }


    public OrderDTO getChoiceOrderDTO(String oderCode) {
        OrderEntity orderEntity = orderRepository.findByOrderCode(oderCode);
        OrderDTO orderDTO = OrderDTO.toOrderDTO(orderEntity);
        return orderDTO;
    }


    public List<FoodOrderDTO> mapToFoodOrderDTOList(String choiceFoodInfo) {
        ObjectMapper objectMapper = new ObjectMapper();
            try {
                Map<String, Object>[] choiceFoodInfoMaps = objectMapper.readValue(choiceFoodInfo, Map[].class);
                List<FoodOrderDTO> choiceFoodInfoList =new ArrayList<>();
                for(Map<String, Object> choiceFoodInfoMap : choiceFoodInfoMaps ){
                    FoodOrderDTO foodOrderDTO = new FoodOrderDTO();
                    if (choiceFoodInfoMap.containsKey("이름")) {
                        if(choiceFoodInfoMap.get("이름").equals("주문정보없음")){break;}
                        FoodEntity foodEntity = foodRepository.findByFoodName((String)choiceFoodInfoMap.get("이름"));

                        foodOrderDTO.setFoodName(foodEntity);
                    }
                    
                    if (choiceFoodInfoMap.containsKey("구매 가격")) {
                        foodOrderDTO.setFoodPrice(((Number) choiceFoodInfoMap.get("구매 가격")).longValue());
                    }
            
                    if (choiceFoodInfoMap.containsKey("수량")) {
                        foodOrderDTO.setFoodCount(((Number) choiceFoodInfoMap.get("수량")).longValue());
                    }
            
                    if (choiceFoodInfoMap.containsKey("이미지명")) {
                        foodOrderDTO.setFoodImgName((String) choiceFoodInfoMap.get("이미지명"));
                    }

                    choiceFoodInfoList.add(foodOrderDTO);
                }
                return choiceFoodInfoList;

            } catch (JsonProcessingException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                return null;
            }
    }





    }
    

