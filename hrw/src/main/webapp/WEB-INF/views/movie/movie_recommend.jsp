<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 조회 결과</title>
<link rel="stylesheet" href="../css/movie/movie_recommend.css">
<link rel="stylesheet" href="../css/common.css">
</head>
<body>

    <jsp:include page="../include/header.jsp" />
    
  <!-- 추천예매 페이지 메인 -->
  <main id="sectiion_wrap">
    
    <section id="movie_search_wrap">
      <div class="movie_recommend_box">
        <p>검색 결과가 마음에 들지 않는다면?</p>
      </div>
      <div class="movie_recommend_search">
        <input type="text" id="movie_recommend_searchInput" placeholder="#장진#크라임씬#조승우#2007">
        <a href="#" class="recommend_search_btn" id="movie_recommend_searchButton"><img src="../images/main/search.png" alt="검색버튼"></a>
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
      
      <div class="now_theaters_movie_poster_arer">
        <img class="now_theaters_moviePoster" src="../images/poster_rank/20197122.jpg" alt="20197122">
        <div class="overlay">
          <button class="show_movie_detail">상세보기</button>
          <button class="now_theaters_movie_ticketing">예매하기</button> 
        </div>
      </div>

      <div class="now_theaters_movie_poster_arer">
        <img class="now_theaters_moviePoster" src="../images/poster_rank/20197122.jpg" alt="20197122">
        <div class="overlay">
          <button class="show_movie_detail">상세보기</button>
          <button class="now_theaters_movie_ticketing">예매하기</button> 
        </div>
      </div>

      <div class="now_theaters_movie_poster_arer">
        <img class="now_theaters_moviePoster" src="../images/poster_rank/20197122.jpg" alt="20197122">
        <div class="overlay">
          <button class="show_movie_detail">상세보기</button>
          <button class="now_theaters_movie_ticketing">예매하기</button> 
        </div>
      </div>

      <div class="now_theaters_movie_poster_arer .hidden">
        <h1>조회된 정보가 없습니다.</h1>
      </div>


      
    </section>

 
      <div class="recommend_prev_title">
        <h4>지난 영화 추천</h4>
        <div class="block_color"></div>
      </div>
   <section id="recommend_movie" class="recommend_prev_movie">

        <div class="recommend_prev_movie_poster">
          <img id="moviePoster" src="../images/poster_rank/20228819.jpg" alt="20228819">
          <div class="overlay">
            <button class="show_movie_detail">상세보기</button>
          </div>
        </div>

        <div class="recommend_prev_movie_table_box">

          <div class="recommend_prev_movie_title bdbtm">
            <strong name="title" class="ellip">30일</strong>
            <span name="etitle" class="ellip">Love Reset</span>
          </div>

          <div name="recommend_prev_movie_data">
            <!-- bdbtm - borderbottom / pd15 - padding15 -->
            <dl class="dbmovie_info bdbtm pd15">
              <dt class="strdt">개봉일</dt>
              <dd class="strdd">2023-10-03</dd>
              <dt class="strdt">영화구분</dt>
              <dd class="strdd">일반영화</dd>
              <dt class="strdt">출연진</dt>
              <dd class="strdd">강하늘, 정소민, 조민수, 김선영</dd>
            </dl>
            <dl class="dbmovie_info bdbtm pd15">
              <dt class="strdt">관람등급</dt>
              <dd class="strdd">12세이상관람가</dd>
              <dt class="strdt">상영시간</dt>
              <dd class="strdd">119분</dd>  <!-- db에서 가져올 때 초 단위 제거-->
              <dt class="strdt">제작국가</dt>
              <dd class="strdd">한국</dd>
            </dl>
            <dl class="dbmovie_info pd15">
              <dt class="strdt">감독</dt>
              <dd class="strdd">남대중</dd>
              <dt class="strdt">장르</dt>
              <dd class="strdd">코미디</dd>
              <dt class="strdt">배급사</dt>
              <dd class="strdd">(주)마인드마크</dd>
            </dl>
          </div>

        </div>

        <div class="tbl_wrap">
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
              <tr>
                <td class="rank" no="0">1</td>
                <td>
                  <span class="ellip" onclick="changePoster('30일')">30일</span>
                </td>
                <td style="cursor: default;"># 장진 <br># 크라임씬 </td>
              </tr>
              <tr>
                <td class="rank" no="0">2</td>
                <td>
                  <span class="ellip" onclick="changePoster('1947 보스톤')">1947 보스톤</span>
                </td>
                <td style="cursor: default;"> # 장진 <br># 크라임씬</td> 
              </tr>
              <tr>
                <td class="rank" no="0">3</td>
                <td>
                  <span class="ellip" onclick="changePoster('천박사 퇴마 연구소: 설경의 비밀')">천박사 퇴마 연구소: 설경의 비밀</span>
                </td>
                <td style="cursor: default;"> # 장진 <br># 크라임씬</td> 
              </tr>
              <tr>
                <td class="rank" no="0">4</td>
                <td>
                  <span class="ellip" onclick="changePoster('title')">title</span>
                </td>
                <td style="cursor: default;"># 장진 <br># 크라임씬</td>  
              </tr>
              <tr>
                <td class="rank" no="0">5</td>
                <td>
                  <span class="ellip" onclick="changePoster('title')">title</span>
                </td>
                <td style="cursor: default;"># 장진 </td>
              </tr>
              <tr>
                <td class="rank" no="0">6</td>
                <td>
                  <span class="ellip" onclick="changePoster('title')">title</span>
                </td>
                <td style="cursor: default;"># 장진</td>
              </tr>
              <tr>
                <td class="rank" no="0">7</td>
                <td>
                  <span class="ellip" onclick="changePoster('title')">title</span>
                </td>
                <td style="cursor: default;"># 장진</td>
              </tr>
              <tr>
                <td class="rank" no="0">8</td>
                <td>
                  <span class="ellip" onclick="changePoster('title')">title</span>
                </td>
                <td style="cursor: default;"># 장진</td>
              </tr>
              <tr>
                <td class="rank" no="0">9</td>
                <td>
                  <span class="ellip" onclick="changePoster('title')">title</span>
                </td>
                <td style="cursor: default;"># 장진</td>

              </tr>
              <tr>
                <td class="rank" no="0">10</td>
                <td>
                  <span class="ellip" onclick="changePoster('title')">title</span>
                </td>
                <td style="cursor: default;"># 장진</td>
              </tr> 
            </tbody>
          </table>
        </div>


    </section>

  </main>
    
  <jsp:include page="../include/footer.jsp" />

  <script src="../js/movie_recommend.js"></script>
  <script src="../js/common.js"></script>
</body>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 조회 결과</title>
<link rel="stylesheet" href="../css/movie/movie_recommend.css">
<link rel="stylesheet" href="../css/common.css">
</head>
<body>

    <jsp:include page="../include/header.jsp" />
    
  <!-- 추천예매 페이지 메인 -->
  <main id="sectiion_wrap">
    
    <section id="movie_search_wrap">
      <div class="movie_recommend_box">
        <p>검색 결과가 마음에 들지 않는다면?</p>
      </div>
      <div class="movie_recommend_search">
        <input type="text" id="movie_recommend_searchInput" placeholder="#장진#크라임씬#조승우#2007">
        <a href="#" class="recommend_search_btn" id="movie_recommend_searchButton"><img src="../images/main/search.png" alt="검색버튼"></a>
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
      
      <div class="now_theaters_movie_poster_arer">
        <img class="now_theaters_moviePoster" src="../images/poster_rank/20197122.jpg" alt="20197122">
        <div class="overlay">
          <button class="show_movie_detail">상세보기</button>
          <button class="now_theaters_movie_ticketing">예매하기</button> 
        </div>
      </div>

      <div class="now_theaters_movie_poster_arer">
        <img class="now_theaters_moviePoster" src="../images/poster_rank/20197122.jpg" alt="20197122">
        <div class="overlay">
          <button class="show_movie_detail">상세보기</button>
          <button class="now_theaters_movie_ticketing">예매하기</button> 
        </div>
      </div>

      <div class="now_theaters_movie_poster_arer">
        <img class="now_theaters_moviePoster" src="../images/poster_rank/20197122.jpg" alt="20197122">
        <div class="overlay">
          <button class="show_movie_detail">상세보기</button>
          <button class="now_theaters_movie_ticketing">예매하기</button> 
        </div>
      </div>

      <div class="now_theaters_movie_poster_arer .hidden">
        <h1>조회된 정보가 없습니다.</h1>
      </div>


      
    </section>

 
      <div class="recommend_prev_title">
        <h4>지난 영화 추천</h4>
        <div class="block_color"></div>
      </div>
   <section id="recommend_movie" class="recommend_prev_movie">

        <div class="recommend_prev_movie_poster">
          <img id="moviePoster" src="../images/poster_rank/20228819.jpg" alt="20228819">
          <div class="overlay">
            <button class="show_movie_detail">상세보기</button>
          </div>
        </div>

        <div class="recommend_prev_movie_table_box">

          <div class="recommend_prev_movie_title bdbtm">
            <strong name="title" class="ellip">30일</strong>
            <span name="etitle" class="ellip">Love Reset</span>
          </div>

          <div name="recommend_prev_movie_data">
            <!-- bdbtm - borderbottom / pd15 - padding15 -->
            <dl class="dbmovie_info bdbtm pd15">
              <dt class="strdt">개봉일</dt>
              <dd class="strdd">2023-10-03</dd>
              <dt class="strdt">영화구분</dt>
              <dd class="strdd">일반영화</dd>
              <dt class="strdt">출연진</dt>
              <dd class="strdd">강하늘, 정소민, 조민수, 김선영</dd>
            </dl>
            <dl class="dbmovie_info bdbtm pd15">
              <dt class="strdt">관람등급</dt>
              <dd class="strdd">12세이상관람가</dd>
              <dt class="strdt">상영시간</dt>
              <dd class="strdd">119분</dd>  <!-- db에서 가져올 때 초 단위 제거-->
              <dt class="strdt">제작국가</dt>
              <dd class="strdd">한국</dd>
            </dl>
            <dl class="dbmovie_info pd15">
              <dt class="strdt">감독</dt>
              <dd class="strdd">남대중</dd>
              <dt class="strdt">장르</dt>
              <dd class="strdd">코미디</dd>
              <dt class="strdt">배급사</dt>
              <dd class="strdd">(주)마인드마크</dd>
            </dl>
          </div>

        </div>

        <div class="tbl_wrap">
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
              <tr>
                <td class="rank" no="0">1</td>
                <td>
                  <span class="ellip" onclick="changePoster('30일')">30일</span>
                </td>
                <td style="cursor: default;"># 장진 <br># 크라임씬 </td>
              </tr>
              <tr>
                <td class="rank" no="0">2</td>
                <td>
                  <span class="ellip" onclick="changePoster('1947 보스톤')">1947 보스톤</span>
                </td>
                <td style="cursor: default;"> # 장진 <br># 크라임씬</td> 
              </tr>
              <tr>
                <td class="rank" no="0">3</td>
                <td>
                  <span class="ellip" onclick="changePoster('천박사 퇴마 연구소: 설경의 비밀')">천박사 퇴마 연구소: 설경의 비밀</span>
                </td>
                <td style="cursor: default;"> # 장진 <br># 크라임씬</td> 
              </tr>
              <tr>
                <td class="rank" no="0">4</td>
                <td>
                  <span class="ellip" onclick="changePoster('title')">title</span>
                </td>
                <td style="cursor: default;"># 장진 <br># 크라임씬</td>  
              </tr>
              <tr>
                <td class="rank" no="0">5</td>
                <td>
                  <span class="ellip" onclick="changePoster('title')">title</span>
                </td>
                <td style="cursor: default;"># 장진 </td>
              </tr>
              <tr>
                <td class="rank" no="0">6</td>
                <td>
                  <span class="ellip" onclick="changePoster('title')">title</span>
                </td>
                <td style="cursor: default;"># 장진</td>
              </tr>
              <tr>
                <td class="rank" no="0">7</td>
                <td>
                  <span class="ellip" onclick="changePoster('title')">title</span>
                </td>
                <td style="cursor: default;"># 장진</td>
              </tr>
              <tr>
                <td class="rank" no="0">8</td>
                <td>
                  <span class="ellip" onclick="changePoster('title')">title</span>
                </td>
                <td style="cursor: default;"># 장진</td>
              </tr>
              <tr>
                <td class="rank" no="0">9</td>
                <td>
                  <span class="ellip" onclick="changePoster('title')">title</span>
                </td>
                <td style="cursor: default;"># 장진</td>

              </tr>
              <tr>
                <td class="rank" no="0">10</td>
                <td>
                  <span class="ellip" onclick="changePoster('title')">title</span>
                </td>
                <td style="cursor: default;"># 장진</td>
              </tr> 
            </tbody>
          </table>
        </div>


    </section>

  </main>
    
  <jsp:include page="../include/footer.jsp" />

  <script src="../js/movie_recommend.js"></script>
  <script src="../js/common.js"></script>
</body>
>>>>>>> main
</html>