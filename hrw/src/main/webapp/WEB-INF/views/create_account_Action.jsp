<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="user_ID"/>
<jsp:setProperty name="user" property="user_PW"/>
<jsp:setProperty name="user" property="user_PW_Again"/>
<jsp:setProperty name="user" property="user_Name"/>
<jsp:setProperty name="user" property="user_Gender"/>
<jsp:setProperty name="user" property="user_Email"/>
<jsp:setProperty name="user" property="user_Phone"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title> 
</head>
<body> 

   <% 
    UserDAO userDao = new UserDAO();
    int result = userDao.createMember(user.getUser_ID(), user.getUser_PW(), user.getUser_PW_Again(), user.getUser_Name(),
            user.getUser_Gender(), user.getUser_Email(), user.getUser_Phone());
    String alertMessage = "";
    String action = "history.back()"; // 기본 동작은 이전 페이지로 돌아가기

    switch(result) {
        case 1:
            alertMessage = "회원가입 성공";
            action = "location.href = 'login_form.jsp'";
            break;
        case 0:
            alertMessage = "회원가입 실패. 다시 시도해주세요.";
            break;
        case -1:
            alertMessage = "비밀번호가 틀립니다.";
            break;
        case -2:
            alertMessage = "데이터베이스 오류가 발생했습니다.";
            break;
    }
%>
<script>
    alert('<%= alertMessage %>');
    <%= action %>;
</script>

</body>
</html>
