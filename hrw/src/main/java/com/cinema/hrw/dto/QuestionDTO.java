package com.cinema.hrw.dto;

import com.cinema.hrw.entity.QuestionEntity;

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
public class QuestionDTO {
	
	private Long idx;
	private String userId;
	private String userName;
	private String userQuestion;
	private String userEmail;
	private String registrationDate;
	

}
