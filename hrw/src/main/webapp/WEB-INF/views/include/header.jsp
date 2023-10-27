<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
    // 세션에서 사용자 정보를 가져옵니다.
    String loggedInUserName = (String) session.getAttribute("loginId"); 
%>
<!DOCTYPE html>
<link rel="stylesheet" href="../css/include/header.css">
<header>
    <!-- 로고 -->
    <div id="main_header">
        <div class="logo">
            <a href="/"><img src="../images/logo.jpg" alt="메인 로고"></a>
        </div>
        
        <% if(loggedInUserName != null) { %> <!-- 로그인 체크 -->
        <!-- 로그인 성공 시 나타나는 부분 -->
        <div class="login_user" id = "login_user">
            <p><span id="user_Name"><%= loggedInUserName %></span>님 환영합니다.</p>

        </div>
        <% } %>
    </div>
    
    <!-- nav -->
    <nav id="header_menu">
        <div class="menu">
            <ul class="menu_list">
                <li><a href="/movielist">영화</a></li>
                <li><a href="/map">매장정보</a></li>
<<<<<<< HEAD
                <li><a href="/reservation/first">예매</a></li>
=======
                <li><a href="/reservation">예매</a></li>
>>>>>>> 03b06105d6f9e96da199e74b8d3458d69e5fafb9
                <li><a href="/foodstore/store">푸드스토어</a></li>
            </ul>
            
            <ul class="login_list" id="login_list">
                
                <li><a href="/member/login" id="login_link">로그인</a></li>
                <li><a href="/member/join">회원가입</a></li>
                <li><a href="/question/list">문의 하기</a></li>
                
            </ul>
        </div>
    </nav>
</header>
<script>
    var isLoggedIn = "<%= (loggedInUserName != null) ? "true" : "false" %>";
    var loggedUserName = "<%= loggedInUserName %>";
</script>
    <script src="../js/include/header.js"></script>