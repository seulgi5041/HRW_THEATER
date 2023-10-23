package com.cinema.hrw.service;

import java.util.Optional;

import org.springframework.stereotype.Service;

import com.cinema.hrw.dto.MemberDTO;
import com.cinema.hrw.entity.MemberEntity;
import com.cinema.hrw.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService {
	
	private final MemberRepository memberRepository;
	
	public void join(MemberDTO memberDTO) {
		// 1. dto -> entity로 변환.
		MemberEntity memberEntity = MemberEntity.toMemberEntity(memberDTO);
		memberRepository.save(memberEntity);	// 저장 성공 여부 확인.
		System.out.println(memberEntity);
		// 2. repository의 save 메서드.(주의: entity 객체를 저장해야 함.)
	}

	public MemberDTO login(MemberDTO memberDTO) {
		/*
		 * 1. 회원이 입력한 이메일로 DB에서 조회를 함.
		 * 2. DB에서 조회한 비밀번호의 사용자가 입력한 비밀번호와 일치하는지 확인.
		 */
		
		Optional<MemberEntity> byUserId = memberRepository.findByUserId(memberDTO.getUserId());
		
		if (byUserId.isPresent()) {
			// 조회 결과가 있음.(해당 아이디를 가진 회원 정보가 있음.)
			MemberEntity memberEntity = byUserId.get();
			if(memberEntity.getUserPassword().equals(memberDTO.getUserPassword())) {
				// 비밀번호 일치하는 경우.
				// entity -> dto 변환 후 반환.
				MemberDTO dto = memberDTO.toMemberDTO(memberEntity);
				return dto;
			} else {
				// 비밀번호 불일치(로그인 실패);
				return null;
			}
		} else {
			// 조회 결과 없음(해당 아이디를 가진 회원이 없음.)
			return null;
		}
	}
	
	public MemberDTO searchId(MemberDTO memberDTO) {
	    Optional<MemberEntity> byUserNameAndUserEmail = memberRepository.findByUserNameAndUserEmail(memberDTO.getUserName(), memberDTO.getUserEmail());
	    System.out.println(memberDTO.getUserName() + " " + memberDTO.getUserEmail());
	    if (byUserNameAndUserEmail.isPresent()) {
	        // 조회 결과 있음.
	        MemberEntity memberEntity = byUserNameAndUserEmail.get();
	        MemberDTO dto = memberDTO.toMemberDTO(memberEntity);
	        return dto;  
	    } else {
	        // 조회 결과 없음.
	        return null;  // 또는 적절한 예외를 던질 수 있습니다.
	    }
	}

	public MemberDTO searchPw(MemberDTO memberDTO) {
		Optional<MemberEntity> byUserSearchPw = memberRepository.findByUserIdAndUserNameAndUserEmailAndUserPhone(memberDTO.getUserId(),memberDTO.getUserName(),memberDTO.getUserEmail(), memberDTO.getUserPhone());
		if (byUserSearchPw.isPresent()) {
			// 조회결과 있을때
			MemberEntity memberEntity = byUserSearchPw.get();
			MemberDTO dto =memberDTO.toMemberDTO(memberEntity);
			return dto;
		} else {
			// 조회 결과 없음
			return null;
		}
		
	}
}
