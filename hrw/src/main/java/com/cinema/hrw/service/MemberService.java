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
		// 1. dto -> entity 로 변환.
		MemberEntity memberEntity = MemberEntity.toMemberEntity(memberDTO);
		memberRepository.save(memberEntity);	// 여긴 무조건 세이브.
		System.out.println(memberEntity);
		// 2. repository 의 save 호출.(조건. entity 객체를 넘겨줘야 함.)
	}

	public MemberDTO login(MemberDTO memberDTO) {
		/*
		 * 1. 회원이 입력한 이메일로 DB에서 조회를 함.
		 * 2. DB에서 조회한 비밀번호의 사용자가 입력한 비밀번호가 일치하는지 판단.
		 */
		
		Optional<MemberEntity> byUserId = memberRepository.findByUserId(memberDTO.getUserId());
		
		if (byUserId.isPresent()) {
			// 조회 결과가 있음.(해당 아이디를 가진 정보가 있다.)
			MemberEntity memberEntity = byUserId.get();
				if(memberEntity.getUserPassword().equals(memberDTO.getUserPassword())) {
					// 비밀번호 일치할 경우.
					// entity -> dto 변환 후 리턴.
					MemberDTO dto = memberDTO.toMemberDTO(memberEntity);
					return dto;
				} else {
					// 비밀번호 불일치(로그인 실패);
					return null;
				}
				}else {
				//조회 결과 없음(해당  아이디를 가진 회원이 없다.)
				return null;
			}
		}
	

}
