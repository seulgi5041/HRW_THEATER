<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지를 찾을수없습니다.</title>
    <link rel="stylesheet" href="../css/error.css">
</head>
<body>

    <jsp:include page="./include/header.jsp" />
    
    <main>
        <div id="error_container">
          <div id="error_img">
            <img src="../images/movie/no_data.png">
          </div>
          <div class="error_coment" >
            <h4> 페이지를 찾을 수 없습니다.</h4>
            <p> 1 분뒤 메인페이지로 돌아갑니다. </p>
          </div>
        </div>
        <div id="error_detail">
            <button id="movielist_show_next_button">
                에러메세지 보기
              </button> 
            <div class="error_messege hidden">
                <dl>
                    <dt>에러 클래스 이름</dt>
                    <dd>${exception}</dd>

                    <dt>에러 메시지</dt>
                    <dd>${message}</dd>

                    <dt>에러 스택 트레이스</dt>
                    <dd>${trace}</dd>
                </dl>
            </div>
        </div>

      </main>
    
      <jsp:include page="./include/footer.jsp" />

    <script>
        /*setTimeout(function() {
          window.location.href = "/";
        }, 60*60); // 1분(60,000 밀리초) 후에 페이지 이동*/

        const movielist_show_next_button = document.getElementById('movielist_show_next_button');
            movielist_show_next_button.addEventListener("click", function () {
                const error_messege = document.querySelectorAll('.error_messege');
                error_messege.forEach(div => {
                    if (div.classList.contains('hidden')) {
                        // 이미 hidden 클래스가 적용되어 있다면 hidden 클래스를 제거
                        div.classList.remove('hidden');
                    } else {
                        // hidden 클래스가 없다면 hidden 클래스를 추가
                        div.classList.add('hidden');
                    }
                });
            });
      </script>
</body>
</html>
