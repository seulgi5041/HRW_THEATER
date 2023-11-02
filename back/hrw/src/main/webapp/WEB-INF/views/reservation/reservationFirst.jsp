<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head><!--테스트용으로 오른족 상영시간쪽에 누르면 좌석으로 연결되도록해놨으니 추후 변경예정-->
<meta charset="UTF-8">
<title>HRW 예매페이지</title>

  <link rel="stylesheet" href="../css/common.css">
  <link rel="stylesheet" href="../css/ticket.css">
  <link rel="stylesheet" href="../css/modal.css">

  <!-- jQuery CDN 포함 -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
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
          <a href="#reverseStep01" id="seatSelectionLink">
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
                                        <a href="#none" cinema-code="${cinemaData.cinemaCode}">${cinemaData.cinemaName}</a>
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
                  <ul>
                    <li class="disabled">
                      <a href="#none">
                        <div class="group_infor">
                          <div class="bx_title">
                            <span class="ic_grade gr_all">
                              "0세 관람가"
                            </span>
                            <strong class="tit">30일</strong>
                          </div>
                        </div>
                      </a>
                    </li>

                    <li>
                      <a href="#none">
                        <div class="group_infor">
                          <div class="bx_title">
                            <span class="ic_grade gr_12">
                              "12세 관람가"
                            </span>
                            <strong class="tit">라라라라라</strong>
                          </div>
                        </div>
                      </a>
                    </li>

                    <li>
                      <a href="#none">
                        <div class="group_infor">
                          <div class="bx_title">
                            <span class="ic_grade gr_15">
                              "15세 관람가"
                            </span>
                            <strong class="tit">집에가고싶다</strong>
                          </div>
                        </div>
                      </a>
                    </li>

                    <li>
                      <a href="#none">
                        <div class="group_infor">
                          <div class="bx_title">
                            <span class="ic_grade gr_18">
                              "18세 관람가"
                            </span>
                            <strong class="tit">꿀복이보고싶다</strong>
                          </div>
                        </div>
                      </a>
                    </li>

                    
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
                        <strong class="month">10월</strong>
                        <a href="#none" class="date" tabindex="0">
                          <label for="radioDate0">
                            <input type="radio" id="radioDate0" name="radioDate1" data-displayn="Y" data-playdate="2023-10-18" data-isplaydate="Y" data-playweek="오늘" checked>
                            <strong>18</strong>
                            <em>오늘</em>
                          </label>
                        </a>
                      </li>
                    </div>
                    <div class="owl-item active" style="width: 52px;">
                      <li class="item">
                        <a href="#none" class="date" tabindex="0">
                          <label for="radioDate1">
                            <input type="radio" id="radioDate1" name="radioDate1" data-displayn="Y" data-playdate="2023-10-19" data-isplaydate="Y" data-playweek="목">
                            <strong>19</strong>
                            <em>목</em>
                          </label>
                        </a>
                      </li>
                    </div>
                    <div class="owl-item active" style="width: 52px;">
                      <li class="item">
                        <a href="#none" class="date" tabindex="0">
                          <label for="radioDate2">
                            <input type="radio" id="radioDate2" name="radioDate1" data-displayn="Y" data-playdate="2023-10-20" data-isplaydate="Y" data-playweek="금">
                            <strong>20</strong>
                            <em>금</em>
                          </label>
                        </a>
                      </li>
                    </div>
                    <div class="owl-item active" style="width: 52px;">
                      <li class="item">
                        <a href="#none" class="date" tabindex="0">
                          <label for="radioDate3">
                            <input type="radio" id="radioDate3" name="radioDate1" data-displayn="Y" data-playdate="2023-10-21" data-isplaydate="Y" data-playweek="토">
                            <strong>21</strong>
                            <em>토</em>
                          </label>
                        </a>
                      </li>
                    </div>
                    <div class="owl-item active" style="width: 52px;">
                      <li class="item">
                        <a href="#none" class="date" tabindex="0">
                          <label for="radioDate4">
                            <input type="radio" id="radioDate4" name="radioDate1" data-displayn="Y" data-playdate="2023-10-22" data-isplaydate="Y" data-playweek="일">
                            <strong>22</strong>
                            <em>일</em>
                          </label>
                        </a>
                      </li>
                    </div>
                    <div class="owl-item active" style="width: 52px;">
                      <li class="item">
                        <a href="#none" class="date" tabindex="0">
                          <label for="radioDate5">
                            <input type="radio" id="radioDate5" name="radioDate1" data-displayn="Y" data-playdate="2023-10-23" data-isplaydate="Y" data-playweek="월">
                            <strong>23</strong>
                            <em>월</em>
                          </label>
                        </a>
                      </li>
                    </div>
                    <div class="owl-item active" style="width: 52px;">
                      <li class="item">
                        <a href="#none" class="date" tabindex="0">
                          <label for="radioDate6">
                            <input type="radio" id="radioDate6" name="radioDate1" data-displayn="Y" data-playdate="2023-10-24" data-isplaydate="Y" data-playwee="화">
                            <strong>24</strong>
                            <em>화</em>
                          </label>
                        </a>
                      </li>
                    </div>
                    <div class="owl-item active" style="width: 52px;">
                      <li class="item">
                        <a href="#none" class="date" tabindex="0">
                          <label for="radioDate7">
                            <input type="radio" id="radioDate7" name="radioDate1" data-displayn="Y" data-playdate="2023-10-25" data-isplaydate="Y" data-playweek="수">
                            <strong>25</strong>
                            <em>수</em>
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
      <a href="/reservation/second" class="btn_col2 ty5">인원/좌석선택</a>
    </div> 
  </div>
</div>


<!-- 푸터 -->
    <jsp:include page="../include/footer.jsp"/>
    
    
<!-- 자바스크립트 영역 -->

<script src="../js/ticket_main.js"></script>
<script src="../js/modal.js"></script>
<script src="../js/ticket_reverse.js"></script>


<script>
  $(document).ready(function() {
  // Ajax로 백엔드에 정의되어 있는 로컬과 지점명, 코드 요청하기
  $.ajax({
    type: "GET",
    url: "/cinema/getAllLocalAndCinemaNames", //컨트롤러에 있는 엔드포인트 입력
    success: function(data) {
      // 서버에서 수신한 데이터를 처리하는 곳을 선언
      var localData = data;

      //백에서 쿼리문을 작성하였지만, 이곳에서 다시 한번 정의해줘야 순서대로 들어감
      var desiredOrder = [
        "서울", "경기", "인천", "부산", "대구", "광주", "대전", "울산", "세종", "강원", "충청", "전라", "경상", "제주"
      ];
      localData = sortLocalData(localData, desiredOrder);

      // 보여줘야 하는 부분
      var menuContainer = $(".tab_container .cinema_select_wrap ul");

      //lidepth1을 누르기 전에는 active가 없음
      var activeDepth2 = null;

      // 스타일 지정한 부분과 백엔드에 있던 로컬, 지점, 코드를 불러오는 구간
      for (var local in localData) {
        var localItem = $("<li>").addClass("depth1");
        var localLink = $("<a>").attr("href", "javascript:void(0)").text(local);

        var submenu = $("<div>").addClass("depth2").css("display", "none");

        //지역선택 쪽에 표시될 로컬명들
        localLink.click(function() {
          var localName = $(this).text();
          var cinemaNames = localData[localName];
          //console.log("지점명을 모두 출력 " + localName + ":", cinemaNames);

          $(".depth1, .depth2 li").removeClass("active");
          var depth1 = $(this).parent();
          depth1.addClass("active");

          // Reset the previously active depth2
          if (activeDepth2) {
            activeDepth2.css("display", "none");
          }

          var depth2 = $(this).next(".depth2");
          depth2.css("display", "block");

          // depth1을 클릭하고 나면 depth2로 넘어감
          activeDepth2 = depth2;

        });
        localItem.append(localLink);

        // depth2의 ul 태그를 다시 생성
        var submenuList = $("<ul>");

        // depth2에 들어갈 지점명과 지점코드를 나누는 부분
        localData[local].forEach(function(cinemaName) {
          var parts = cinemaName.split(',');
          var cinemaName = parts[0].trim();
          var cinemaCode = parts[1].trim();

          var cinemaLink = $("<a>")
            .attr("href", "#none")
            .attr("cinema-code", cinemaCode) // Add cinema-code attribute
            .text(cinemaName);

          var submenuItem = $("<li>").append(cinemaLink);
          submenuList.append(submenuItem);

        });
        //depth2의 li에 보여줄 내용들
        submenu.append(submenuList);
        localItem.append(submenu);
        menuContainer.append(localItem);
      }

      
      //depth2를 선택했을때 작동될 이벤트들과 지점코드, 지점명을 다시 나눠 출력해주는 부분
      //위에서 ul이 새로 생성되었기 때문에 다시 이벤트를 등록한 것이다
      var depth2Select1 = $(".depth2 ul li");
      depth2Select1.click(function() {
        depth2Select1.removeClass("active");
        $(this).addClass("active");
        var cinemaLink = $(this).find("a");
        var cinemaName = cinemaLink.text();
        var cinemaCode = cinemaLink.attr("cinema-code");


        console.log("Cinema Name:", cinemaName);
        console.log("Cinema Code:", cinemaCode);
      });
    },
    error: function(xhr, status, error) {
      console.error("Error: " + error);
    }
  });
});


/* 레포지토리에 쿼리문으로 order by로 했지만,
* Ajax에서 가져오는 과정에서 로컬의 순서를 다시 바꿔줘야 함
*/
function sortLocalData(localData, desiredOrder) {
  var sortedData = {};
  for (var i = 0; i < desiredOrder.length; i++) {
    var local = desiredOrder[i];
    if (localData[local]) {
      sortedData[local] = localData[local];
      delete localData[local];
    }
  }

  // 순서대로 위치를 추가한 후에 sortedData로 반환해준다
  for (var local in localData) {
    sortedData[local] = localData[local];
  }

  return sortedData;
}



</script>
</body>
</html>