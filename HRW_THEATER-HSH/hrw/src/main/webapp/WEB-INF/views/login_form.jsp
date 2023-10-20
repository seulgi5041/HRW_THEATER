<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
   <link rel="stylesheet" href="resources/css/form/login_form.css" />
</head>
<body>
    <jsp:include page="header.jsp"/>

    <div class="container">
        <form method="post" action="loginAction.jsp">
            <div class="login_logo">
				<a href="#"><img src="resources/img/main/smallLogo.jpg" alt="메인 로고" ></a>
      		</div>
      		<h1> 로그인</h1>
      		
      		<h2>HRW의 다양한 서비스와 혜택을 누리세요!</h2>
      		
            <p>
                <input type="text" placeholder="아이디를 입력해주세요" name="user_ID" maxlength="20">
            </p>
            <p>
                <input type="password" placeholder="비밀번호를 입력해주세요" name=user_PW maxlength="20">
            </p>
            <p>
                <input type="submit" value="로그인">
            </p>
            <ul>
                <li><a href="find_password_form.jsp">비밀번호 찾기</a></li>
                <li><a href="find_id_form.jsp">아이디 찾기</a></li>
                <li><a href="create_account_form.jsp">회원가입</a></li>
            </ul>
        </form>
    </div>

    <jsp:include page="footer.jsp"/>
</body>
</html>
