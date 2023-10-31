package com.cinema.hrw.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Service;

import com.cinema.hrw.dto.CinemaAddressDTO;
import com.cinema.hrw.dto.MovieDTO;
import com.cinema.hrw.dto.ScheduleDTO;
import com.cinema.hrw.dto.SeatDTO;
import com.cinema.hrw.entity.SeatEntity;
import com.cinema.hrw.repository.ScheduleRepository;

import lombok.RequiredArgsConstructor;



@Service
@RequiredArgsConstructor
public class ReservationService {
    @PersistenceContext
    private EntityManager entityManager;

    private final ScheduleRepository scheduleRepository;

    

    /*public List<SeatDTO> getRemainingSeats(String schedule_code) {
        System.out.println("서비스 01 " + schedule_code);
        List<SeatEntity> remainingSeatsEntity =seatRepository.findSeatNameByScheduleCode(schedule_code);
        System.out.println("서비스 02 " + schedule_code);
        List<SeatDTO>seatList = new ArrayList<>();
        System.out.println("getRemainingSeats  "+ schedule_code);
        for(SeatEntity seatEntity : remainingSeatsEntity){
            SeatDTO seatDTO = new SeatDTO();
            seatDTO = SeatDTO.toSeatDTO(seatEntity);
            seatList.add(seatDTO);
        }
        return seatList;
    }*/

    public Object[] getChoiceScheduleInfo(String schedule_code) {
        Object[] choiceScheduleEntity = scheduleRepository.findScheduleDetailsByScheduleCode(schedule_code); 
    /*m.code , m.title, m.rating, s.takeDate, s.startTime, s.endTime, c.cinemaName , s.auditorium, s.teenagerPrice, s.adultPrice, s.disabledPrice  */
        ScheduleDTO choiceScheduleDTO = new ScheduleDTO();
        MovieDTO choiceMovieDTO = new MovieDTO();
        System.out.println("서비스 03 " + schedule_code);
        CinemaAddressDTO choiceCinemaAddressDTO = new CinemaAddressDTO();
        choiceMovieDTO.setCode((String)choiceScheduleEntity[0]);
        choiceMovieDTO.setTitle((String)choiceScheduleEntity[1]);
        choiceMovieDTO.setRating((String)choiceScheduleEntity[2]);
        choiceScheduleDTO.setTakeDate((String)choiceScheduleEntity[3]);
        choiceScheduleDTO.setStartTime((String)choiceScheduleEntity[4]);
        choiceScheduleDTO.setEndTime((String)choiceScheduleEntity[5]);
        choiceCinemaAddressDTO.setCinemaName((String)choiceScheduleEntity[6]);
        choiceScheduleDTO.setAuditorium((String)choiceScheduleEntity[7]);
        choiceScheduleDTO.setTeenagerPrice((Long)choiceScheduleEntity[8]);
        choiceScheduleDTO.setAdultPrice((Long)choiceScheduleEntity[9]);
        choiceScheduleDTO.setDisabledPrice((Long)choiceScheduleEntity[10]);
        Object[] ChoiceScheduleInfo = {choiceScheduleDTO,choiceMovieDTO,choiceCinemaAddressDTO};
        return ChoiceScheduleInfo;
    }

    public List<SeatDTO> getRemainingSeats(String scheduleCode) {
    System.out.println("서비스 01 " + scheduleCode);

    String jpql = "SELECT SeatEntity.setNum FROM SeatEntity " +
                 "INNER JOIN OrderEntity on SeatEntity.orderCode = OrderEntity.orderCode " +
                 "WHERE OrderEntity.scheduleCode = "+scheduleCode;
    TypedQuery<SeatEntity> query = entityManager.createQuery(jpql, SeatEntity.class);

    List<SeatEntity> remainingSeatEntities = query.getResultList();

    // SeatEntity를 SeatDTO로 변환
    List<SeatDTO> remainingSeats = new ArrayList<>();
    for(SeatEntity seatEntit : remainingSeatEntities){
    SeatDTO seatDTO = new SeatDTO();
    seatDTO = SeatDTO.toSeatDTO(seatEntit);
    remainingSeats.add(seatDTO);
    }
    return remainingSeats;
}
    }
    

