package com.cinema.hrw.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.cinema.hrw.entity.CinemaAddressEntity;

public interface CinemaAddressRepository extends JpaRepository<CinemaAddressEntity, String> {

}