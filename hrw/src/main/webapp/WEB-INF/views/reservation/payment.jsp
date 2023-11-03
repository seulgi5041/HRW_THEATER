<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<main id="contents" class="contents_full contents_reserve" style="margin-top:30px;">
  <section class="wrap_reserve">
    <div id="reserveStep04" class="section_step_title">
      <ul>
        <!-- 상영시간 -->
        <li class="step01 prev">
<<<<<<< HEAD
          <a href="/reservation/first">
=======
          <a href="#reserveStep02">
>>>>>>> 167ea023502192dc31f8cd1a7cbf773bda115a24
            <strong class="tit">
              <span>01</span>
              <br>
              상영시간
            </strong>
            <div class="box_con">
              <dl>
                <dt>선택한 영화 정보</dt>
                <dd>title</dd>
                <dt>선택한 상영관</dt>
                <dd>"지점 " 
                    "관"</dd>
                <dt>선택한 상영 시간</dt>
                <dd>date(yyyy-mm-dd(요일))</dd>
                <dt>선택한 시간</dt>
                <dd>"00:00~" 
                    "00:00"</dd>
              </dl>
            </div>
          </a>
        </li>

        <!-- 인원,좌석 -->
        <li class="step01 prev">
<<<<<<< HEAD
          <a href="/reservation/second">
=======
          <a href="#reserveStep03">
>>>>>>> 167ea023502192dc31f8cd1a7cbf773bda115a24
            <strong class="tit">
              <span>02</span>
              <br>
              인원/좌석
            </strong>
            <div class="box_con">
              <dl>
                <dt>선택한 인원</dt>
                <dd>
                  <span id="preview_people_info"></span>
                </dd>
                <dt>선택한 좌석</dt>
                <dd>
                  <span id="preview_seat_info"></span>
                </dd>
              </dl>
            </div>
          </a>
        </li>

        <!-- 음식선택 -->
        <li class="step01 prev">
<<<<<<< HEAD
          <a href="/reservation/third_combo">
=======
          <a href="#reserveStep04">
>>>>>>> 167ea023502192dc31f8cd1a7cbf773bda115a24
            <strong class="tit">
              <span>03</span>
              <br>
              음식선택
            </strong>
            <div class="box_con">
              <dl>
                <dt>선택한 음식</dt>
                <dd>
                  <span id="preview_store_info"></span>
                </dd>
                <dd>
                  <span id="preview_store_info"></span>
                </dd>
                <dd>
                  <span id="preview_store_info"></span>
                </dd>
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
                <dt>title</dt>
                <dd>티켓금액</dd>
                <dd>~~~원</dd>
                <dt>음식합계</dt>
                <dd>~~~~원</dd>
                <dt>총 합계</dt>
                <dd>총 ~~~ 원</dd>
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
              <dl>선택한 영화 제목
                <dt>title</dt>
                <dd>선택한 상영관</dd>
                <dd>"지점 " 
                    "관"</dd>
                <dt>선택한 상영 시간</dt>
                <dd>date(yyyy-mm-dd(요일))</dd>
                <dt>선택한 시간</dt>
                <dd>"00:00~" 
                    "00:00"</dd>
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
            <img src="../images/poster_rank/20197122.jpg" alt="선택 영화 포스터">
          </span>
          <strong class="tit">
            <span class="ic_grade gr_12"></span>
            선택 영화 제목
          </strong>
          <dl class="list_info">
            <dt>일시</dt>
            <dd>선택 날자(요일) 시작시간 ~ 종료시간</dd>
            <dt>영화관</dt>
            <dd>선택 영화관/몇 관</dd>
            <dt>인원</dt>
            <dd>선택한 인원</dd>
          </dl>
        </div>
        <div class="seat_info">
          선택한 좌석(좌석 A1)
        </div>  

        <!-- 선택한 음식 -->
        <div class="movie_info">
          <span class="thum">
            <img src="../images/store/product/double_combo.png" alt="선택 음식">
          </span>
          <strong class="tit">
            선택 음식 (대표 이미지 하나)
          </strong>
          <dl class="list_info">
            <dt>음식</dt>
            <dd>선택 음식 나열</dd>
            <dt>수량</dt>
            <dd>선택음식수량</dd>
            <dd>선택음식수량2</dd>
            <dd>선택음식수량3</dd>
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
                        <button type="button" class="case1">신용카드</button>
                      </li>
                      <li>
                        <button type="button" class="case2">간편결제</button>
                      </li>
                      <li>
                        <button type="button" class="case3">무통장입금</button>
                      </li>
                      <li>
                        <button type="button" class="case4">휴대폰</button>
                      </li>
                    </ul>
                  </div>

                  <!-- 결제수단 클릭시 보여질 메뉴들 -->
                  <div class="article_pay_card">
                    <ul class="list_pay_item cate5 itemcenter">
                      <li>
                        <button class>
                          <span class="thum">
                            <img src="../images/ticket/group_payment/card_logo_kb.png" alt="국민카드" class="mCS_img_loaed"> 
                          </span>
                          <span class="tit">국민카드</span>
                        </button>
                      </li>
                      <li>
                        <button class>
                          <span class="thum">
                            <img src="../images/ticket/group_payment/card_logo_samsung.png" alt="상성카드" class="mCS_img_loaed"> 
                          </span>
                          <span class="tit">삼성카드</span>
                        </button>
                      </li>
                      <li>
                        <button class>
                          <span class="thum">
                            <img src="../images/ticket/group_payment/card_logo_hyundai.png" alt="현대카드" class="mCS_img_loaed"> 
                          </span>
                          <span class="tit">현대카드</span>
                        </button>
                      </li>
                      <li>
                        <button class>
                          <span class="thum">
                            <img src="../images/ticket/group_payment/card_logo_lotte.png" alt="롯데카드" class="mCS_img_loaed"> 
                          </span>
                          <span class="tit">롯데카드</span>
                        </button>
                      </li>
                      <li>
                        <button class>
                          <span class="thum">
                            <img src="../images/ticket/group_payment/card_logo_kakao.png" alt="카카오뱅크" class="mCS_img_loaed"> 
                          </span>
                          <span class="tit">카카오뱅크</span>
                        </button>
                      </li>
                      <li>
                        <button class>
                          <span class="thum">
                            <img src="../images/ticket/group_payment/card_logo_shinhan.png" alt="신한카드" class="mCS_img_loaed"> 
                          </span>
                          <span class="tit">신한카드</span>
                        </button>
                      </li>
                      <li>
                        <button class>
                          <span class="thum">
                            <img src="../images/ticket/group_payment/card_logo_hana.png" alt="하나카드" class="mCS_img_loaed"> 
                          </span>
                          <span class="tit">하나카드</span>
                        </button>
                      </li>
                      <li>
                        <button class>
                          <span class="thum">
                            <img src="../images/ticket/group_payment/card_logo_keb.png" alt="외환카드" class="mCS_img_loaed"> 
                          </span>
                          <span class="tit">외환카드</span>
                        </button>
                      </li>
                      <li>
                        <button class>
                          <span class="thum">
                            <img src="../images/ticket/group_payment/card_logo_woori.png" alt="우리카드" class="mCS_img_loaed"> 
                          </span>
                          <span class="tit">우리카드</span>
                        </button>
                      </li>
                      <li>
                        <button class>
                          <span class="thum">
                            <img src="../images/ticket/group_payment/card_logo_bc.png" alt="롯데카드" class="mCS_img_loaed"> 
                          </span>
                          <span class="tit">BC카드</span>
                        </button>
                      </li>
                      <li>
                        <button class>
                          <span class="thum">
                            <img src="../images/ticket/group_payment/card_logo_nh.png" alt="농협카드" class="mCS_img_loaed"> 
                          </span>
                          <span class="tit">농협카드</span>
                        </button>
                      </li>
                      <li>
                        <button class>
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
                        <button class="pay_simple_box" type="button">
                          <span class="pay_simple_thum">
                            <img src="../images/ticket/group_payment/payment_simple_kakao.png" alt="카카오페이">
                          </span>
                          <span class="pay_simple_tit">카카오페이</span>
                        </button>
                      </li>
                      <li>
                        <button class="pay_simple_box" type="button">
                          <span class="pay_simple_thum">
                            <img src="../images/ticket/group_payment/payment_simple_npay1.png" alt="네이버페이">
                          </span>
                          <span class="pay_simple_tit">네이버페이</span>
                        </button>
                      </li>
                      <li>
                        <button class="pay_simple_box" type="button">
                          <span class="pay_simple_thum">
                            <img src="../images/ticket/group_payment/payment_simple_payco.png" alt="페이코">
                          </span>
                          <span class="pay_simple_tit">페이코</span>
                        </button>
                      </li>
                      <li>
                        <button class="pay_simple_box" type="button">
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
              <strong>선택금액</strong>
              원
            </dd>
          </dl>
          <dl>
            <dt>결제금액</dt>
            <dd>
              총
              <strong>결제금액</strong>
              원
            </dd>
          </dl>
          <a href="/reservation/paymentCompleted" class="btn_col1 btn_confirm">결제하기</a>
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