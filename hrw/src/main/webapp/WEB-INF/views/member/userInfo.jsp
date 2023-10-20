<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보</title> 
    <link rel="stylesheet" href="resources/css/form/create_account_form.css" />   
</head>
<body> 
    <jsp:include page="../include/header.jsp"/>

    <div class="container">
    	
        <div class="word">
        
            <h2>회원 프로필</h2>

        </div>
        
        <hr>

        <form action="update_account_Action" method="post">
            <div class="input-container"> 
                <div class="input-group">
                    <label for="u_m_id">* 아이디</label>
                    <input type="text" id="u_m_id" name="u_m_id" placeholder="아이디 보일 곳! 고치지 못하게!" readonly maxlength="20">
                </div>

                <div class="input-group">
                    <label for="u_m_pw">* 비밀번호</label>
                    <input type="password" id="u_m_pw" name="u_m_pw" placeholder="영문,숫자(6자리 이상)" maxlength="20" required="required">
                </div> 

                <div class="input-group">
                    <label for="u_m_pw_again">* 비밀번호 확인</label>
                    <input type="password" id="u_m_pw_again" name="u_m_pw_again" placeholder="비밀번호 확인" maxlength="20" required="required">
                </div>

                <div class="input-group">
                    <label for="user_Name">* 이름</label>
                    <input type="text" id="user_Name" name="user_Name" placeholder="이름" maxlength="20" required="required">
                </div>

                <div class="input-group">
                    <label for="u_m_gender">* 성별</label>
                    <select id="u_m_gender" name="u_m_gender">
                        <option value="">성별</option>
                        <option value="M">남성</option>
                        <option value="W">여성</option>
                    </select>
                </div>

                <div class="input-group">
                    <label for="user_Email">* 이메일</label>
                    <input type="email" id="user_Email" name="user_Email" placeholder="이메일" required="required">
                </div>

                <div class="input-group">
                    <label for="user_Phone">* 연락처</label>
                    <input type="text" id="user_Phone" name="user_Phone" placeholder="연락처(' -'포함하여 입력)" maxlength="20" required="required">
                </div>

                <div class="button-group">
                    <input type="button" value="회원 수정" class="big-button" onclick="#"> 
                    <input type="reset" value="회원 탈퇴" class="big-button">
                </div>
            </div>
        </form>
    </div>

    <jsp:include page="../include/footer.jsp"/>
    
    <script src="resources/js/userInfo.js"></script>  
    
</body>
</html>
