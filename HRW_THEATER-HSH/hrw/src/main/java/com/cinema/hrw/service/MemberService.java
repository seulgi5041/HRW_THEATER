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
		// 1. dto -> entity �� ��ȯ
		MemberEntity memberEntity = MemberEntity.toMemberEntity(memberDTO);
		memberRepository.save(memberEntity);	//���� ������ ���̺�
		System.out.println(memberEntity);
		// 2. repositoryd�� save ȣ��
	}

	public MemberDTO login(MemberDTO memberDTO) {
		/*
		 * 1. ȸ���� �Է��� �̸��Ϸ� DB���� ��ȸ�� ��
		 * 2. DB���� ��ȸ�� ��й�ȣ�� ����ڰ� �Է��� ��й�ȣ�� ��ġ�ϴ��� �Ǵ�.
		 */
		
		Optional<MemberEntity> byUserId = memberRepository.findByUserId(memberDTO.getUserId());
		
		if (byUserId.isPresent()) {
			// ��ȸ ����� ����.( �ش� �̸��� ���� ������ �ִ�.)
			MemberEntity memberEntity = byUserId.get();
				if(memberEntity.getUserPassword().equals(memberDTO.getUserPassword())) {
					// ��й�ȣ ��ġ
					// entity -> dto ��ȯ �� ����
					MemberDTO dto = memberDTO.toMemberDTO(memberEntity);
					return dto;
				} else {
					// ��й�ȣ ����ġ(�α��� ����)
					return null;
				}
				}else {
				// ��ȸ ��� ����(�ش� �̸����� ���� ȸ���� ����.)
				return null;
			}
		}
	

}
