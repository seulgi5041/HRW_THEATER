<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
    <link rel="stylesheet" href="../css/member/result/find_id_ng.css">
</head>
<body>

    <jsp:include page="../include/header.jsp"/>
    
    <div class="container">
    
        <form>
    	    <h3 class="title">아이디 찾기</h3>
    	
    	    <div class="result">
    		    <img src="../images/forbidden.png" alt="금지 아이콘">입력하신 정보와 일치하는 회원정보가 없습니다.
    	    </div>
    	
    	    <p>
                <a href="/member/login"><input type="button" value="로그인 하기" class="#"> </a>
                <a href="/member/join"><input type="button" value="회원가입" class="#"></a>
            </p>
    	
        </form>
    
    </div>
    
    <jsp:include page="../include/footer.jsp"/>
</body>
</html>
