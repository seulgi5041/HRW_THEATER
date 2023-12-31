<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
    <link rel="stylesheet" href="../css/member/form/find_password_form.css">
</head>
<body>

    <jsp:include page="../include/header.jsp"/>

    <div class="container">
    
    <form method="post" action="/member/findPassword">
    	<h3 class="title">비밀번호 찾기</h3>
    	
    	<h4 class="subtitle">본인 확인 이메일 인증 및 휴대전화 인증</h4>
    	
    		<div class="form-group">
		    	<p class="label-text">아이디 <input type="text" name="userId" placeholder="찾고자 하는 아이디를 입력하세요."> 
    		</div>
    	
	    	<div class="form-group">
	    		<p class="label-text">이름 <input type="text" id="user_Name" name="userName" maxlength="20" placeholder="이름을 입력하세요.">
	    	</div>
	    	
	    	<div class="form-group">
		    	<p class="label-text">이메일 주소 <input type="email" id="user_Email" name="userEmail" placeholder="이메일을 입력해 주세요."> 
		    </div> 
		    
		    <div class="form-group">
		    	<p class="label-text">연락처 <input type="text" name="userPhone" placeholder="'-' 하이픈을 포함하여 연락처를 입력해주세요."> <br>
		    			<input type="submit" value="비밀번호 찾기">
    		</div>
    		
    		
    		
    	</form>
    </div>
    
    <jsp:include page="../include/footer.jsp"/>
	    <% if (request.getAttribute("errorMessage") != null) { %>
    <script>
        alert('<%= request.getAttribute("errorMessage") %>');
    </script>
<% } %>
</body>
</html>