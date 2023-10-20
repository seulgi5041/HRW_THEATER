<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="../css/loginForm.css">
</head>
<body>
    <jsp:include page="include/header.jsp"/>

    <div class="container">
        <form method="post" action="/member/login">
            <div class="login_logo">
				<a href="#"><img src="resources/images/main/smallLogo.jpg" alt="메인 로고" ></a>
      		</div>
      		<h1> 로그인</h1>
      		
      		<h2>HRW의 다양한 서비스와 혜택을 누리세요!</h2>
      		
            <p>
                <input type="text" placeholder="아이디를 입력해주세요" name="userId" maxlength="20">
            </p>
            <p>
                <input type="password" placeholder="비밀번호를 입력해주세요" name=userPassword maxlength="20">
            </p>
            <p>
                <input type="submit" value="로그인">
            </p>
            <ul>

            </ul>
        </form>
    </div>

    <jsp:include page="include/footer.jsp"/>
</body>
</html>
