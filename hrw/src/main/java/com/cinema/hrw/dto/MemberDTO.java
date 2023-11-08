package com.cinema.hrw.dto;

import com.cinema.hrw.entity.MemberEntity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MemberDTO {

	private String userId;
	private String userPassword;
	private String userPasswordAgain;
	private String userName;
	private String userGender;
	private String userEmail;
	private String userPhone;

	public static MemberDTO toMemberDTO(MemberEntity memberEntity) {
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setUserId(memberEntity.getUserId());
		memberDTO.setUserPassword(memberEntity.getUserPassword());
		memberDTO.setUserPasswordAgain(memberEntity.getUserPasswordAgain());
		memberDTO.setUserName(memberEntity.getUserName());
		memberDTO.setUserGender(memberEntity.getUserGender());
		memberDTO.setUserEmail(memberEntity.getUserEmail());
		memberDTO.setUserPhone(memberEntity.getUserPhone());
		return memberDTO;

	}

}
