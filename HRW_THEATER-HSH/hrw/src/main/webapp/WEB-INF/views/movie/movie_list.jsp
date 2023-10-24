<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HRW 영화 목록</title>

<link rel="stylesheet" href="../css/movie/movie_list.css" />
</head>
<body>

<jsp:include page="../include/header.jsp" />
    
 <main>
    <div id="movielist_title">
      <h1>영화 순위</h1>
    </div>

    <section id="movielist_postor_content">
        <c:forEach items="${allMovie}" var="movie" varStatus="status">
          <c:choose>
            <c:when test="${status.index % 5 == 0 && status.index / 5 < 2}">
              <article class="movielist_movieposter_row">
            </c:when>
            <c:when test="${status.index % 5 == 0 && status.index / 5 >= 2}">
              <article class="movielist_movieposter_row hidden">
            </c:when>
            <c:otherwise></c:otherwise>
          </c:choose>
          <div class="movielist_movieposter_cell">

            <c:url value="/movieinfo" var="movieInfoUrl">
              <c:param name="code" value="${movie.code}" /> <!--파라미터에 코드추가-->
          </c:url>

            <a class="movielist_movieposter_cell" href="${movieInfoUrl}"> <!--포스터쪽 div클릭시 영화 상세정보로 이동-->
                <img src="../images/poster_rank/${movie.code}.jpg" alt="${movie.title}">
                <div class="movielist_movieposter_overlay">
                  <p>${movie.synopsis}</p>
                </div>
              </a> 
            <p>${movie.title}</p>
            <div class="ticketing_btn">
              <a href="#" class="movie_ticketing">예매하기</a>
            </div>
          </div>
          <c:if test="${status.index % 5 == 4}">
          </article>
            </c:if>
        </c:forEach>
      </section>

      <button id="movielist_show_next_button">
        더보기
      </button> 

    
  
  </main>
    
  <jsp:include page="../include/footer.jsp" />
    <script src="../js/movie_list.js"></script>
</body>
</html>