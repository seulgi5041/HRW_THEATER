<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <link rel="stylesheet" href="../css/include/header.css">
<header>
      <!-- 로고 -->
      <div id="main_header">
        <div class="logo">
          <a href="/"><img src="../images/logo.jpg" alt="메인 로고"></a>
        </div>
        <!-- 로그인 성공 시 나타나는 부분 -->
        <div class="login_user" id="login_user">
          <p><span id="userName">username</span>님 환영합니다.</p>
        </div>
      </div>
      
      <!-- nav -->
      <nav id="header_menu">
        <div class="menu">
          <ul class="menu_list">
            <li><a href="#">영화</a></li>
            <li><a href="#">매장정보</a></li>
            <li><a href="#">예매</a></li>
            <li><a href="/foodstore/store">푸드스토어</a></li>
          </ul>
          <ul class="login_list" id="login_list">
            <li><a href="/member/login" id="login_link">로그인</a></li>
            <li><a href="/member/join">회원가입</a></li>
          </ul>
        </div>
      </nav>
    </header>
    <!-- 로그인을 하면 보여지는 메뉴부분 -->
    <!-- 자바스크립트로 구현 -->