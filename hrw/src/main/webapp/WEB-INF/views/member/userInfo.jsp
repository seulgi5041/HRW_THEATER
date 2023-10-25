<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보</title> 
    <link rel="stylesheet" href="../css/member/form/userInfo.css">
        <script src="../js/userInfo.js"></script>
</head>
<body> 
    <jsp:include page="../include/header.jsp"/>

    <div class="container">
       
        <div class="word">
            <h2>회원 프로필</h2>
        </div>
        
        <hr>

        <form action="" id = "userForm" method="post">
            <div class="input-container"> 
                <div class="input-group">
                    <label for="userId">* 아이디</label>
                    <input type="text" id="userId" name="userId" value="${userInfo.userId}" readonly maxlength="20"> 
                </div>

                <div class="input-group">
                    <label for="userPassword">* 비밀번호</label>
                    <input type="password" id="userPassword" name="userPassword" value="${userInfo.userPassword}" placeholder="영문,숫자(6자리 이상)" maxlength="20" required="required">
                </div> 

                <div class="input-group">
                    <label for="userPasswordAgain">* 비밀번호 확인</label>
                    <input type="password" id="userPasswordAgain" name="userPasswordAgain" value="${userInfo.userPasswordAgain}" placeholder="비밀번호 확인" maxlength="20" required="required">
                </div>

                <div class="input-group">
                    <label for="userName">* 이름</label>
                    <input type="text" id="userName" name="userName" value="${userInfo.userName}" placeholder="이름" maxlength="20" required="required">
                </div>

                <div class="input-group">
                    <label for="userGender">* 성별</label>
                    <select id="userGender" name="userGender">
                        <option value="">성별</option>
                        <option value="M" ${userInfo.userGender == 'M' ? 'selected' : ''}>남성</option>
                        <option value="W" ${userInfo.userGender == 'W' ? 'selected' : ''}>여성</option>
                    </select>
                </div>

                <div class="input-group">
                    <label for="userEmail">* 이메일</label>
                    <input type="email" id="userEmail" name="userEmail" value="${userInfo.userEmail}" placeholder="이메일" required="required">
                </div>

                <div class="input-group">
                    <label for="userPhone">* 연락처</label>
                    <input type="text" id="userPhone" name="userPhone" value="${userInfo.userPhone}" placeholder="연락처(' -'포함하여 입력)" maxlength="20" required="required">
                </div>

				<div class="button-group">
				        <input type="button" value="회원 수정" class="big-button" onclick="submitForm('/member/update');">
				        <input type="button" value="회원 탈퇴" class="big-button" onclick="submitForm('/member/delete');">
				</div>
            </div>
        </form>
    </div>

    <jsp:include page="../include/footer.jsp"/>

	<script>	
	    <c:if test="${sessionScope.message != null}">
	    alert("${sessionScope.message}");
	    <c:remove var="message" scope="session"/>  // 메시지 표시 후 세션에서 삭제
		</c:if>
	</script>
	    
	
</body>
</html>
