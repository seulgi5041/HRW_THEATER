package com.cinema.hrw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

import com.cinema.hrw.dto.CinemaAddressDTO;
import com.cinema.hrw.entity.CinemaAddressEntity;
import com.cinema.hrw.repository.CinemaAddressRepository;

@Service
public class CinemaAddressService {

  private final CinemaAddressRepository cinemaAddressRepository;

  @Autowired
  public CinemaAddressService(CinemaAddressRepository cinemaAddressRepository) {
    this.cinemaAddressRepository = cinemaAddressRepository;
  }

  public List<CinemaAddressDTO> getAllCinemaAddresses() {
    List<CinemaAddressEntity> cinemaAddressEntities = cinemaAddressRepository.findAll();
    return cinemaAddressEntities.stream()
        .map(CinemaAddressDTO::toCinemaAddressDTO)
        .collect(Collectors.toList());
  }

  // 로컬 가져오는 부분
  public List<String> getAllLocalValues() {
    List<String> localValues = cinemaAddressRepository.findAllLocalValues();
    return localValues;
  }

  // 시네마네임(지점)가져오기
  public List<String> getCinemaNamesByLocal(String local) {
    List<String> cinemaNames = cinemaAddressRepository.findCinemaNamesByLocal(local);
    return cinemaNames;
  }
}