$(document).ready(function() {
  window.localData = {};  //// JSP 파일에서 localData를 전역 변수로 선언
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

    // 이제 DOM 요소를 선택하고 이벤트를 등록하는 함수를 호출
    selectAndRegisterEvents(localData);
  },
  error: function(xhr, status, error) {
    console.error("Error: " + error);
  }
});
});




// DOM 요소를 선택하고 이벤트를 등록하는 함수(기존의 자바스크립트 구현을 가져오는 구간)
function selectAndRegisterEvents(localData) {
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
      .attr("href", '/cinema/movies?cinemaCode=' + cinemaCode)
      .attr("cinema-code", cinemaCode) // Add cinema-code attribute
      .text(cinemaName);

    var submenuItem = $("<li>").append(cinemaLink);
    submenuList.append(submenuItem);

    cinemaLink.click(function(e) {
      e.preventDefault();  // 기본 앵커 태그 동작 방지
      var cinemaCode = $(this).attr("cinema-code");

      // 중복 내용 지운 영화제목이 들어가는 곳을 지정
      var SelectTitles = new Set();

      // 선택한 영화관의 영화 데이터를 가져오려는 AJAX 요청
      $.ajax({
        url: '/cinema/movies?cinemaCode=' + cinemaCode,
        method: 'GET',
        success: function(data) {
            // 영화 데이터의 JSON 배열(data)
            $('#movie-list-container').empty(); // 영화 데이터가 들어갈 요소(여기선 ul임)를 먼저 지움
            $.each(data, function(index, movie) {
                // 목록에 영화목록을 만들기
                if (!SelectTitles.has(movie.title)) {
                  // 중복된 제목이 아니라면 영화 목록에 추가
                  var movieItem = $("<li><a href='#'><div class='group_infor'><div class='bx_title'><span class='ic_grade " + movie.rating + "'></span><strong class='tit' movie-code='" + movie.movieCode + "'>" + movie.title + "</strong></div></div></a></li>");
                  $('#movie-list-container').append(movieItem);

                  // 클릭 이벤트 핸들러를 해당 li에 추가
                  movieItem.click(function() {
                    console.log("Selected Movie:", movie.title);
                    movieListContainer.find("li").removeClass("active");
                    $(this).addClass("active");
                    // 클릭된 영화의 movieCode 값을 selectedMovieCode에 저장
                    var clickedMovieCode = $(this).find('.tit').attr('movie-code');
                    selectedMovieCode = clickedMovieCode; 
                    console.log("Movie Code:", selectedMovieCode);
                  });

                  $('#movie-list-container').append(movieItem);

          
                  // 중복을 제거한 영화 제목을 Set에 추가
                  SelectTitles.add(movie.title);
                }
            });
        },
        error: function(xhr, status, error) {
          console.error("Error: " + error);
        }
      });
    });
 });
  //depth2의 li에 보여줄 내용들
  submenu.append(submenuList);
  localItem.append(submenu);
  menuContainer.append(localItem);
}


/**
 * //////////////////////////////
 */

// 선택한 영화 제목을 저장하는 변수
var selectedMovieTitle = "";
var selectedMovieCode = "";
// depth2를 선택했을때 작동될 이벤트들과 지점코드, 지점명을 다시 나눠 출력해주는 부분
// 위에서 ul이 새로 생성되었기 때문에 다시 이벤트를 등록한 것이다
var depth2Select1 = $(".depth2 ul li");
depth2Select1.click(function() {
  depth2Select1.removeClass("active");
  $(this).addClass("active");
  var cinemaLink = $(this).find("a");
  var cinemaName = cinemaLink.text();
  var cinemaCode = cinemaLink.attr("cinema-code");

  console.log("Cinema Name:", cinemaName);
  console.log("Cinema Code:", cinemaCode);

  // 중복 내용 지운 영화제목이 들어가는 곳을 지정
  var DistinctTitle = new Set();
  var movieListContainer = $('#movie-list-container'); 
  movieListContainer.empty(); //
  // 선택한 영화관의 영화 데이터를 가져오려는 AJAX 요청
  $.ajax({
    url: '/cinema/movies?cinemaCode=' + cinemaCode,
    method: 'GET',
    success: function(data) {
        // 영화 데이터의 JSON 배열(data)
        $('#movie-list-container').empty(); // 영화 데이터가 들어갈 요소(여기선 ul임)를 먼저 지움
        $.each(data, function(index, movie) {
          var movieCode = movie.movieCode;
            // 목록에 영화목록을 만들기
            if (!DistinctTitle.has(movie.title)) {
              // 중복된 제목이 아니라면 영화 목록에 추가
              var movieItem = $("<li><a href='#'><div class='group_infor'><div class='bx_title'><span class='ic_grade " + movie.rating + "'></span><strong class='tit' movie-code='" + movie.movieCode + "'>" + movie.title + "</strong></div></div></a></li>");
              $('#movie-list-container').append(movieItem);
      


              // 클릭 이벤트 핸들러를 해당 li에 추가
              movieItem.click(function(e) {
                e.preventDefault(); // 기본 앵커 태그 동작 방지

                console.log("Selected Movie:", movie.title);
                movieListContainer.find("li").removeClass("active");
                $(this).addClass("active");
                // 클릭된 영화의 movieCode 값을 selectedMovieCode에 저장
                var clickedMovieCode = $(this).find('.tit').attr('movie-code');
                selectedMovieCode = clickedMovieCode; 
                console.log("Movie Code:", selectedMovieCode);




                // 선택된 영화 정보를 업데이트
                var selectedMovieTitle = movie.title; // 선택한 영화 제목
                var selectedMovieRating = movie.rating; // 선택한 영화 등급
                ///////////////////////나중에 변경해야 할 부분
                // 숨기고자 하는 div 요소
                var noticeDiv = $(".box_notice");
                var timeSelectTitle = $(".time_select_title strong");
                var timeSelectGrade = $(".time_select_title span.ic_grade");

                // 선택된 영화와 극장을 확인하여 숨김 처리
                if (selectedMovieCode !== null && cinemaCode !== null) {
                  noticeDiv.hide(); // "box_notice" 숨기기
                  $(".group_time_select").show(); // "group_time_select" 보이기
            
                  // 영화 정보 업데이트
                  timeSelectTitle.text(selectedMovieTitle);
                  timeSelectGrade.attr("class", "ic_grade " + selectedMovieRating); // 예상 클래스 이름을 업데이트 (클래스명에 따라 다를 수 있음)
                } else {
                  noticeDiv.show(); // "box_notice" 나타내기
                  $(".group_time_select").hide(); // "group_time_select" 숨기기
                }
         
              });

              $('#movie-list-container').append(movieItem);


              // 중복을 제거한 영화 제목을 Set에 추가
              DistinctTitle.add(movie.title);

              // 사용자가 선택한 영화를 업데이트
              selectedMovieTitle = movie.title;
            }
        });
    },
    error: function(xhr, status, error) {
      console.error("Error: " + error);
    }
  });
 });
}


/* 레포지토리에 쿼리문으로 order by로 했지만,
* Ajax에서 가져오는 과정에서 로컬의 순서를 다시 바꿔줘야 함
*/
function sortLocalData(localData, desiredOrder) {
var sortedData = {};

//기존의 행정구역을 북/남으로 바꾸기
var localMapping = {
  "충청": "충북/충남",
  "전라": "전북/전남",
  "경상": "경북/경남",
};


//로컬 이름의 원하는 순서가 포함된 배열을 반복
for (var i = 0; i < desiredOrder.length; i++) {
    var local = desiredOrder[i];   //로컬 이름을 검색
    if (localData[local]) {   //항목이 존재하는 경우 매핑, 정렬
      var mappedLocal = localMapping[local] || local; //북/남으로 매핑한 내용의 로컬이 존재하는 경우 매핑된 이름을 사용. 아니면 원래 이름 사용 
      
      //매핑된 로컬 이름을 키로 사용, 해당 로컬 데이터를 localData값으로 사용하여 객체에 저장
      sortedData[mappedLocal] = localData[local];
      delete localData[local];  //중복을 피하기 위해 원래 로컬 이름을 사용하고, 객체 에서 제거
    }
  }

 // 매핑된 이름을 집어넣기
for (var local in localData) {
  var mappedLocal = localMapping[local] || local;  //현재 로컬 이름에 대한 매핑이 있는지 확인
  sortedData[mappedLocal] = localData[local];
  //정렬된 데이터는 sortedData에 매핑된 로컬 이름을 키로 사용, 객체의 해당 로컬 데이터를 localData값으로 사용하여 객체에 저장
}

return sortedData;
}