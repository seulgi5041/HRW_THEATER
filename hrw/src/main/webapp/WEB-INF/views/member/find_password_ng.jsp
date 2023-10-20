<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 결과</title>
<link rel="stylesheet" href="resources/css/form/find_password_ng.css" />
</head>
<body>

    <jsp:include page="header.jsp"/>
    
    <div class="container">
    
        <form>
    	    <h3 class="title">비밀번호 찾기</h3>
    	
    	    <div class="result">
    		    <img src="resources/img/forbidden.png" alt="금지 아이콘">입력하신 정보와 일치하는 회원정보가 없습니다.
    	    </div>
    	
    	    <p>
                <input type="button" value="로그인 하기" class="#" onclick="location.href='login_form.jsp'"> 
                <input type="button" value="회원가입" class="#" onclick="location.href='create_account_form.jsp'">
            </p>
    	
        </form>
    
    </div>
    
    <jsp:include page="footer.jsp"/>
</body>
</html>
