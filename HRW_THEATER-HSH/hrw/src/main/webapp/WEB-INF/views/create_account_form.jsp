<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title> 
    <link rel="stylesheet" href="resources/css/form/create_account_form.css" />   
</head>
<body> 
    <jsp:include page="header.jsp"/>

    <div class="container">
    	
        <div class="word">
            <h2>회원 정보</h2>
             
       		 <h5> * 값은 필수 입력값입니다.</h5>
        </div>
        
        <hr>

        <form action="create_account_Action.jsp" method="post">
            <div class="input-container"> 
                <div class="input-group">
                    <label for="user_ID">* 아이디</label>
                    <input type="text" id="user_ID" name="user_ID" placeholder="영문,숫자 6~20자" maxlength="20" required="required">
                    <input type="button" value="중복 확인">
                </div>

                <div class="input-group">
                    <label for="user_PW">* 비밀번호</label>
                    <input type="password" id="user_PW" name="user_PW" placeholder="영문,숫자(6자리 이상)" maxlength="20" required="required">
                </div>

                <div class="input-group">
                    <label for="user_PW_Again">* 비밀번호 확인</label>
                    <input type="password" id="user_PW_Again" name="user_PW_Again" placeholder="비밀번호 확인" maxlength="20" required="required">
                </div>

                <div class="input-group">
                    <label for="user_Name">* 이름</label>
                    <input type="text" id="user_Name" name="user_Name" placeholder="이름" maxlength="20" required="required">
                </div>

                <div class="input-group">
                    <label for="user_Gender">* 성별</label>
                    <select id="user_Gender" name="user_Gender">
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
                    <input type="submit" value="회원 가입" class="big-button"> 
                    <input type="reset" value="초기화" class="big-button">
                </div>
            </div>
        </form>
    </div>

    <jsp:include page="footer.jsp"/>
</body>
</html>
