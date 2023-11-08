package com.cinema.hrw.service;

import java.util.Optional;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.cinema.hrw.dto.MemberDTO;
import com.cinema.hrw.entity.MemberEntity;
import com.cinema.hrw.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService {
	
	private final MemberRepository memberRepository;
	private final PasswordEncoder passwordEncoder;
	
	public void join(MemberDTO memberDTO) throws Exception {
	    // 중복된 userId 확인
	    if (memberRepository.existsByUserId(memberDTO.getUserId())) {
	        throw new Exception("이미 존재하는 아이디입니다.");
	    }

	    // 중복된 userEmail 확인
	    if (memberRepository.existsByUserEmail(memberDTO.getUserEmail())) {
	        throw new Exception("이미 사용 중인 이메일입니다.");
	    }
	    String encryptedPassword = passwordEncoder.encode(memberDTO.getUserPassword());
	    // 비밀번호 암호화를 통해 얻은 값으로 memberDTO의 비밀번호를 갱신
	    memberDTO.setUserPassword(encryptedPassword);
	    
	    // userPasswordAgain도 동일하게 처리
	    String encryptedPasswordAgain = passwordEncoder.encode(memberDTO.getUserPasswordAgain());
	    memberDTO.setUserPasswordAgain(encryptedPasswordAgain);

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
			
			boolean passwordMatches = passwordEncoder.matches(memberDTO.getUserPassword(), memberEntity.getUserPassword());
			if(passwordMatches) {
				// 비밀번호 일치하는 경우.
				// entity -> dto 변환 후 반환.
				MemberDTO dto = MemberDTO.toMemberDTO(memberEntity);
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
	        MemberDTO dto = MemberDTO.toMemberDTO(memberEntity);
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
			MemberDTO dto =MemberDTO.toMemberDTO(memberEntity);
			return dto;
		} else {
			// 조회 결과 없음
			return null;
		}
		
	}

	public void deleteId(MemberDTO memberDTO) {
		memberRepository.deleteById(memberDTO.getUserId());
		
	}
	
	public MemberDTO getCurrentUserInfo(String userId) {
	    Optional<MemberEntity> userEntity = memberRepository.findByUserId(userId);
	    if(userEntity.isPresent()) {
	        return MemberDTO.toMemberDTO(userEntity.get());
	    }
	    return null;
	}

    public void updateUserInfo(MemberDTO memberDTO) throws Exception {
        // 데이터베이스에서 현재 유저 정보를 가져옵니다.
        Optional<MemberEntity> optMember = memberRepository.findByUserId(memberDTO.getUserId());
        
        // 해당 유저가 존재하지 않으면 예외를 발생시킵니다.
        if (!optMember.isPresent()) {
            throw new Exception("사용자 정보가 존재하지 않습니다.");
        }
        
        MemberEntity member = optMember.get();
        // DTO로부터 가져온 정보를 사용하여 Entity의 값을 업데이트합니다.
        
        String encryptedPassword = passwordEncoder.encode(memberDTO.getUserPassword());
	    
	    String encryptedPasswordAgain = passwordEncoder.encode(memberDTO.getUserPasswordAgain());

	    
        member.setUserPassword(encryptedPassword); // 비밀번호 업데이트
        member.setUserPasswordAgain(encryptedPasswordAgain); // 비밀번호 업데이트
        member.setUserName(memberDTO.getUserName());         // 이름 업데이트
        member.setUserGender(memberDTO.getUserGender());     // 성별 업데이트
        member.setUserEmail(memberDTO.getUserEmail());       // 이메일 업데이트
        member.setUserPhone(memberDTO.getUserPhone());       // 전화번호 업데이트
        // (기타 필드들도 이와 같이 업데이트 가능)
       
        // 변경된 정보를 데이터베이스에 저장합니다.
        memberRepository.save(member);
    }

    public void updateUserPassword(String userId, String userPassword, String userPasswordAgain) throws Exception {
        Optional<MemberEntity> memberEntity = memberRepository.findByUserId(userId);
        if (memberEntity.isPresent()) {
            MemberEntity member = memberEntity.get();
            
            // 새로운 비밀번호와 새로운 비밀번호 확인이 일치하는지 확인
            if (!userPassword.equals(userPasswordAgain)) {
                throw new Exception("새로운 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            }

            // 영문과 숫자로 6자 이상인지 확인
            if (!isPasswordValid(userPassword)) {
                throw new Exception("비밀번호는 영문과 숫자를 혼합하여 6자 이상이어야 합니다.");
            }
            
            String encryptedPassword = passwordEncoder.encode(userPassword);
            String encryptedPasswordAgain = passwordEncoder.encode(userPasswordAgain);

            member.setUserPassword(encryptedPassword);
            member.setUserPasswordAgain(encryptedPasswordAgain);

            memberRepository.save(member);
        } else {
            System.out.println("오류");
        }
    }

    // 비밀번호 유효성 검사를 수행하는 메서드
    private boolean isPasswordValid(String password) {
        // 영문자와 숫자가 혼합되어 6자 이상인 경우 유효하다고 가정
        return password.matches("^(?=.*[0-9])(?=.*[a-zA-Z]).{6,}$");
    }
    
    public int idDubleCheck(String userId){
		int dubleCheck = memberRepository.countByUserId(userId);
		return dubleCheck;
	}
}

