<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HRW 예매페이지</title>

  <link rel="stylesheet" href="../css/common.css">
  <link rel="stylesheet" href="../css/ticket.css">
  <link rel="stylesheet" href="../css/modal.css">

  <!-- jQuery CDN 포함 -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="../js/ajax/ticket1.js"></script>
  <script>
    // Get the current date
    var currentDate = new Date();
  </script>
  
</head>
<body>

  <!-- 헤더 영역 -->
    <jsp:include page="../include/header.jsp"/>

<main id="contents" class="contents_full contents_reserve" style="margin-top:30px;">
  <section class="wrap_reserve">
    <div id="reserveStep01" class="section_step_title">
      <ul>
        <!-- 상영시간 -->
        <li class="step01 active">
          <a href="#reverseStep01">
            <strong class="tit">
              <span>01</span>
              <br>
              상영시간
            </strong>
            <div class="box_con">
              <dl>
                <dt>선택한 영화 정보</dt>
                <dd></dd>
                <dt>선택한 상영관</dt>
                <dd></dd>
                <dt>선택한 날짜</dt>
                <dd></dd>
                <dt>선택한 시간</dt>
                <dd></dd>
              </dl>
            </div>
          </a>
        </li>

        <!-- 인원,좌석 -->
        <li class="disabled">
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


    <!-- 첫번째 reverse 단계 -->
    <div id="reverseStep01" class="section_step_con step01 active">
      <!-- 지역선택(영화관) -->
      <article class="article_layer article_cinema area__movingbar litype2">
        <div class="group_header">
          <h4 class="tit">예매관</h4>
        </div>
        <div class="inner">
          <ul class="tab_wrap outer actionmovingbar">
            <li class="active">
              <button type="button" class="tab_tit" style="width: 50%; left: 0%;">
                <span>전체</span>
              </button>
            </li>
            <li>
              <button type="button" class="tab_tit" style="width: 50%; left: 50%;">
                <span>영화관선택</span>
              </button>
            </li>

            <!-- 구분선 -->
            <li class="wrap_underline">
              <span class="underline"></span>
            </li>

            <!-- 지역 컨테이너 -->
            <div class=tab_container>
              <h5 class="hidden">전체</h5>

              <div class="cinema_select_wrap cinemaSelect basicCinema">
                <ul>
                  <li class="depth1">
                    <a href="#none">
                      지역선택
                    </a>
                  </li>
                  <!-- 지역선택 -->
                  <c:forEach items="${localData}" var="local">
                    <li class="depth1">
                      <a href="javascript:void(0);" >${local}</a>
                        <div class="depth2" style="display: none;">
                            <ul>
                                <c:forEach items="${cinemaNames[local]}" var="cinemaName">
                                    <li class>
                                        <a href="/cinema/movies?cinemaCode=${cinemaData.cinemaCode}" cinema-code="${cinemaData.cinemaCode}">${cinemaData.cinemaName}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </li>
                  </c:forEach>
                </ul>
              </div>

            </div>
            <!-- 나중에 tab_con에 들어갈 부분 -->
            

          </ul>
        </div>
      </article>


      <!-- 영화선택 -->
      <article class="article_layer article_movie">
        <div class="group_header">
          <h4 class="tit movie_name">영화</h4>
        </div>
        <div class="inner">
          <div class="list_box"></div>

          <!-- 영화선택 -->
          <div class="movie_select_wrap list movieSelect">
            <div class="mCustomScrollbar movieScroll _mCS_9 mCS-autoHide" style="position: relative; overflow: visible;">
              <div id="mCSB_9" class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside" tabindex="0" style="max-height: none;">
                <div id="mCSB_9_container" class="mCSB_container" style="position: relative; top: 0px; left: 0px;" dir="ltr">
                  <ul id="movie-list-container">
                    <c:forEach var="movie" items="${movies}">
                      <li class>
                        <a href="#none">
                          <div class="group_infor">
                            <div class="bx_title">
                              <span class="ic_grade ${movie.rating}"></span>
                              <strong class="tit">${movie.title}</strong>
                            </div>
                          </div>
                        </a>
                      </li>
                    </c:forEach>  
                  </ul>
                </div>
              </div>

            </div>
          </div>
        </div>

      </article>


      <!-- 시간 선택 -->
      <article class="article_layer article_time area__movingbar litype6">
        <div class="group_header">
          <h4 class="tit">선택 날짜</h4>
        </div>

        <div class="inner">
          <div class="date_select_wrap dateReserveWrap">      
            <div class="slide_wrap slide_reserve_date">
              <ul clss="owl-carousel owl-loaded owl-drag">
                <div class="owl-stage-outer">
                  <div class="owl-stage">

                    <!-- 각 li에 들어갈 날짜들 -->
                    <div class="owl-item active" style="width: 52px;">
                      <li class="item">
                        <strong class="month">11월</strong>
                        <a href="#none" class="date" tabindex="0">
                          <label for="radioDate0">
                            <input type="radio" id="radioDate0" name="radioDate1" data-displayn="Y" data-playdate="2023-11-07" data-isplaydate="Y" data-playweek="오늘" checked>
                            <strong>07</strong>
                            <em>오늘</em>
                          </label>
                        </a>
                      </li>
                    </div>

                     <div class="owl-item active" style="width: 52px;">
                      <li class="item">
                        <a href="#none" class="date" tabindex="0">
                          <label for="radioDate1">
                            <input type="radio" id="radioDate1" name="radioDate1" data-displayn="Y" data-playdate="2023-11-08" data-isplaydate="Y" data-playweek="수">
                            <strong>08</strong>
                            <em>수</em>
                          </label>
                        </a>
                      </li>
                    </div>
                    <div class="owl-item active" style="width: 52px;">
                      <li class="item">
                        <a href="#none" class="date" tabindex="0">
                          <label for="radioDate2">
                            <input type="radio" id="radioDate2" name="radioDate1" data-displayn="Y" data-playdate="2023-11-09" data-isplaydate="Y" data-playweek="목">
                            <strong>09</strong>
                            <em>목</em>
                          </label>
                        </a>
                      </li>
                    </div>
                    <div class="owl-item active" style="width: 52px;">
                      <li class="item">
                        <a href="#none" class="date" tabindex="0">
                          <label for="radioDate3">
                            <input type="radio" id="radioDate3" name="radioDate1" data-displayn="Y" data-playdate="2023-11-10" data-isplaydate="Y" data-playweek="금">
                            <strong>10</strong>
                            <em>금</em>
                          </label>
                        </a>
                      </li>
                    </div>
                    <div class="owl-item active" style="width: 52px;">
                      <li class="item">
                        <a href="#none" class="date" tabindex="0">
                          <label for="radioDate4">
                            <input type="radio" id="radioDate4" name="radioDate1" data-displayn="Y" data-playdate="2023-11-11" data-isplaydate="Y" data-playweek="토">
                            <strong>11</strong>
                            <em>토</em>
                          </label>
                        </a>
                      </li>
                    </div>
                    <div class="owl-item active" style="width: 52px;">
                      <li class="item">
                        <a href="#none" class="date" tabindex="0">
                          <label for="radioDate5">
                            <input type="radio" id="radioDate5" name="radioDate1" data-displayn="Y" data-playdate="2023-11-12" data-isplaydate="Y" data-playweek="일">
                            <strong>12</strong>
                            <em>일</em>
                          </label>
                        </a>
                      </li>
                    </div>
                    <div class="owl-item active" style="width: 52px;">
                      <li class="item">
                        <a href="#none" class="date" tabindex="0">
                          <label for="radioDate6">
                            <input type="radio" id="radioDate6" name="radioDate1" data-displayn="Y" data-playdate="2023-11-13" data-isplaydate="Y" data-playwee="월">
                            <strong>13</strong>
                            <em>월</em>
                          </label>
                        </a>
                      </li>
                    </div>
                    <div class="owl-item active" style="width: 52px;">
                      <li class="item">
                        <a href="#none" class="date" tabindex="0">
                          <label for="radioDate7">
                            <input type="radio" id="radioDate7" name="radioDate1" data-displayn="Y" data-playdate="2023-11-14" data-isplaydate="Y" data-playweek="화">
                            <strong>14</strong>
                            <em>화</em>
                          </label>
                        </a>
                      </li>
                    </div> 
                    
                    
                  </div>
                </div>
                <div>
              </ul>
              
            </div>
            
          </div>

          <!-- 상영 시간 조회 -->
          <div class="tab_container ty5">
            <h5 class="hidden">전체</h5>
            <div class="mCustomScrollbar timeScroll _mCS_20 mCS-autoHide mCS_no_scrollbar" data-mcs-theme="minimal-dark" style="position: relative; overflow: visible;">
              <div id="mCB_20" class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside" style="max-height: none;" tabindex="0">
                <div id="mCB_20 container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
                  <div class="box_notice">
                    <p>영화와 극장을 선택하시면</p>
                    <p>상영시간표를 비교하여 볼 수 있습니다.</p>
                  </div>

                  <!-- 시간, 영화 클릭시 나타날 부분 -->
                  <div class="group_time_select" style="display: none">
                    <div class="time_select_title">
                      <span class="ic_grade gr_12"> 
                        <!-- db에서 -->
                        <strong>30일</strong>
                      </span>
                    </div>


                    <div class="time_select_wrap timeSelect">
                      <ul class="list_time">
                        <li class>
                          <a href="#none" role="button">
                            <dl>
                              <dt>상영시간</dt>
                              <dd class="time">
                                <strong>17:50</strong>
                                <div class="tooltip">종료 20:00</div>
                              </dd>
                              <dt>잔여석</dt>
                              <dd class="seat">
                                <strong>86</strong>
                                " / 90"
                              </dd>
                              <dt>상영관</dt>
                              <dd class="hall">1관</dd>
                            </dl>
                          </a>
                        </li>

                        <li class>
                          <a href="#none" role="button">
                            <dl>
                              <dt>상영시간</dt>
                              <dd class="time">
                                <strong>17:50</strong>
                                <div class="tooltip">종료 20:00</div>
                              </dd>
                              <dt>잔여석</dt>
                              <dd class="seat">
                                <strong>86</strong>
                                " / 90"
                              </dd>
                              <dt>상영관</dt>
                              <dd class="hall">1관</dd>
                            </dl>
                          </a>
                        </li>

                        <li class>
                          <a href="#none" role="button">
                            <dl>
                              <dt>상영시간</dt>
                              <dd class="time">
                                <strong>17:50</strong>
                                <div class="tooltip">종료 20:00</div>
                              </dd>
                              <dt>잔여석</dt>
                              <dd class="seat">
                                <strong>86</strong>
                                " / 90"
                              </dd>
                              <dt>상영관</dt>
                              <dd class="hall">1관</dd>
                            </dl>
                          </a>
                        </li>

                        <li class>
                          <a href="#none" role="button">
                            <dl>
                              <dt>상영시간</dt>
                              <dd class="time">
                                <strong>17:50</strong>
                                <div class="tooltip">종료 20:00</div>
                              </dd>
                              <dt>잔여석</dt>
                              <dd class="seat">
                                <strong>86</strong>
                                " / 90"
                              </dd>
                              <dt>상영관</dt>
                              <dd class="hall">1관</dd>
                            </dl>
                          </a>
                        </li>
                      </ul>

                    </div>

                  </div>

                  <div class="group_time_select" style="display: none">
                    <div class="time_select_title">
                      <span class="ic_grade gr_12">
                        <strong>30일</strong>
                      </span>
                    </div>
                    <div class="time_select_wrap timeSelect">
                      <ul class="list_time">
                        <li class>
                          <a href="#none" role="button">
                            <dl>
                              <dt>상영시간</dt>
                              <dd class="time">
                                <strong>17:50</strong>
                                <div class="tooltip">종료 20:00</div>
                              </dd>
                              <dt>잔여석</dt>
                              <dd class="seat">
                                <strong>86</strong>
                                " / 90"
                              </dd>
                              <dt>상영관</dt>
                              <dd class="hall">1관</dd>
                            </dl>
                          </a>
                        </li>

                        <li class>
                          <a href="#none" role="button">
                            <dl>
                              <dt>상영시간</dt>
                              <dd class="time">
                                <strong>17:50</strong>
                                <div class="tooltip">종료 20:00</div>
                              </dd>
                              <dt>잔여석</dt>
                              <dd class="seat">
                                <strong>86</strong>
                                " / 90"
                              </dd>
                              <dt>상영관</dt>
                              <dd class="hall">1관</dd>
                            </dl>
                          </a>
                        </li>

                        <li class>
                          <a href="#none" role="button">
                            <dl>
                              <dt>상영시간</dt>
                              <dd class="time">
                                <strong>17:50</strong>
                                <div class="tooltip">종료 20:00</div>
                              </dd>
                              <dt>잔여석</dt>
                              <dd class="seat">
                                <strong>86</strong>
                                " / 90"
                              </dd>
                              <dt>상영관</dt>
                              <dd class="hall">1관</dd>
                            </dl>
                          </a>
                        </li>

                        <li class>
                          <a href="#none" role="button">
                            <dl>
                              <dt>상영시간</dt>
                              <dd class="time">
                                <strong>17:50</strong>
                                <div class="tooltip">종료 20:00</div>
                              </dd>
                              <dt>잔여석</dt>
                              <dd class="seat">
                                <strong>86</strong>
                                " / 90"
                              </dd>
                              <dt>상영관</dt>
                              <dd class="hall">1관</dd>
                            </dl>
                          </a>
                        </li>
                      </ul>
                    </div>

                  </div>
                  <!-- 시간, 영화 클릭시 나타날 부분 종료 / group_time_select 필요하면 더 쓸 것-->
                </div>
              </div>
            </div>
          </div>

        </div>
      </article>
    </div>
  </section>
</main>

<!-- 모달창 부분 -->
<!-- 좌석 선택으로 넘어가기 위한 모달 창 -->
<div id="modal" style="left: 50%; top: 50%; margin-top: -256.5px; margin-left: -250px;" tabindex="0">
  <div class="modal_header">
    <h4 class="hidden">예매 내용 확인 팝업</h4>

    <!-- 클릭한 요소 가져오기(시간, 관) -->
    <div class="stepOnePopupHeader">
      <strong></strong>
    </div>

    <button type="button" class="btn_close" onclick="closeModal()">
      팝업닫기
    </button>
  </div>

  <!-- 모달 컨테이너 -->
  <div class="modal_container">
    <!-- 좌석 정보 -->
    <div class="seat_info">
      <div class="group_top" id="stepOnePopupConSeat">
        <dl>
          <dt>잔여좌석</dt>
          <dd>
            <strong>187</strong>
            "/195"
          </dd>
        </dl>
      </div>

      <div class="group_container screen_preview">
        <div class="screen_preview_con">
          <div class="screen_info">
            <!-- // -->
            <div class="sm_screen">
              <span class="tit_screen">SCREEN</span>

              <!-- 미니맵 -->
              <div class="minimap" id="stepOnePopupConMiniMap">
                <div class="seat_arer" style="width: 140.094px; height: 71.5938px;">
                  <!-- 좌석이미지 -->
                </div>
              </div>
            </div>
            <!-- //미니맵 -->
          </div>
          <!-- // -->
        </div>
      </div>
      <div class="group_bottom" id="stepOnePopupConMsg">
        <div class="txt_notice gr_15">
          <p class="tit">
            <span class="ic_grade gr_15">
              만 15세 이상 관람가
            </span>
            본 영화는 <strong>만 15세 이상 관람가</strong> 영화입니다.
          </p>
          <p class="txt">
            만 15세 미만의 고객님(영,유아 포함)은 반드시 부모님  또는 성인 보호자의 동반하에
            <br>
            관람이 가능합니다. 연령 확인 불가 시 입장이 제한 될 수 있습니다.
          </p>
        </div>
      </div>
    </div>
     <!-- 모달 안의 확인 창 -->
    <div class="btn_bottom_wrap" id="stepOnePopupConButton">
      <a href="#none" class="btn_col1 ty5">취소</a>
      <!-- 좌석 선택하는 페이지로 넘어감 -->
      <a href="javascript:void(0)" class="btn_col2 ty5" >인원/좌석선택</a>
    </div> 
  </div>
</div>


<!-- 푸터 -->
    <jsp:include page="../include/footer.jsp"/>
    
    <script></script>

    <!-- <script>
      console.log("JavaScript code is running");
      document.addEventListener('DOMContentLoaded', function() {
        function getCurrentDate() {
          const currentDate = new Date();
          const year = currentDate.getFullYear();
          const month = String(currentDate.getMonth() + 1).padStart(2, '0');
          const day = String(currentDate.getDate()).padStart(2, '0');
          return year + "-" + month + "-" + day;
        }
    
        function clearExistingDates() {
          const dateContainer = document.querySelector(".owl-stage");
          dateContainer.innerHTML = ''; // 기존의 날짜를 모두 삭제
        }
    
        function displayWeekDates() {
          clearExistingDates(); // 기존의 날짜를 삭제
    
          const currentDate = getCurrentDate();
          const days = ["일", "월", "화", "수", "목", "금", "토"];
          const dateContainer = document.querySelector(".owl-stage");
    
          for (let i = 0; i < 7; i++) {
            const dayDate = new Date(currentDate);
            dayDate.setDate(dayDate.getDate() + i);
            const dayMonth = dayDate.getMonth() + 1;
            const dayNum = String(dayDate.getDate()).padStart(2, '0');
            const dayIndex = dayDate.getDay();
            const dayName = i === 0 ? "오늘" : days[dayIndex];
    
            const newDateItem = document.createElement("div");
            newDateItem.className = "owl-item active";
            newDateItem.style.width = "52px";
            newDateItem.innerHTML = `
              <li class="item">
                <strong class="month">${dayMonth}월</strong>
                <a href="#none" class="date" tabindex="0">
                  <label for="radioDate${i}">
                    <input type="radio" id="radioDate${i}" name="radioDate1" data-displayn="Y" data-playdate="${dayDate.getFullYear()}-${dayMonth}-${dayNum}" data-isplaydate="Y" data-playweek="${dayName}">
                    <strong>${dayNum}</strong>
                    <em>${dayName}</em>
                  </label>
                </a>
              </li>
            `;
    
            dateContainer.appendChild(newDateItem);
          }
        }
    
        // Call the function to display dates
        displayWeekDates();
      });
    </script> -->
    
    
<!-- 자바스크립트 영역 -->

<script src="../js/ticket_main.js"></script>
<script src="../js/modal.js"></script>
<script src="../js/ticket_reverse.js"></script>





</body>
</html>