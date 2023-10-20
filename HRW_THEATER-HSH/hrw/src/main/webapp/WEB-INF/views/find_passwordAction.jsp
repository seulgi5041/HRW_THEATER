<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="user_ID"/> 	<!--  user 안에 User 안에 들어이있는 User ID사용  -->
<jsp:setProperty name="user" property="user_PW"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		UserDAO userDao = new UserDAO();
		int result = userDao.findPW(user.getUser_ID(), user.getUser_Name(), user.getUser_Email(), user.getUser_Phone());
		if (result == 1) {
			PrintWriter script = response.getWriter();
			
			script.println("<script>");
			script.println("location.href = 'find_password_ok.jsp'");
			script.println("</script>");
			
		}else if (result == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'find_password_ng.jsp'");
			script.println("</script>");
			System.out.println(user.getUser_ID() + user.getUser_Name() + user.getUser_Email() + user.getUser_Phone());
			
		} else if (result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");	//전페이지로 돌려보내기 
			script.println("</script>");
		}
	%>
</body>
</html>