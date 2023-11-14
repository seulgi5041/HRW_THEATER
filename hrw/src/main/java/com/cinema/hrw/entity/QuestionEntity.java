package com.cinema.hrw.entity;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Table;

import com.cinema.hrw.dto.QuestionDTO;

import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "Question_table")
public class QuestionEntity {
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idx;

    @Column(nullable = false)
    private String userId;

    @Column(nullable = false)
    private String userName;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String userQuestion;

    @Column(nullable = false)
    private String userEmail;

    @Column
    private LocalDate registrationDate;  // Java 8의 LocalDate 사용

    @PrePersist
    public void prePersist() {
        this.registrationDate = LocalDate.now();  // 현재 날짜로 설정
    }
    
    public static QuestionEntity toQuestionEntity(QuestionDTO questionDTO) {
    	QuestionEntity questionEntity = new QuestionEntity();
    	questionEntity.setUserId(questionDTO.getUserId());
    	questionEntity.setUserName(questionDTO.getUserName());
    	questionEntity.setUserQuestion(questionDTO.getUserQuestion());
    	questionEntity.setUserEmail(questionDTO.getUserEmail());
    	return questionEntity;
    }

}