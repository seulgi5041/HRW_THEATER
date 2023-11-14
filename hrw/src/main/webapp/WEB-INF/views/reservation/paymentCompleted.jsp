<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <% 
    // 세션에서 사용자 정보를 가져옵니다.
    String loggedInUserName = (String) session.getAttribute("loginId"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HRW 예매페이지</title> 

  <link rel="stylesheet" href="../css/common.css">
  <link rel="stylesheet" href="../css/ticket.css">
  <link rel="stylesheet" href="../css/ticket_step05.css">
  <link rel="stylesheet" href="../css/modal.css">
  
</head>
<body>

  <!-- 헤더 영역 -->
    <jsp:include page="../include/header.jsp"/>

    <c:set var="foodPrice" value="0" />
    <c:forEach items="${foodInfoList}" var="foodInfo">
    <c:set var="foodPrice" value="${foodPrice + foodInfo.foodPrice}" />
    </c:forEach>
<c:set var="totalPrice" value="${orderDTO.moviePrice+foodPrice}" />

<main id="contents" class="contents_full contents_reserve" style="margin-top:30px;">
  <section class="wrap_reserve">
    <div id="reserveStep05" class="section_step_title">
      <ul>
        <!-- 상영시간 -->
        <li class="step01 prev">
          <a href="#reserveStep02">
            <strong class="tit">
              <span>01</span>
              <br>
              상영시간
            </strong>
            <div class="box_con">
              <dl>
                <dt>선택한 영화 정보</dt>
                <dd>${choiceScheduleInfo.movieTitle}</dd>
                <dt>선택한 상영관</dt>
                <dd>"${choiceScheduleInfo.cinemaName} " 
                    "${choiceScheduleInfo.auditorium}"</dd>
                <dt>선택한 상영 시간</dt>
                <dd>date(${choiceScheduleInfo.takeDate}(${choiceScheduleInfo.takeDateOfWeek}))</dd>
                <dt>선택한 시간</dt>
                <dd>"${choiceScheduleInfo.startTime}~" 
                  "${choiceScheduleInfo.endTime}"</dd>
              </dl>
            </div>
          </a>
        </li>

        <!-- 인원,좌석 -->
        <li class="step01 prev">
          <a href="#reserveStep03">
            <strong class="tit">
              <span>02</span>
              <br>
              인원/좌석
            </strong>
            <div class="box_con">
              <dl>
                <dt>선택한 인원</dt>
                <dd>
                  <span id="preview_people_info">성인 : ${orderDTO.adultCount} |
                    청소년 : ${orderDTO.teenagerCount} |
                    장애인 : ${orderDTO.disabledCount}</span>
                </dd>
                <dt>선택한 좌석</dt>
                <dd>
                  <span id="preview_seat_info"><c:forEach items="${seatList}" var="seat" varStatus="loop">
                    '${seat.seatName}'<c:if test="${!loop.last}">, </c:if>
                  </c:forEach></span>
                </dd>
              </dl>
            </div>
          </a>
        </li>

        <!-- 음식선택 -->
        <li class="step01 prev">
          <a href="#reserveStep04">
            <strong class="tit">
              <span>03</span>
              <br>
              음식선택
            </strong>
            <div class="box_con">
              <dl>
                <dt>선택한 음식</dt>
                <c:forEach items="${foodInfoList}" var="foodInfo" varStatus="loop">
                    
                <dd>
                  <span id="preview_store_info">${foodInfo.foodNameStr} , 수량 : ${foodInfo.foodCount} , 가격 : ${foodInfo.foodPrice}</span>
                </dd>

                  </c:forEach>
              </dl>
            </div>
          </a>
        </li>

        <!-- 결제 -->
        <li class="step01 prev">
          <a href="#reserveStep04">
            <strong class="tit">
              <span>04</span>
              <br>
              결제
            </strong>
            <div class="box_con">
              <dl>
                <dt>티켓금액</dt>
                <dd>Movie : ${orderDTO.moviePrice}원</dd>
                <dt>음식합계</dt>
                <dd>Food : ${foodPrice}원</dd>
                <dt>총 합계</dt>
                <dd>총 ${totalPrice} 원</dd>
              </dl>
            </div>
          </a>
        </li>

        <!-- 결제완료 -->
        <li class="step01 active">
          <a style="cursor: default;">
            <strong class="tit">
              <span>05</span>
              <br>
              결제완료
            </strong>
            <!-- <div class="box_con">
              <dl>
                <dt>영화제목</dt>
                <dd>선택한 영화 제목</dd>
                <dd>"지점 " 
                    "관"</dd>
                <dt>선택한 음식</dt>
                <dd>선택한 음식 이름들</dd>
                <dt>선택한 상영 시간</dt>
                <dd>date(yyyy-mm-dd(요일))</dd>
                <dt>선택한 시간</dt>
                <dd>"00:00~" 
                    "00:00"</dd>
                
              </dl>
            </div> -->
          </a>
        </li>
      </ul>
    </div>

  <!-- 결제완료 페이지 -->
  <div id="reserveStep05" class="section_step_con step05 active">
    <article class="article_layer article_fin">
      <div class="group_header">
        <h4 class="tit">결제 완료</h4>
      </div>
      <div class="inner">
          <!-- 결제완료 페이지 -->
        <div class="container fin_wrap">
          <!-- 회원 이름 출력 -->
          <div class="top_notice_fin ty1">
            <strong>
              <span><%= loggedInUserName %></span> 회원님 결제가 성공적으로 완료되었습니다.
            </strong>

          </div>

          <!-- 선택 결과출력 -->
          <div class="reserve_result_wrap">
            <div class="info_wrap">
              <div class="box_thum">
                <img src="../images/poster_rank/${choiceScheduleInfo.movieCodeStr}.jpg" alt="${choiceScheduleInfo.movieCodeStr}">
              </div>
              <div class="group_info">
                <dl>
                  <dt>주문번호</dt>
                  <dd>
                    <strong class="txt_num">${orderDTO.orderCode}</strong>
                  </dd>
                </dl>
                <dl>
                  <dt>상영일시</dt>
                  <dd>
                    date(${choiceScheduleInfo.takeDate}(${choiceScheduleInfo.takeDateOfWeek}))
                    <span>${choiceScheduleInfo.startTime}~ 
                      ${choiceScheduleInfo.endTime}</span>
                  </dd>
                  <dt>상영관</dt>
                  <dd>${choiceScheduleInfo.cinemaName}  
                    ${choiceScheduleInfo.auditorium}</dd>
                  <dt>관람인원</dt>
                  <dd>성인 : ${orderDTO.adultCount} |
                    청소년 : ${orderDTO.teenagerCount} |
                    장애인 : ${orderDTO.disabledCount}</dd>
                  <dt>좌석</dt>
                  <dd><c:forEach items="${seatList}" var="seat" varStatus="loop">
                    '${seat.seatName}'<c:if test="${!loop.last}">, </c:if>
                  </c:forEach></dd>
                </dl>
                <dl>
                  <dt>선택 음식</dt>
                  <dd><c:forEach items="${foodInfoList}" var="foodInfo" varStatus="loop">
                    ${foodInfo.foodNameStr} , 수량 : ${foodInfo.foodCount}<c:if test="${!loop.last}">, </c:if>
                      </c:forEach></dd>
                  <!-- 몇개를 선택했는지에 따라 달라짐 -->
            
                </dl>
              </div>
            </div>

            <!-- 금액결과 -->
            <div class="payment_wrap new2020">
              <div class="group_price case1">
                <dl>
                  <dt>영화금액</dt>
                  <dd>
                    <strong>${orderDTO.moviePrice}</strong>
                    원
                  </dd>
                </dl>
              </div>
              <div class="group_price case2">
                <dl>
                  <dt>음식금액</dt>
                  <dd>
                    <strong>${foodPrice}</strong>
                    원
                  </dd>
                </dl>
              </div>
              <div class="group_price case3">
                <dl>
                  <dt>총 결제 금액</dt>
                  <dd>
                    <strong>${totalPrice}</strong>
                    원
                  </dd>
                </dl>
              </div>
            </div>
          </div>

          <!-- 유의사항 -->
          <ul class="list_txt sml">
            <li>
              <strong>온라인 예매 내역 취소는 상영 시작 20분 전까지 온라인에서 가능합니다.</strong>
            </li>
            <li>
              <strong>상영시작 20분전 이후 부터는 영화관 현장에서만 취소 가능합니다.</strong>
            </li>
            <li>
              적립 예정 HRW.POINT는 영화 관람 다음 날 적립 됩니다.
            </li>
            <li>
              예고편 상영 등 사정에 의해 본 영화 시작이 10여분 정도 차이 날 수 있습니다.
            </li>
            <li>
              개인정보 보호 정책에 따라 주민번호로 예매 티켓을 찾을 수 없습니다. 꼭 예매번호를 확인해 주세요.
            </li>
            <li>
              구매한 상품은 주문정보확인 내역에서 확인 할 수 있습니다.
            </li>
          </ul>

          <!-- 버튼 출력부분 -->
          <div class="btn_wrap">           
            <a href="javascript:void(0)" class="btn_col2 ty5" style="
            margin-right: 20px;" data-ordercode="${orderDTO.orderCode}" id="go_order_detail_btn">결제내역 바로가기</a>
            <a href="/" class="btn_col1 ty5">홈으로 바로가기</a>
          </div>
        </div>

      </div>

      
    </article>
  </div>

  </section>
</main>

<!-- 푸터 -->
    <jsp:include page="../include/footer.jsp"/>
    
    
<!-- 자바스크립트 영역 -->
<script src="../js/pay_completed.js"></script>
<script src="../js/ticket_main.js"></script>
<script src="../js/ticket_reverse.js"></script> 
<script src="../js/modal.js"></script>

</body>
</html>