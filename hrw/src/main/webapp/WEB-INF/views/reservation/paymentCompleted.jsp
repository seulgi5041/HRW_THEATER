<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<main id="contents" class="contents_full contents_reserve" style="margin-top:30px;">
  <section class="wrap_reserve">
    <div id="reserveStep05" class="section_step_title">
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
        <li class="step01 prev">
<<<<<<< HEAD
          <a href="/reservation/payment">
=======
          <a href="#reserveStep04">
>>>>>>> 167ea023502192dc31f8cd1a7cbf773bda115a24
            <strong class="tit">
              <span>04</span>
              <br>
              결제
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
              <span>user</span> 회원님 결제가 성공적으로 완료되었습니다.
            </strong>

          </div>

          <!-- 선택 결과출력 -->
          <div class="reserve_result_wrap">
            <div class="info_wrap">
              <div class="box_thum">
                <img src="../images/poster_rank/20212667.jpg" alt="내가 선택한 영화의 포스터 이미지">
              </div>
              <div class="group_info">
                <dl>
                  <dt>예매번호</dt>
                  <dd>
                    <strong class="txt_num">예매번호출력</strong>
                  </dd>
                </dl>
                <dl>
                  <dt>상영일시</dt>
                  <dd>
                    (yyyy-mm-dd (요일))
                    <span>시작시간 ~ 종료시간</span>
                  </dd>
                  <dt>상영관</dt>
                  <dd>선택 상영관 몇관</dd>
                  <dt>관람인원</dt>
                  <dd>선택인원</dd>
                  <dt>좌석</dt>
                  <dd>선택좌석(예 A1)</dd>
                </dl>
                <dl>
                  <dt>선택 음식</dt>
                  <dd>선택음식1 수량, 2수량, 3수량 3수량3수량3수량3수량3수량3수량</dd>
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
                    <strong>선택금액</strong>
                    원
                  </dd>
                </dl>
              </div>
              <div class="group_price case2">
                <dl>
                  <dt>음식금액</dt>
                  <dd>
                    <strong>선택금액</strong>
                    원
                  </dd>
                </dl>
              </div>
              <div class="group_price case3">
                <dl>
                  <dt>총 결제 금액</dt>
                  <dd>
                    <strong>영화+음식 금액</strong>
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
            <a href="#none" class="btn_col2 ty5" style="
            margin-right: 20px;">결제내역 바로가기</a>
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
<script src="../js/ticket_main.js"></script>
<script src="../js/ticket_reverse.js"></script> 
<script src="../js/modal.js"></script>

</body>
</html>