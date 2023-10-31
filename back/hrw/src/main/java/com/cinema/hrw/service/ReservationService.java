package com.cinema.hrw.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.cinema.hrw.dto.CinemaAddressDTO;
import com.cinema.hrw.dto.MovieDTO;
import com.cinema.hrw.dto.ScheduleDTO;
import com.cinema.hrw.dto.SeatDTO;
import com.cinema.hrw.entity.SeatEntity;
import com.cinema.hrw.repository.ScheduleRepository;
import com.cinema.hrw.repository.SeatRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReservationService {
    private final SeatRepository  seatRepository;
    private final ScheduleRepository scheduleRepository;

    public List<SeatDTO> getRemainingSeats(String schedule_code) {
        System.out.println("서비스 01" + schedule_code);
        List<SeatEntity> remainingSeatsEntity =seatRepository.findSeatNameByScheduleCode(schedule_code);
        List<SeatDTO>seatList = new ArrayList<>();
        System.out.println("getRemainingSeats  "+ schedule_code);
        for(SeatEntity seatEntity : remainingSeatsEntity){
            SeatDTO seatDTO = new SeatDTO();
            seatDTO = SeatDTO.toSeatDTO(seatEntity);
            seatList.add(seatDTO);
        }
        return seatList;
    }

    public Object[] getChoiceScheduleInfo(String schedule_code) {
        Object[] choiceScheduleEntity = scheduleRepository.findScheduleDetailsByScheduleCode(schedule_code); 
    /*m.code , m.title, m.rating, s.takeDate, s.startTime, s.endTime, c.cinemaName , s.auditorium, s.teenagerPrice, s.adultPrice, s.disabledPrice  */
        ScheduleDTO choiceScheduleDTO = new ScheduleDTO();
        MovieDTO choiceMovieDTO = new MovieDTO();
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
    
}
