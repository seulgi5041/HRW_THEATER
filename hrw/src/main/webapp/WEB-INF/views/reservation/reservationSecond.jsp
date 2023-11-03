<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HRW 예매페이지</title>

  <link rel="stylesheet" href="../css/common.css">
  <link rel="stylesheet" href="../css/ticket_step02.css">
  <link rel="stylesheet" href="../css/modal.css">
  
</head>
<body>

  <!-- 헤더 영역 -->
    <jsp:include page="../include/header.jsp"/>

<main id="contents" class="contents_full contents_reserve" style="margin-top:30px;">
  <section class="wrap_reserve">
    <div id="reserveStep02" class="section_step_title">
      <ul>
        <!-- 상영시간 -->
        <li class="step01 prev">
          <a href="/reservation/first">
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
        <li class="step01 active">
          <a style="cursor: default;">
            <strong class="tit">
              <span>02</span>
              <br>
              인원/좌석
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

        <!-- 음식선택 -->
        <li class="disabled">
          <a style="cursor: default;">
            <strong class="tit">
              <span>03</span>
              <br>
              음식선택
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

        <!-- 결제 -->
        <li class="disabled">
          <a style="cursor: default;">
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

  <!-- 영화관 스크린 좌석 선택 -->
  <div id="reserveStep02" class="section_step_con step02 active">
    <article class="article_layer article_seat">
      <div class="group_header">
        <h4 class="tit">인원/좌석 선택</h4>
        <p class="txt" id="txtPeopleMaxcount">
          인원은 최대 8명까지 가능합니다.
        </p>
      </div>
      <div class="inner">
        <div class="PersonSeatCount">
          <div class="select_num_people">
            <div class="movie_info">
              <h6 class="hidden">예매정보</h6>
              <span class="thum_movie">
                <img src="../images/poster_rank/20226798.jpg" alt="20226798">
                <!-- 이미지부터 아래는 db 혹은 자바스크립트로 가져와야 할 듯... -->
              </span>
              <div class="movie_group_info">
                <div class="box_tit">
                  <span class="ic_grade gr_12">
                    관람가
                  </span>
                  <strong>
                    30일
                  </strong>
                </div>
                <dl>
                  <dt>일시</dt>
                  <dd class="sub_info1">
                    yymmdd
                    <em>
                      요일
                    </em>
                    <span class="time">
                      시작 ~ 종료
                    </span>
                  </dd>
                  <dt>영화관</dt>
                  <dd class="sub_info1">
                    영화관
                    .
                    1관
                  </dd>
                </dl>
              </div>
            </div>

            <div class="count_people">
              <ul>
                <li id="person_10" data-people="성인" data-count="0">
                  <strong class="tit">성인</strong>
                  <span class="btn_num">
                    <button class="minus-button">
                      <img src="../images/store/minus.png" alt="minus">
                    </button>
                    <span class="txt_num">0</span>
                    <button class="plus-button">
                      <img src="../images/store/plus.png" alt="plus">
                    </button>
                  </span>  
                </li>
                <li id="person_20" data-people="청소년" data-count="0">
                  <strong class="tit">청소년</strong>
                  <span class="btn_num">
                    <button class="minus-button">
                      <img src="../images/store/minus.png" alt="minus">
                    </button>
                    <span class="txt_num">0</span>
                    <button class="plus-button">
                      <img src="../images/store/plus.png" alt="plus">
                    </button>
                  </span>  
                </li>
                <li id="person_11" data-people="장애인" data-count="0">
                  <strong class="tit">장애인</strong>
                  <span class="btn_num">
                    <button class="minus-button">
                      <img src="../images/store/minus.png" alt="minus">
                    </button>
                    <span class="txt_num">0</span>
                    <button class="plus-button">
                      <img src="../images/store/plus.png" alt="plus">
                    </button>
                  </span>  
                </li>
              </ul>
            </div>
          </div>
        </div>

        <!-- 스크린 -->
        <div class="select_seat">
          <h5 class="hidden">좌선선택</h5>
          <div class="txt_info">
            <p>좌석 선택 후 결제하기 버튼을 클릭하세요.</p>
          </div>

          <!-- 좌석 선택 부분 -->
          <div id="container" class="seat_wrap">
            <article class="m_seat_wrap">
              <div class="m_seat_inner">
                <div class="mCustomScrollbar _mCS_1 mCS-autoHide mCS_no_scrollbar" style="position: relative; overflow: visible; height: 470px;">
                  <div id="mCSB_1" class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside" tabindex="0" style="max-height: none;">
                    <div id="mCSB_1_container" class="mCSB_container" style="position: relative; top: 0px; left: 0px;" dir="ltr">
                      <div class="m_seat_door_position" id="scrollWrap">
                        <div class="m_seat_hidden">
                          <span class="title_screen">SCREEN</span>
                          <div class="show_map">
                            <div class="floor_box seat_set">
                              <span class="floor_tit" style="display: none;">6F</span>
                              <!-- 좌선 선택 하나하나의 부분 -->
                              <div class="seat_area">
                                <span class="seat_tit" style="left: -32px; top: 0px;">A</span>
                                <!-- <a href="javascript:void(0);" alt="좌석 번호:A1 일반석" class="sel  p0 on grNum3" block-code="p0" data-seat="A1" seat-statuscode="0" seat-group="grNum3" seat-code="1A01" style="left: 21px; top: 0px;">
                                  <span class="f1 bland">1</span>
                                </a> -->
                                <span class="seat_tit" style="left: -32px;">B</span>
                                <span class="seat_tit" style="left: -32px;">C</span>
                                <span class="seat_tit" style="left: -32px;">D</span>
                                <span class="seat_tit" style="left: -32px;">E</span>
                                <span class="seat_tit" style="left: -32px;">F</span>
                                <span class="seat_tit" style="left: -32px;">G</span>
                              </div>
                              
                              <!-- 상영관 출입문 정보 -->
                              <span data-y="-36px" data-x="371px" class="w_right" style="top: -35px; left: 465.5px;">
                                상영관 출입문입니다.
                              </span>
                              <span data-y="-189px" data-x="373px" class="w_right" style="top: 200px; left: 465.5px;">
                                상영관 출입문입니다.
                              </span>
                            </div>
                          </div>
                        </div>
                      </div>
                     
                    </div>
                  </div>


                </div>
              </div>

              <!-- 좌석 종류 -->
              <div class="seat_btm_box">
                <div class="seat_type">
                  <div class="seat_info_bx">
                    <div class="info1">
                      <span class="seat_type1">선택좌석</span>
                      <span class="seat_type2">선택가능</span>
                      <span class="seat_type3">예매완료</span>
                      <span class="seat_type4">선택불가</span>
                    </div>
                    <div class="info2">
                      <span class="seat_type5">장애인석</span>
                      <span class="seat_type6">출입문/대피로</span>
                    </div>
                  </div>
                </div>
              </div>
            </article>
          </div>
        </div>

        <!-- 총합계 -->
        <div class="PersonSeatSum">
          <div class="select_seat_result">
            <div class="bottom_left">
              <dl class="total_price">
                <dt>총 합계</dt>
                <dd>
                  <strong>금액</strong>
                  원
                </dd>
              </dl>
            </div>
            <div class="bottom_right">
              <a href="/reservation/third_combo" class="btn_col" id="link_rpay">결제하기</a>
            </div>
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

<script src="../js/ticket_reverse.js"></script> 
<script src="../js/seat_select.js"></script>

</body>
</html>