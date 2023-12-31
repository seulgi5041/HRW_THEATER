<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
    <link rel="stylesheet" href="../css/member/form/find_id_form.css">
</head>
<body> 

    <jsp:include page="../include/header.jsp"/>

    <div class="container">
    
    <form method="post" action="/member/findId">
    	<h3 class="title">아이디 찾기</h3>
    	
    	<h4 class="subtitle">본인 확인 이메일 인증</h4>
    	 
	    	<div class="form-group">
	    		<p class="label-text">이름
	    		<input type="text" id="user_Name" name="userName" maxlength="20" placeholder="이름을 입력하세요.">
	    	</div>
	    	
	    	<div class="form-group">
		    	<p class="label-text">이메일 주소 <input type="email" id="userEmail" name="userEmail" placeholder="이메일을 입력해 주세요.">
		    			<input type="submit" value="아이디 찾기" onclick="find_id_ok.jsp">
		    </div>
    </form>
    
    </div>
    
    <jsp:include page="../include/footer.jsp"/>

</body>
</html>