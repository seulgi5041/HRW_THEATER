package com.cinema.hrw.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cinema.hrw.entity.MemberEntity;

public interface MemberRepository extends JpaRepository<MemberEntity, Long> {

	Optional<MemberEntity> findByUserId(String userId);

}
