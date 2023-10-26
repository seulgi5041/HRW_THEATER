<%@page import="lombok.EqualsAndHashCode.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
      <section id="movie_slide_wrap">
        <!-- Slider main container -->
        <div class="swiper mySwiper">
          <!-- Additional required wrapper -->
          <div class="swiper-wrapper">
            <!-- Slides -->
            <div class="swiper-slide image-container">
              <div class="image_box"> 
                <img src="../images/poster_rank/20228819.jpg" alt="20228819" class="zoom_image">
                <div class="overlay">
                  <button class="movie_detail">상세보기</button>
                  <button class="movie_ticketing">예매하기</button> 
                </div>
              </div>
            </div>
            <div class="swiper-slide image-container">
              <div class="image_box"> 
                <img src="../images/poster_rank/20212667.jpg" alt="20212667" class="zoom_image">
                <div class="overlay">
                  <button class="movie_detail">상세보기</button>
                  <button class="movie_ticketing">예매하기</button> 
                </div>
            </div>
              </div>
            <div class="swiper-slide image-container">
              <div class="image_box"> 
                <img src="../images/poster_rank/20227626.jpg" alt="20227626" class="zoom_image">
                <div class="overlay">
                  <button class="movie_detail">상세보기</button>
                  <button class="movie_ticketing">예매하기</button> 
                </div>
              </div>
            </div>
            <div class="swiper-slide image-container">
              <div class="image_box"> 
                <img src="../images/poster_rank/20227410.jpg" alt="20227410" class="zoom_image">
                <div class="overlay">
                  <button class="movie_detail">상세보기</button>
                  <button class="movie_ticketing">예매하기</button> 
                </div>
              </div>
            </div>
            <div class="swiper-slide image-container">
              <div class="image_box"> 
                <img src="../images/poster_rank/20234663.jpg" alt="20234663" class="zoom_image">
                <div class="overlay">
                  <button class="movie_detail">상세보기</button>
                  <button class="movie_ticketing">예매하기</button> 
                </div>
              </div>
            </div>
            <div class="swiper-slide image-container">
              <div class="image_box"> 
                <img src="../images/poster_rank/20197122.jpg" alt="20197122" class="zoom_image">
                <div class="overlay">
                  <button class="movie_detail">상세보기</button>
                  <button class="movie_ticketing">예매하기</button> 
                </div>
              </div>
            </div>
            <div class="swiper-slide image-container">
              <div class="image_box"> 
                <img src="../images/poster_rank/20234277.jpg" alt="20234277" class="zoom_image">
                <div class="overlay">
                  <button class="movie_detail">상세보기</button>
                  <button class="movie_ticketing">예매하기</button> 
                </div>
              </div>
            </div>
            <div class="swiper-slide image-container">
              <div class="image_box"> 
                <img src="../images/poster_rank/20226798.jpg" alt="20226798" class="zoom_image">
                <div class="overlay">
                  <button class="movie_detail">상세보기</button>
                  <button class="movie_ticketing">예매하기</button> 
                </div>
              </div>
            </div>
            <div class="swiper-slide image-container">
              <div class="image_box"> 
                <img src="../images/poster_rank/20233743.jpg" alt="20233743" class="zoom_image">
                <div class="overlay">
                  <button class="movie_detail">상세보기</button>
                  <button class="movie_ticketing">예매하기</button> 
                </div>
              </div>
            </div>
            <div class="swiper-slide image-container">
              <div class="image_box"> 
                <img src="../images/poster_rank/20234155.jpg" alt="20234155" class="zoom_image">
                <div class="overlay">
                  <button class="movie_detail">상세보기</button>
                  <button class="movie_ticketing">예매하기</button> 
                </div>
              </div>
            </div>
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
            <img id="moviePoster" src="../images/poster_rank/20228819.jpg" alt="20228819">
            <div class="overlay">
              <button class="movie_detail">상세보기</button>
              <button class="movie_ticketing">예매하기</button> 
            </div>
          </div>
          <div class="movie_content_info">
            <div class="movie_title bdbtm">
              <strong name="title" class="ellip">30일</strong>
              <span name="etitle" class="ellip">Love Reset</span>
            </div>
            <div name="movie_data">
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
                <tr>
                  <td class="rank" no="0">1</td>
                  <td>
                    <span class="ellip" onclick="changePoster('30일')">30일</span>
                  </td>
                  <td style="cursor: default;">154,410명</td>
                  <td style="cursor: default;">17.8%</td>
                  <td style="cursor: default;">
                    <img src="../images/main/arrow_up.png" alt="arrow_up">1
                  </td>  
                </tr>
                <tr>
                  <td class="rank" no="0">2</td>
                  <td>
                    <span class="ellip" onclick="changePoster('1947 보스톤')">1947 보스톤</span>
                  </td>
                  <td style="cursor: default;">154,410명</td>
                  <td style="cursor: default;">17.8%</td>
                  <td style="cursor: default;">
                    <img src="../images/main/arrow_up.png" alt="arrow_up">2
                  </td>   
                </tr>
                <tr>
                  <td class="rank" no="0">3</td>
                  <td>
                    <span class="ellip" onclick="changePoster('천박사 퇴마 연구소: 설경의 비밀')">천박사 퇴마 연구소: 설경의 비밀</span>
                  </td>
                  <td style="cursor: default;">154,410명</td>
                  <td style="cursor: default;">17.8%</td>
                  <td style="cursor: default;">
                    <img src="../images/main/arrow_down.png" alt="arrow_down">1
                  </td> 
                </tr>
                <tr>
                  <td class="rank" no="0">4</td>
                  <td>
                    <span class="ellip" onclick="changePoster('title')">title</span>
                  </td>
                  <td style="cursor: default;">154,410명</td>
                  <td style="cursor: default;">17.8%</td>
                  <td style="cursor: default;">
                    <img src="../images/main/new.png" alt="new_rank">
                  </td>   
                </tr>
                <tr>
                  <td class="rank" no="0">5</td>
                  <td>
                    <span class="ellip" onclick="changePoster('title')">title</span>
                  </td>
                  <td style="cursor: default;">154,410명</td>
                  <td style="cursor: default;">17.8%</td>
                  <td style="cursor: default;"><span class="keep">keep</span></td>  
                </tr>
                <tr>
                  <td class="rank" no="0">6</td>
                  <td>
                    <span class="ellip" onclick="changePoster('title')">title</span>
                  </td>
                  <td style="cursor: default;">154,410명</td>
                  <td style="cursor: default;">17.8%</td>
                  <td style="cursor: default;"><span class="keep">keep</span></td>  
                </tr>
                <tr>
                  <td class="rank" no="0">7</td>
                  <td>
                    <span class="ellip" onclick="changePoster('title')">title</span>
                  </td>
                  <td style="cursor: default;">154,410명</td>
                  <td style="cursor: default;">17.8%</td>
                  <td style="cursor: default;"><span class="keep">keep</span></td>  
                </tr>
                <tr>
                  <td class="rank" no="0">8</td>
                  <td>
                    <span class="ellip" onclick="changePoster('title')">title</span>
                  </td>
                  <td style="cursor: default;">154,410명</td>
                  <td style="cursor: default;">17.8%</td>
                  <td style="cursor: default;"><span class="keep">keep</span></td>  
                </tr>
                <tr>
                  <td class="rank" no="0">9</td>
                  <td>
                    <span class="ellip" onclick="changePoster('title')">title</span>
                  </td>
                  <td style="cursor: default;">154,410명</td>
                  <td style="cursor: default;">17.8%</td>
                  <td style="cursor: default;"><span class="keep">keep</span></td>  
                </tr>
                <tr>
                  <td class="rank" no="0">10</td>
                  <td>
                    <span class="ellip" onclick="changePoster('title')">title</span>
                  </td>
                  <td style="cursor: default;">154,410명</td>
                  <td style="cursor: default;">17.8%</td>
                  <td style="cursor: default;"><span class="keep">keep</span></td>  
                </tr> 
              </tbody>
            </table>
            <span class="info_data">2023년 10월 15일(일)기준</span>
          </div>
        </div>
  
        <div class="more_movie_info">
          <a href="#">더 많은 영화 보기</a>
        </div>
      </article>
  
      <!-- 추천 검색 부분 -->
      <section id="movie_search_wrap">
        <div class="recommend_box">
          <p>뭘 봐야 할 지 고민이라면?</p>
        </div>
        <div class="movie_recommend_search">
          <input type="text" id="searchInput" placeholder="#장진#크라임씬#조승우#2007">
          <a href="#" class="recommend_btn" id="searchButton"><img src="../images/main/search.png" alt="검색버튼"></a>
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
    <script src="../js/common.js"></script>
  </body>
</html>