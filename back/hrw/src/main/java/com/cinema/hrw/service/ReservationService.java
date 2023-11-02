package com.cinema.hrw.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Service;

import com.cinema.hrw.dto.CinemaAddressDTO;
import com.cinema.hrw.dto.ScheduleDTO;
import com.cinema.hrw.dto.SeatDTO;
import com.cinema.hrw.entity.CinemaAddressEntity;
import com.cinema.hrw.entity.MovieEntity;
import com.cinema.hrw.entity.ScheduleEntity;
import com.cinema.hrw.entity.SeatEntity;
import com.cinema.hrw.repository.ReservationRepository;

import lombok.RequiredArgsConstructor;



@Service
@RequiredArgsConstructor
public class ReservationService {
    @PersistenceContext
    private EntityManager entityManager;
    private final ReservationRepository reservationRepository;


    

    public List<SeatDTO> getRemainingSeats(String scheduleCode) {
    
        String jpql = "SELECT s FROM SeatEntity s " +
                     "INNER JOIN s.orderCode o " +
                     "WHERE o.scheduleCode = " + scheduleCode;
    
        TypedQuery<SeatEntity> query = entityManager.createQuery(jpql, SeatEntity.class);
        
        List<SeatEntity> remainingSeatEntities = query.getResultList();
    
        // SeatEntity를 SeatDTO로 변환
        List<SeatDTO> remainingSeats = new ArrayList<>();
        
        for (SeatEntity seatEntity : remainingSeatEntities) {
            SeatDTO seatDTO = SeatDTO.toSeatDTO(seatEntity);
            remainingSeats.add(seatDTO);
        }
        
        return remainingSeats;
    }


    public ScheduleDTO getChoiceScheduleInfo(String scheduleCode) {
       String jpql = "SELECT s FROM ScheduleEntity s INNER JOIN FETCH s.movieCode m INNER JOIN FETCH s.cinemaCode c WHERE s.scheduleCode = "+scheduleCode;
       TypedQuery<ScheduleEntity> query = entityManager.createQuery(jpql, ScheduleEntity.class);
       
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


    public List<CinemaAddressDTO> getsss() {
        List<CinemaAddressEntity> sss= reservationRepository.findAll();
        List<CinemaAddressDTO>sssss = new ArrayList<>();
        for(CinemaAddressEntity cinemaAddressEntity : sss){
            CinemaAddressDTO aaa = new CinemaAddressDTO();
            aaa = CinemaAddressDTO.toCinemaAddressDTO(cinemaAddressEntity);
            sssss.add(aaa);
        }
        return sssss;
    }


    }
    

