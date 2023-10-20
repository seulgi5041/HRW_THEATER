<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 결과</title>
<link rel="stylesheet" href="resources/css/form/find_password_ok.css" />
</head>
<body>

    <jsp:include page="header.jsp"/>
    
    <div class="container">
    
        <form>
    	    <h3 class="title">비밀번호 찾기</h3>
    	
    	    <h4 class="subtitle">고객님의 정보와 일치하는 아이디 목록입니다.</h4>
    	
    	    <div class="password-display"> 아이디 : <br> 비밀번호 :  <!-- db에서 가져온 아이디, 비밀번호 --></div>
    	
    	    <p>
                <input type="button" value="로그인 하기" onclick="location.href='login_form.jsp'">
                <input type="button" value="홈" onclick="location.href=main.jsp'"> 
            </p>
    	
        </form>
    
    </div>
    
    <jsp:include page="footer.jsp"/>
</body>
</html>
