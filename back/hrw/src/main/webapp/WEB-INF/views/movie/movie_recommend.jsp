<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화추천</title>
<link rel="stylesheet" href="../css/movie/movie_recommend.css">
<link rel="stylesheet" href="../css/common.css">
</head>
<body>
  <script>
     var nowMovieList = [
     <c:forEach items="${searchNowMovieList}" var="nowMovieList" varStatus="loop">
      '${nowMovieList.code}'<c:if test="${!loop.last}">, </c:if>
    </c:forEach>
   ];

   var reoMovieList = [
   <c:forEach items="${searchPrevMovieList}" var="preMovieList" varStatus="loop">
      '${preMovieList.code}'<c:if test="${!loop.last}">, </c:if>
    </c:forEach>
   ];

  </script>


    <jsp:include page="../include/header.jsp" />
    
  <!-- 추천예매 페이지 메인 -->
  <main id="sectiion_wrap">
    
    <section id="movie_search_wrap">
      <div class="movie_recommend_box">
        <p>검색 결과가 마음에 들지 않는다면?</p>
      </div>
      <div class="movie_recommend_search">
        <input type="text" id="movie_recommend_searchInput" placeholder="#장진#크라임씬#조승우#2007">
        <a href="javascript:void(0)" class="recommend_search_btn" id="movie_recommend_searchButton"><img src="../images/main/search.png" alt="검색버튼"></a>
      </div>
      <div class="recommend_tag">
        <p>#를 붙여 감독, 배우, 제목 등 원하는 키워드로 검색하세요.</p>
      </div>
    </section>


    <div class="movie_showing_title">
      <h4>현재 상영작 추천</h4>
      <div class="block_color"></div>
    </div>

    <section id="now_theaters_showing" class="now_theaters_wrap">

      <c:forEach items="${searchNowMovieList}" var="nowMovie">

        <div class="now_theaters_movie_poster_arer">
            <img src="../images/poster_rank/${nowMovie.code}.jpg" alt="${movie.code}">
            <div class="overlay">
                <button class="show_movie_detail" name="${nowMovie.code}">상세보기</button>
                <button class="now_theaters_movie_ticketing" name="${nowMovie.code}" data-orderAble="${nowMovie.productionCondition}">예매하기</button> 
            </div>
        </div>
        
    </c:forEach>


    <div class="no_search_result" id="now_theater_no_search">
      <img src="../images/no_data.png" alt="X"><h2> 조회된정보가 없습니다.</h2>
    </div>


      
    </section>

 
      <div class="recommend_prev_title">
        <h4>지난 영화 추천</h4>
        <div class="block_color"></div>
      </div>
   <section id="recommend_movie" class="recommend_prev_movie">

    
        <div class="recommend_prev_movie_poster" id="prev_movie_poster_data">
          <img id="moviePoster" src="../images/poster_rank/20228819.jpg" alt="20228819">
          <div class="overlay">
            <button class="show_movie_detail" id="show_old_movie_detail" name="영화코드">상세보기</button>
          </div>
        </div>

        <div class="recommend_prev_movie_table_box" id="recommend_prev_movie_info">

          <div class="recommend_prev_movie_title bdbtm">
            <strong name="title" class="ellip" id="movieNm">정보없음</strong>
            <span name="etitle" class="ellip" id="movieNmEn">정보없음</span>
          </div>

          <div name="recommend_prev_movie_data">
            <!-- bdbtm - borderbottom / pd15 - padding15 -->
            <dl class="dbmovie_info bdbtm pd15">
              <dt class="strdt">개봉일</dt>
              <dd class="strdd" id="openDt_api">정보없음</dd>
              <dt class="strdt">영화구분</dt>
              <dd class="strdd" id="typeNm_api">정보없음</dd>
              <dt class="strdt">출연진</dt>
              <dd class="strdd" id="peopleNm_api">정보없음</dd>
            </dl>
            <dl class="dbmovie_info bdbtm pd15">
              <dt class="strdt">관람등급</dt>
              <dd class="strdd" id="watchGradeNm_api">정보없음</dd>
              <dt class="strdt">상영시간</dt>
              <dd class="strdd" id="showTm_api">정보없음</dd> <!-- db에서 가져올 때 초 단위 제거-->
              <dt class="strdt">제작국가</dt>
              <dd class="strdd" id="nationNm_api">정보없음</dd>
            </dl>
            <dl class="dbmovie_info pd15">
              <dt class="strdt">감독</dt>
              <dd class="strdd" id="peopleNmEn_api">정보없음</dd>
              <dt class="strdt">장르</dt>
              <dd class="strdd" id="genreNm_api">정보없음</dd>
              <dt class="strdt">배급사</dt>
              <dd class="strdd" id="companyNm_api">정보없음</dd>
            </dl>
          </div>

        </div>

        <div class="tbl_wrap" id="recommend_prev_movie_table">
          <table class="tbl">
            <colgroup>
              <col width="30px">
              <col width="160px">
            </colgroup>
            <thead>
              <tr>
                <th scope="col"></th>
                <th scope="col" class="rank">영화명</th>
                <th scope="col">일치률</th>
              </tr>
            </thead>
            <tbody>

              <c:forEach items="${searchPrevMovieList}" var="prevMovieList" varStatus="status">

              <tr>
                <td class="rank" no="0"><c:out value="${status.index + 1}" /></td>
                <td>
                  <span class="ellip" data-movie-code="${prevMovieList.code}" onclick="changePoster('${prevMovieList.code}')">${prevMovieList.title}</span>
                </td>
                <td style="cursor: default;">${prevMovieList.matchRate} %</td>
              </tr>
              </c:forEach>

            </tbody>
          </table>
        </div>


    </section>

    <div class="no_search_result" id="reco_theater_no_search">
      <img src="../images/no_data.png" alt="X"><h2> 조회된정보가 없습니다.</h2>
    </div>

  </main>
    
  <jsp:include page="../include/footer.jsp" />



  <script src="../js/movie_recommend.js"></script>
  <script src="../js/common.js"></script>
</body>
</html>