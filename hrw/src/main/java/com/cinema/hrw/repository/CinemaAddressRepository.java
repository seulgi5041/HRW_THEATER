package com.cinema.hrw.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cinema.hrw.entity.CinemaAddressEntity;

public interface CinemaAddressRepository extends JpaRepository<CinemaAddressEntity, String> {

}