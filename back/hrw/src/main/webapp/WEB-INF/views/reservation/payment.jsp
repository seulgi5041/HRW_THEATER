<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HRW 예매페이지</title>

  <link rel="stylesheet" href="../css/common.css">
  <link rel="stylesheet" href="../css/ticket.css">
  <link rel="stylesheet" href="../css/ticket_step04.css">
  
</head>
<body>

  <!-- 헤더 영역 -->
    <jsp:include page="../include/header.jsp"/>
    <c:set var="foodPrice" value="0" />
<c:forEach items="${foodInfoList}" var="foodInfo">
    <c:set var="foodPrice" value="${foodPrice + foodInfo.foodPrice}" />
</c:forEach>
<c:set var="totalPrice" value="${personCount.moviePrice+foodPrice}" />
<main id="contents" class="contents_full contents_reserve" style="margin-top:30px;">
  <section class="wrap_reserve">
    <div id="reserveStep04" class="section_step_title">
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
                  <span id="preview_people_info">성인 : ${personCount.adultCount} |
                    청소년 : ${personCount.teenagerCount} |
                    장애인 : ${personCount.disabledCount}</span>
                </dd>
                <dt>선택한 좌석</dt>
                <dd>
                  <span id="preview_seat_info">
                    <c:forEach items="${seatList}" var="seat" varStatus="loop">
                    '${seat.seatName}'<c:if test="${!loop.last}">, </c:if>
                  </c:forEach>
                </span>
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
                  <span id="preview_store_info">${foodInfo.foodName} , 수량 : ${foodInfo.foodCount} , 가격 : ${foodInfo.foodPrice}</span>
                </dd>

                  </c:forEach>
              </dl>
            </div>
          </a>
        </li>

        <!-- 결제 -->
        <li class="step01 active">
          <a style="cursor: default;">
            <strong class="tit">
              <span>04</span>
              <br>
              결제
            </strong>
            <div class="box_con">
              <dl>
                <dt>티켓금액</dt>
                <dd>Movie : ${personCount.moviePrice}원</dd>
                <dt>음식합계</dt>
                <dd>Food : ${foodPrice}원</dd>
                <dt>총 합계</dt>
                <dd>총 ${totalPrice} 원</dd>
              </dl>
            </div>
          </a>
        </li>

        <!-- 결제완료 -->
        <li class="disabled">
          <a style="cursor: default;">
            <strong class="tit">
              <span>05</span>
              <br>
              결제완료
            </strong>
            <div class="box_con">
              <dl>
                <dt>정보없음</dt>
                <dd>정보없음</dd>
                <dd>정보없음</dd>
                <dt>정보없음</dt>
                <dd>정보없음</dd>
                <dt>정보없음</dt>
                <dd>정보없음</dd>
              </dl>
            </div>
          </a>
        </li>
      </ul>
    </div>

  <!-- 결제 스텝4 -->
  <div id="reserveStep04" class="section_step_con step04 active">
    <!-- 예매정보(포스터, title, 날짜, 시간, 영화관, 인원, 좌석) -->
    <article class="article_layer article_sum_info">
      <div class="group_header">
        <h4 class="tit">예매정보</h4>
      </div>
      <div class="inner">
        <!-- 예매한 영화 -->
        <div class="movie_info">
          <span class="thum">
            <img src="../images/poster_rank/${choiceScheduleInfo.movieCodeStr}.jpg" alt="${choiceScheduleInfo.movieCodeStr}">
          </span>
          <strong class="tit">
            <span class="ic_grade ${choiceScheduleInfo.movieRating}"></span>
            ${choiceScheduleInfo.movieTitle}
          </strong>
          <dl class="list_info">
            <dt>일시</dt>
            <dd>${choiceScheduleInfo.takeDate}(${choiceScheduleInfo.takeDateOfWeek}) ${choiceScheduleInfo.startTime} ~ ${choiceScheduleInfo.endTime}</dd>
            <dt>영화관</dt>
            <dd>${choiceScheduleInfo.cinemaName} / ${choiceScheduleInfo.auditorium}</dd>
            <dt>인원</dt>
            <dd>성인 : ${personCount.adultCount} |
              청소년 : ${personCount.teenagerCount} |
              장애인 : ${personCount.disabledCount}</dd>
          </dl>
        </div>
        <div class="seat_info">
          <c:forEach items="${seatList}" var="seat" varStatus="loop">
          ${seat.seatName}<c:if test="${!loop.last}">, </c:if>
          </c:forEach>
        </div>  

        <!-- 선택한 음식 -->
        <div class="movie_info">
          <span class="thum">
            <img src="../images/store/product/${foodInfoList[0].foodImgName}.png" alt="${foodInfoList[0].foodName}">
          </span>
          <strong class="tit">
            ${foodInfoList[0].foodName}
          </strong>
          <dl class="list_info">
            <dt>음식</dt>
            <dd>
              <c:forEach items="${foodInfoList}" var="food" varStatus="loop">
                ${food.foodName}<c:if test="${!loop.last}">, </c:if>
                </c:forEach>
            </dd>
            <dt>수량</dt>
            <c:forEach items="${foodInfoList}" var="food" varStatus="loop">
              <c:if test="${!loop.first}"><dt></dt></c:if> <dd>${food.foodName} : ${food.foodCount}</dd>
                </c:forEach>            
          </dl>
        </div>
      </div>
    </article>

    <!-- 결제수단(카드, 간편결제, 통장) -->
    <article class="article_layer article_pay_method">
      <div class="group_header">
        <h4 class="tit movie_name">결제수단</h4>
      </div>
      <div class="inner">
        <div class="list_box"></div>

        <!-- 영화선택 -->
        <div class="movie_select_wrap list movieSelect">
          <div class="mCustomScrollbar movieScroll _mCS_9 mCS-autoHide" style="position: relative; overflow: visible;">
            <div id="mCSB_9" class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside" tabindex="0" style="max-height: none;">
              <div id="mCSB_9_container" class="mCSB_container" style="position: relative; top: 0px; left: 0px;" dir="ltr">
                <div class="group_payment">
                  <h5 class="tit_payment">결제 수단</h5>
                  <div class="box_case">
                    <ul class="list_pay_item cate6">
                      <li>
                        <button type="button" class="case1" data-payment="카드">신용카드</button>
                      </li>
                      <li>
                        <button type="button" class="case2" data-payment="간편결제">간편결제</button>
                      </li>
                      <li>
                        <button type="button" class="case3" data-payment="무통장">무통장입금</button>
                      </li>
                      <li>
                        <button type="button" class="case4" data-payment="휴대폰">휴대폰</button>
                      </li>
                    </ul>
                  </div>

                  <!-- 결제수단 클릭시 보여질 메뉴들 -->
                  <div class="article_pay_card">
                    <ul class="list_pay_item cate5 itemcenter">
                      <li>
                        <button data-paycompany="국민" class>
                          <span class="thum">
                            <img src="../images/ticket/group_payment/card_logo_kb.png" alt="국민카드" class="mCS_img_loaed"> 
                          </span>
                          <span class="tit">국민카드</span>
                        </button>
                      </li>
                      <li>
                        <button data-paycompany="삼성" class>
                          <span class="thum">
                            <img src="../images/ticket/group_payment/card_logo_samsung.png" alt="상성카드" class="mCS_img_loaed"> 
                          </span>
                          <span class="tit">삼성카드</span>
                        </button>
                      </li>
                      <li>
                        <button data-paycompany="현대" class>
                          <span class="thum">
                            <img src="../images/ticket/group_payment/card_logo_hyundai.png" alt="현대카드" class="mCS_img_loaed"> 
                          </span>
                          <span class="tit">현대카드</span>
                        </button>
                      </li>
                      <li>
                        <button data-paycompany="롯데" class>
                          <span class="thum">
                            <img src="../images/ticket/group_payment/card_logo_lotte.png" alt="롯데카드" class="mCS_img_loaed"> 
                          </span>
                          <span class="tit">롯데카드</span>
                        </button>
                      </li>
                      <li>
                        <button data-paycompany="카카오뱅크" class>
                          <span class="thum">
                            <img src="../images/ticket/group_payment/card_logo_kakao.png" alt="카카오뱅크" class="mCS_img_loaed"> 
                          </span>
                          <span class="tit">카카오뱅크</span>
                        </button>
                      </li>
                      <li>
                        <button data-paycompany="신한" class>
                          <span class="thum">
                            <img src="../images/ticket/group_payment/card_logo_shinhan.png" alt="신한카드" class="mCS_img_loaed"> 
                          </span>
                          <span class="tit">신한카드</span>
                        </button>
                      </li>
                      <li>
                        <button data-paycompany="하나" class>
                          <span class="thum">
                            <img src="../images/ticket/group_payment/card_logo_hana.png" alt="하나카드" class="mCS_img_loaed"> 
                          </span>
                          <span class="tit">하나카드</span>
                        </button>
                      </li>
                      <li>
                        <button data-paycompany="외환" class>
                          <span class="thum">
                            <img src="../images/ticket/group_payment/card_logo_keb.png" alt="외환카드" class="mCS_img_loaed"> 
                          </span>
                          <span class="tit">외환카드</span>
                        </button>
                      </li>
                      <li>
                        <button data-paycompany="우리" class>
                          <span class="thum">
                            <img src="../images/ticket/group_payment/card_logo_woori.png" alt="우리카드" class="mCS_img_loaed"> 
                          </span>
                          <span class="tit">우리카드</span>
                        </button>
                      </li>
                      <li>
                        <button data-paycompany="BC" class>
                          <span class="thum">
                            <img src="../images/ticket/group_payment/card_logo_bc.png" alt="롯데카드" class="mCS_img_loaed"> 
                          </span>
                          <span class="tit">BC카드</span>
                        </button>
                      </li>
                      <li>
                        <button data-paycompany="농협" class>
                          <span class="thum">
                            <img src="../images/ticket/group_payment/card_logo_nh.png" alt="농협카드" class="mCS_img_loaed"> 
                          </span>
                          <span class="tit">농협카드</span>
                        </button>
                      </li>
                      <li>
                        <button data-paycompany="씨티" class>
                          <span class="thum">
                            <img src="../images/ticket/group_payment/card_logo_citi.png" alt="씨티카드" class="mCS_img_loaed"> 
                          </span>
                          <span class="tit">씨티카드</span>
                        </button>
                      </li>
                    </ul>
                  </div>
                  <div class="article_pay_simple">
                    <ul class="list_pay_item cate3">
                      <li>
                        <button class="pay_simple_box" type="button"  data-paycompany="카카오페이">
                          <span class="pay_simple_thum">
                            <img src="../images/ticket/group_payment/payment_simple_kakao.png" alt="카카오페이">
                          </span>
                          <span class="pay_simple_tit">카카오페이</span>
                        </button>
                      </li>
                      <li>
                        <button class="pay_simple_box" type="button" data-paycompany="네이버페이">
                          <span class="pay_simple_thum">
                            <img src="../images/ticket/group_payment/payment_simple_npay1.png" alt="네이버페이">
                          </span>
                          <span class="pay_simple_tit">네이버페이</span>
                        </button>
                      </li>
                      <li>
                        <button class="pay_simple_box" type="button" data-paycompany="페이코">
                          <span class="pay_simple_thum">
                            <img src="../images/ticket/group_payment/payment_simple_payco.png" alt="페이코">
                          </span>
                          <span class="pay_simple_tit">페이코</span>
                        </button>
                      </li>
                      <li>
                        <button class="pay_simple_box" type="button" data-paycompany="토스">
                          <span class="pay_simple_thum">
                            <img src="../images/ticket/group_payment/payment_simple_toss.png" alt="토스">
                          </span>
                          <span class="pay_simple_tit">토스</span>
                        </button>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

       
      
      </div>

    </article>

    <!-- 결제하기 (상품금액, 결제금액, 결제)-->
    <article class="article_layer article_payment">
      <div class="group_header">
        <h4 class="tit">결제하기</h4>
      </div>

      <div class="inner">
        <div class="select_item_wrap">
         <div class="group_item"> 
            <div class="bx_item">
              <input type="checkbox" id="chkSavingTerm">
              <label for="chkSavingTerm" class="ty2">
                결제대행 서비스 약관 동의
              </label>
            </div>
            <div class="group_side">
              <div class="bx_provision">
                <ul class="provisio_lis">
                  <li>
                    <input type="checkbox" id="chkProvisionTerm01">
                    <label for="chkProvisionTerm01" class="ty2">
                      전자금융거래 이용약관 동의
                    </label>
                    <button class="btn_txt_more ty2">약관보기</button>
                  </li>
                  <li>
                    <input type="checkbox" id="chkProvisionTerm02">
                    <label for="chkProvisionTerm02" class="ty2">
                      고유식별정보 수집 및 이용안내
                    </label>
                    <button class="btn_txt_more ty2">약관보기</button>
                  </li>
                  <li>
                    <input type="checkbox" id="chkProvisionTerm03">
                    <label for="chkProvisionTerm03" class="ty2">
                      개인정보 수집 및 이용동의
                    </label>
                    <button class="btn_txt_more ty2">약관보기</button>
                  </li>
                  <li>
                    <input type="checkbox" id="chkProvisionTerm04">
                    <label for="chkProvisionTerm04" class="ty2">
                      개인정보 제3자 제공/위탁동의
                    </label>
                    <button class="btn_txt_more ty2">약관보기</button>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="payment_sum_wrap">
          <dl>
            <dt>
              상품
              금액
            </dt>
            <dd>
              <strong>${personCount.moviePrice} + ${foodPrice} </strong>원 
            </dd>
          </dl>
          
          <dl>
            <dt>결제금액</dt>
            <dd>
              총
              <strong>${totalPrice}</strong>
              원
            </dd>
          </dl>
          <a href="javascript:void(0)" class="btn_col1 btn_confirm" id="next_page_btn">결제하기</a>
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
<script src="../js/ticket_main.js"></script>
<script src="../js/ticket_reverse.js"></script> 
<script src="../js/payment.js"></script>

</body>
</html>