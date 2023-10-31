package com.cinema.hrw.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cinema.hrw.entity.CinemaAddressEntity;

@Repository
public interface CinemaAddressRepository extends JpaRepository<CinemaAddressEntity, String> {
}