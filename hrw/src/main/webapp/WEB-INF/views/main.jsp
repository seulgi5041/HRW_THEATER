<%@page import="lombok.EqualsAndHashCode.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HRW</title>
  
    <!-- 슬라이드 CSS CDN-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>
  
    <!-- 기본 CSS -->
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/common.css">
  </head>
  <body>
   <jsp:include page="include/header.jsp"/>
  
    <!-- 메인영역 -->
   <main>
      <!--슬라이드-->
      <section id="movie_slide_wrap">
        <div class="swiper mySwiper">
            <div class="swiper-wrapper">
<!--각각의 영화정보 띄워주기-->
                <c:forEach items="${top10MovieList}" var="movie">
                    <div class="swiper-slide image-container">
                        <div class="image_box"> 
                            <img src="../images/poster_rank/${movie.code}.jpg" alt="${movie.code}" class="zoom_image">
                            <div class="overlay">
                                <button class="movie_detail" name="${movie.code}">상세보기</button>
                                <button class="movie_ticketing" name="${movie.code}">예매하기</button> 
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
            <!-- If we need navigation buttons -->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        </div>
    </section>
  
      <article id="movie_info_wrap">
        <div class="movie_reservation">
          <p>영화 예매율</p>
        </div>
  
        <!-- 영화 포스터, 정보 부분 -->
        <div class="movie_info">
          <div class="movie_poster_arer">
            <!-- 이미지 - 표에서 제목을 클릭하면 해당 영화 포스터로 변경 -->
            <img id="moviePoster" src="../images/poster_rank/20228819.jpg" alt="영화코드">
            <div class="overlay">
              <button class="movie_detail" name="영화코드" id="top10_list_movie_detail" >상세보기</button>
              <button class="movie_ticketing" name="영화코드" id="top10_list_movie_ticketing" >예매하기</button> 
            </div>
          </div>
          <!--영화정보 리스트있는부분-->
          <div class="movie_content_info">
            <div class="movie_title bdbtm">
              <strong name="title" class="ellip" id="movieNm">정보없음</strong>
              <span name="etitle" class="ellip" id="movieNmEn">정보없음</span>
            </div>
            <div name="movie_data">
              <!-- bdbtm - borderbottom / pd15 - padding15 -->
              <dl class="dbmovie_info bdbtm pd15">
                <dt class="strdt">개봉일</dt>
                <dd class="strdd" id="openDt_api">정보없음</dd>
                <dt class="strdt" >영화구분</dt>
                <dd class="strdd" id="typeNm_api">정보없음</dd>
                <dt class="strdt" >출연진</dt>
                <dd class="strdd" id="peopleNm_api">정보없음</dd>
              </dl>
              <dl class="dbmovie_info bdbtm pd15">
                <dt class="strdt" >관람등급</dt>
                <dd class="strdd" id="watchGradeNm_api">정보없음</dd>
                <dt class="strdt" >상영시간</dt>
                <dd class="strdd" id="showTm_api">정보없음</dd>  <!-- db에서 가져올 때 초 단위 제거-->
                <dt class="strdt">제작국가</dt>
                <dd class="strdd" id="nationNm_api">정보없음</dd>
              </dl>
              <dl class="dbmovie_info pd15">
                <dt class="strdt" >감독</dt>
                <dd class="strdd" id="peopleNmEn_api">정보없음</dd>
                <dt class="strdt" >장르</dt>
                <dd class="strdd" id="genreNm_api">정보없음</dd>
                <dt class="strdt" >배급사</dt>
                <dd class="strdd" id="companyNm_api">정보없음</dd>
              </dl>
            </div>
          </div>
  
          <!--실시간예매율별 영화표-->
          <div class="tbl_wrap">
            <table class="tbl">
              <colgroup>
                <col width="30px">
                <col width="160px">
                <col width="135px">
                <col width="100px">
                <col wodth>
              </colgroup>
              <thead>
                <tr>
                  <th scope="col"></th>
                  <th scope="col" class="rank">영화명</th>
                  <th scope="col">관객수</th>
                  <th scope="col">예매율</th>
                  <th scope="col">증감율</th>
                </tr>
              </thead>
              <tbody>

                <c:forEach items="${top10MovieList}" var="movie" varStatus="status">

                <tr>
                  <td class="rank" no="0"><c:out value="${status.index + 1}" /></td>
                  <td>
                    <span class="ellip" data-movie-code="${movie.code}" onclick="changePoster('${movie.code}')">${movie.title}</span>
                  </td>
                  <td style="cursor: default;">${movie.cumulativeNumberOfAudience} 명</td>
                  <td style="cursor: default;">${movie.advanceReservationRate}%</td>
                  <td style="cursor: default;">
                    <c:choose>
                      <c:when test="${movie.increaseDecreaseStatus==0}"> <!-- 0 : new / 1 : up / 2 : down / 3 : keep -->
                          <img src="../images/main/new.png" alt="new_rank">
                      </c:when>
                      <c:when test="${movie.increaseDecreaseStatus==1}"> <!-- 0 : new / 1 : up / 2 : down / 3 : keep -->
                          <img src="../images/main/arrow_up.png" alt="arrow_up">${movie.increaseDecreaseRate}
                      </c:when>
                      <c:when test="${movie.increaseDecreaseStatus==2}"> <!-- 0 : new / 1 : up / 2 : down / 3 : keep -->
                          <img src="../images/main/arrow_down.png" alt="arrow_down">${movie.increaseDecreaseRate}
                      </c:when>
                      <c:when test="${movie.increaseDecreaseStatus==3}"> <!-- 0 : new / 1 : up / 2 : down / 3 : keep -->
                          <span class="keep">keep</span>
                      </c:when>
                  </c:choose>
                  </td>
                </tr>
                </c:forEach>
              </tbody>
            </table>
            <span class="info_data"><c:out value="${top10MovieList[0].updateDate}" />기준</span>
          </div>


        </div>
  
        <div class="more_movie_info">
          <a href="/movielist">더 많은 영화 보기</a>
        </div>
      </article>
  
      <!-- 추천 검색 부분 -->
      <section id="movie_search_wrap">
        <div class="recommend_box">
          <p>뭘 봐야 할 지 고민이라면?</p>
        </div>
        <div class="movie_recommend_search">
          <input type="text" id="searchInput" placeholder="#장진#크라임씬#조승우#2007">
          <a href="javascript:void(0)" class="recommend_btn" id="searchButton"><img src="../images/main/search.png" alt="검색버튼"></a>
        </div>
        <div class="recommend_tag">
          <p>#를 붙여 감독, 배우, 제목 등 원하는 키워드로 검색하세요.</p>
        </div>
      </section>
    </main>
  
  
    <jsp:include page="include/footer.jsp"/>
  
  
  
    <!-- 슬라이드 js CDN -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
  
     <script src="../js/swiper.js"></script>
    <script src="../js/main.js"></script>

  </body>

</html>