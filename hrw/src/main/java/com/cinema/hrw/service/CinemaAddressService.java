package com.cinema.hrw.service;

import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import com.cinema.hrw.dto.CinemaAddressDTO;
import com.cinema.hrw.entity.CinemaAddressEntity;
import com.cinema.hrw.repository.CinemaAddressRepository;

@Service
public class CinemaAddressService {

  private final CinemaAddressRepository cinemaAddressRepository;

  public CinemaAddressService(CinemaAddressRepository cinemaAddressRepository) {
    this.cinemaAddressRepository = cinemaAddressRepository;
  }

  public List<CinemaAddressDTO> getAllCinemaAddresses() {
    List<CinemaAddressEntity> cinemaAddressEntities = cinemaAddressRepository.findAll();
    return cinemaAddressEntities.stream()
        .map(CinemaAddressDTO::toCinemaAddressDTO)
        .collect(Collectors.toList());
  }
}