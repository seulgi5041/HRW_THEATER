package com.cinema.hrw.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.cinema.hrw.dto.MemberDTO;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "member_table")	// 테이블 생성 (이름)

public class MemberEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	private Long idx;
	
	@Column (unique = true)
	private String userId;
	
	@Column
	private String userPassword;
	
	@Column
	private String userPasswordAgain;
	
	@Column
	private String userName;
	
	@Column
	private String userGender;
	
	@Column 
	private String userEmail;
	
	@Column
	private String userPhone;

	public static MemberEntity toMemberEntity(MemberDTO memberDTO) {
		MemberEntity memberEntity = new MemberEntity();
		memberEntity.setUserId(memberDTO.getUserId());
		memberEntity.setUserPassword(memberDTO.getUserPassword());
		memberEntity.setUserPasswordAgain(memberDTO.getUserPasswordAgain());
		memberEntity.setUserName(memberDTO.getUserName());
		memberEntity.setUserGender(memberDTO.getUserGender());
		memberEntity.setUserEmail(memberDTO.getUserEmail());
		memberEntity.setUserPhone(memberDTO.getUserPhone());
		return memberEntity;
	}
	

}
