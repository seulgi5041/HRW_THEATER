package com.cinema.hrw.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cinema.hrw.entity.MemberEntity;

public interface MemberRepository extends JpaRepository<MemberEntity, String> {	

	Optional<MemberEntity> findByUserId(String userId);

	Optional<MemberEntity> findByUserNameAndUserEmail(String userName, String userEmail);

	Optional<MemberEntity> findByUserIdAndUserNameAndUserEmailAndUserPhone(String userId, String userName, String userEmail, String userPhone);

	boolean existsByUserId(String userId);
	
	boolean existsByUserEmail(String userEmail);
	
	int countByUserId(String userId);
	
	
}