package com.cinema.hrw.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.cinema.hrw.dto.CinemaAddressDTO;
import com.cinema.hrw.dto.MovieDTO;
import com.cinema.hrw.entity.CinemaAddressEntity;
import com.cinema.hrw.repository.ReservationRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReservationService {
	
    private final ReservationRepository reservationRepository;

    public List<String> getCinemaNamesInLocation(String location) {
        return reservationRepository.findCinemaNamesByLocation(location);
    }
    
    public List<CinemaAddressDTO> findAll() {
    	List<CinemaAddressEntity> cinemaEntites = reservationRepository.findAll();
    	
    	List<CinemaAddressDTO> cinemaList = new ArrayList<>();
    	
    	for (CinemaAddressEntity cinemaAddressEntity : cinemaEntites) {
    		CinemaAddressDTO cinemaAddressDTO = new CinemaAddressDTO();
    		cinemaAddressDTO = cinemaAddressDTO.toCinemaAddressDTO(cinemaAddressEntity);
    		cinemaList.add(cinemaAddressDTO);
    	}
    	return cinemaList;
    }

}
