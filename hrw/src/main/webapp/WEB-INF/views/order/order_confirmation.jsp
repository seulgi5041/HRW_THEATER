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
        <h1>${orderInfo.orderDate} 주문</h1>
         <dl>
          <dt> 주문번호</dt>
          <dd>${orderInfo.orderCode}</dd>
         </dl>
        </div>
      
      <article id="oder_movie_container"> 

        <div class="oder_container_title">
          <h2>영화 예매 정보</h2>
        </div>

        <div class="oder_movie_info_cell">

          <div class="oder_movie_check">
            <button class="oder_movie_check_btn "><img src="../images/oder/check_white.png" class="oder_movie_check_img"></button>
          </div>

          <div class="oder_movie_poster">
            <img src="../images/poster_rank/${orderInfo.movieCode}.jpg" alt="${orderInfo.movieCode}" >
          </div>

          <div class="oder_movie_info">
            <h3>${orderInfo.movieTitle}</h3>
            <h4>
              <c:choose>
                <c:when test="${orderInfo.movieRating eq 'gr_all'}">
                    모든 연령 관람가
                </c:when>
                <c:when test="${orderInfo.movieRating eq 'gr_12'}">
                    12세 관람가
                </c:when>
                <c:when test="${orderInfo.movieRating eq 'gr_15'}">
                    15세 관람가
                </c:when>
                <c:when test="${orderInfo.movieRating eq 'gr_18'}">
                    18세 관람가
                </c:when>
              </c:choose>
          </h4>
            <h4>${orderInfo.screenType}</h4>
          </div>

          <div class="oder_cinema_info">
            <table class="oder_movie_info_table">

              <tr>
                <th>극장</th>
                <td>${orderInfo.cinemaName}</td>
              </tr>

              <tr>
                <th>상영일</th>
                <td>${orderInfo.takeDate}</td>
              </tr>

              <tr>
                <th>상영시간</th>
                <td>${orderInfo.startTime} ~ ${orderInfo.endTime}</td>
              </tr>

            </table>
          </div>

          <div class="oder_theater_info">
            <table class="oder_movie_info_table">

              <tr>
                <th>상영관</th>
                <td>${orderInfo.auditorium}</td>
              </tr>

              <tr>
                <th>인원</th>
                <td>
                  성인 : ${orderInfo.adultCount} |
                   청소년 : ${orderInfo.teenagerCount} |
                   장애인 : ${orderInfo.disabledCount}
                  </td>
              </tr>

              <tr>
                <th>좌석번호</th>
                <td>
                  <c:forEach items="${seatList}" var="seat" varStatus="loop">
                  '${seat.seatName}'<c:if test="${!loop.last}">, </c:if>
                </c:forEach>
              </td>
              </tr>

              
            </table>
          </div>

        </div>

       

        <div class="oder_movie_info_sum" id="oder_movie_info_sum_id">
          <h3>합계</h3>
          <P>${orderInfo.moviePrice} 원</P>
        </div>


      </article>

      <div class="no_oder_result" id="movie_no_order">
        <img src="../images/movie/no_data.png" alt="X"><h2> 주문정보 가 없습니다.</h2>
      </div>

      <article id="oder_food_container">
        <div class="oder_container_title">
          <h2>푸드 주문 정보</h2>
        </div>
        
        <!-- 주문한 음식별로 oder_food_container_cell생성-->

        <div id="oder_food_container_info">



        </div>
          <div id="oder_food_price_sum" >
            <h3>합계</h3>
            <P>00원</P>
          </div>

        
        

        <div class="no_oder_result" id="food_no_order">
          <img src="../images/movie/no_data.png" alt="X"><h2> 주문정보 가 없습니다.</h2>
        </div>

      </article>

      <article id="oder_paymen_container">
        <div class="oder_container_title">
          <h2>결제 정보</h2>
        </div>

          <div class="payment_info">
            <table>
              <c:choose>
                <c:when test="${orderInfo.payMethod eq '카드'}">
                  <tr>
                    <th>결제수단</th>
                    <td>${orderInfo.payMethod}</td> <!-- 카드, 무통장입금, 간편결제-->
                  </tr>
    
                  <tr>
                    <th>카드사</th><!--  무통장입금시 은행, 간편결제시 결제사-->
                    <td>${orderInfo.payCompany}</td>
                  </tr>
                </c:when>
                <c:when test="${orderInfo.payMethod eq '간편결제'}">
                  <tr>
                    <th>결제수단</th>
                    <td>${orderInfo.payMethod}</td> <!-- 카드, 무통장입금, 간편결제-->
                  </tr>
    
                  <tr>
                    <th>대행사</th><!--  무통장입금시 은행, 간편결제시 결제사-->
                    <td>${orderInfo.payCompany}</td>
                  </tr>
                </c:when>
                <c:otherwise>
                  <tr>
                    <th>결제수단</th>
                    <td>${orderInfo.payMethod}</td> <!-- 카드, 무통장입금, 간편결제-->
                  </tr>
                </c:otherwise>
            </c:choose>
            </table>
          </div>

        <div id="oder_price_content">
          <h3>총 결제금액</h3>
          <P><span>0000</span> 원</P>
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

<script>
 const movie_order_condition = ${orderInfo.movieOrderCondition};
 const choice_order_code = ${orderInfo.orderCode};
 const order_take_date = '${orderInfo.orderDate}';
 const order_movie_price = '${orderInfo.moviePrice}';
</script>
  <script src="../js/oder_confirmation.js"></script>
  <script src="../js/common.js"></script>
</body>
</html>