<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 결과</title>
    <link rel="stylesheet" href="../css/member/result/find_password_ok.css">
</head>
<body>

    <jsp:include page="../include/header.jsp"/>
    
    <div class="container">
    
        <form>
    	    <h3 class="title">비밀번호 찾기</h3>
    	
    	    <h4 class="subtitle">고객님의 정보와 일치하는 아이디 목록입니다.</h4>
    	
			<div class="password-display">
			    아이디: ${foundUserId} 
			    <br> 
			    비밀번호: ${foundUserPassword} 
			</div>

    	
    	    <p>
                <a href="/member/login"><input type="button" value="로그인 하기" class="#"> </a>
                <a href="/"><input type="button" value="홈" class="#"></a>
            </p>
    	
        </form>
    
    </div>
    
    <jsp:include page="../include/footer.jsp"/>
</body>
</html>
