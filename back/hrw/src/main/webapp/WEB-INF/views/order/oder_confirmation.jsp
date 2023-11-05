<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>주문정보</title>
  <link rel="stylesheet" href="../css/common.css">
  <link rel="stylesheet" href="../css/oder_confirmation.css"/>
</head>
<body>
  <jsp:include page="../include/header.jsp"/>

  <main>
    <section id="oder_confirmation_wrap">
      <div id="oder_confirmation_title">
        <h1>2023.10.23 주문</h1>
         <dl>
          <dt> 주문번호</dt>
          <dd>aaa0120231025001</dd>
         </dl>
        </div>
      
      <article id="oder_movie_container"> 

        <div class="oder_container_title">
          <h2>영화 예매 정보</h2>
        </div>

        <div class="oder_movie_info_cell">

          <div class="oder_movie_poster">
            <img src="../images/poster_rank/20212667.jpg" alt="영화제목" >
          </div>

          <div class="oder_movie_info">
            <h3>영화 제목</h3>
            <h4>12세 연령가</h4>
            <h4>2D 디지털</h4>
          </div>

          <div class="oder_cinema_info">
            <table class="oder_movie_info_table">

              <tr>
                <th>극장</th>
                <td>인천부평역점</td>
              </tr>

              <tr>
                <th>상영일</th>
                <td>2023년10월10일 </td>
              </tr>

              <tr>
                <th>상영시간</th>
                <td>00:00~00:00</td>
              </tr>

            </table>
          </div>

          <div class="oder_theater_info">
            <table class="oder_movie_info_table">

              <tr>
                <th>상영관</th>
                <td>10관 6층</td>
              </tr>

              <tr>
                <th>인원</th>
                <td>일반석</td>
              </tr>

              <tr>
                <th>좌석번호</th>
                <td>b11, b11, b11, b11</td>
              </tr>

              
            </table>
          </div>

        </div>

        <div class="oder_movie_info_cell hidden">
          <div class="oder_movie_check">
            <button class="oder_movie_check_btn "><img src="../images/oder/check_white.png" class="oder_movie_check_img"></button>
          </div>

          <div class="oder_movie_poster">
            <img src="../images/poster_rank/20197122.jpg" alt="영화제목" >
          </div>

          <div class="oder_movie_info">
            <h3>영화 제목</h3>
            <h4>12세 연령가</h4>
            <h4>2D 디지털</h4>
          </div>

          <div class="oder_cinema_info">
            <table class="oder_movie_info_table">

              <tr>
                <th>극장</th>
                <td>인천부평역점</td>
              </tr>

              <tr>
                <th>일시</th>
                <td>2023년10월10일 00:00~00:00</td>
              </tr>

              <tr>
                <th>인원</th>
                <td>일반 2명</td>
              </tr>

            </table>
          </div>

          <div class="oder_theater_info">
            <table class="oder_movie_info_table">

              <tr>
                <th>상영관</th>
                <td>10관 6층</td>
              </tr>

              <tr>
                <th>좌석명</th>
                <td>일반석</td>
              </tr>

              <tr>
                <th>좌석번호</th>
                <td>b11, b11, b11, b11</td>
              </tr>

              
            </table>
          </div>

        </div>

        <div class="oder_movie_info_sum">
          <h3>합계</h3>
          <P>35,000 원</P>
        </div>


      </article>

      <div class="no_oder_result">
        <img src="../images/movie/no_data.png" alt="X"><h2> 주문정보 가 없습니다.</h2>
      </div>

      <article id="oder_food_container">
        <div class="oder_container_title">
          <h2>푸드 주문 정보</h2>
        </div>
        
        <!-- 주문한 음식별로 oder_food_container_cell생성-->

        <div id="oder_food_container_info">

          <div class="oder_food_container_cell">
            <div class="oder_food_container_cell_img">
              <img src="../images/store/product/double_popcorn.png" alt="더블콤보">
            </div>
            <div class="oder_food_info">
              <p>팝콘(M)2 + 탄산(M)2</p>
              <div class="oder_food_name">
                <h4>더블콤보</h4>
              </div>
              <div class="oder_food_basket">
                <div class="oder_food_quantity">
                  <span>0</span>
                </div>
                <div class="oder_food_price">
                  <span>13,000<em>원</em></span>
                </div>
              </div>
              <div class="oder_food_basket_check ">
                <div class="oder_food_quantity">
                  <button class="oder_food_minusbutton">
                    <img src="../images/store/minus.png" alt="minus">
                  </button>
                  <span>0</span>
                  <button class="oder_food_plusbutton">
                    <img src="../images/store/plus.png" alt="plus">
                  </button>
                </div>
                <div class="oder_food_price">
                  <span>10,000<em>원</em></span>
                </div>
              </div>
            </div>
          </div>


          <div class="oder_food_container_cell hidden">
            <div class="oder_food_container_cell_img">
              <img src="../images/store/product/coffee_ice.png" alt="팝콘_기본맛">
            </div>
            <div class="oder_food_info">
              <p>팝콘(M)2 + 탄산(M)2</p>
              <div class="oder_food_name">
                <h4>더블콤보</h4>
              </div>
              <div class="oder_food_basket">
                <div class="oder_food_quantity">
                  <span>0</span>
                </div>
                <div class="oder_food_price">
                  <span>13,000<em>원</em></span>
                </div>
              </div>
              <div class="oder_food_basket_check hidden">
                <div class="oder_food_quantity">
                  <button class="oder_food_minusbutton">
                    <img src="../images/store/minus.png" alt="minus">
                  </button>
                  <span>0</span>
                  <button class="oder_food_plusbutton">
                    <img src="../images/store/plus.png" alt="plus">
                  </button>
                </div>
                <div class="oder_food_price">
                  <span>10,000<em>원</em></span>
                </div>
              </div>
            </div>
          </div>
        </div>
          <div class="oder_food_price_sum">
            <h3>합계</h3>
            <P>35,000 원</P>
          </div>

        
        

        <div class="no_oder_result hidden">
          <img src="../images/movie/no_data.png" alt="X"><h2> 주문정보 가 없습니다.</h2>
        </div>

      </article>

      <article id="oder_paymen_container">
        <div class="oder_container_title">
          <h2>결제 정보</h2>
        </div>

          <div class="payment_info">
            <table>

              <tr>
                <th>결제수단</th>
                <td>카드</td> <!-- 카드, 무통장입금, 간편결제-->
              </tr>

              <tr>
                <th>카드사</th><!--  무통장입금시 은행, 간편결제시 결제사-->
                <td>현대</td>
              </tr>
            </table>
          </div>

        <div id="oder_price_content">
          <h3>총 결제금액</h3>
          <P>35,000 원</P>
        </div>
      </article>

      <!-- 주문직후면 결제 하기 버튼이 보여야하고, 결제후 나중에 주문확인건결제 하기 버튼이 없어야함-->
      <!--주문 직후-->
      <article class="oder_butten_container"> 
        <button id="oder_page_butten_submit">환불신청</button>
      </article>

      <div class="empty_place"></div>

    </section>
  </main>
  
<!-- 상단 이동 버튼 -->
<a class="topBtn" id="go_top" href="#">
  <img src="../images/top.png" alt="누르면 홈페이지 상단으로 이동합니다.">
</a>

<!-- 푸터 -->
<jsp:include page="../include/footer.jsp"/>


  <script src="../js/oder_confirmation.js"></script>
  <script src="../js/common.js"></script>
</body>
</html>