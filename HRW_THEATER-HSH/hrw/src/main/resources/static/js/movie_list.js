document.addEventListener("DOMContentLoaded", function () {
  // 페이지 로딩이 완료되면 실행

  const hidden_Movielist_row = document.querySelectorAll(".movielist_movieposter_row.hidden");
  const Movielist_show_next_button = document.getElementById("movielist_show_next_button");

  let Movielist_rowIndex = 0; // 현재 표시할 요소의 인덱스

  // 더보기 버튼 클릭 시 이벤트 핸들러
  Movielist_show_next_button.addEventListener("click", function () {
    if (Movielist_rowIndex < hidden_Movielist_row.length) {
      // 아직 표시되지 않은 요소가 남아 있다면 다음 요소를 표시합니다.
      hidden_Movielist_row[Movielist_rowIndex].classList.remove("hidden");
      Movielist_rowIndex++;

      if (Movielist_rowIndex === hidden_Movielist_row.length) {
        // 모든 요소가 표시된 경우, 더보기 버튼을 숨깁니다.
        Movielist_show_next_button.style.display = "none";
      }
    }
  });


  var movie_ticketing = document.querySelectorAll(".movie_ticketing");

  // 각 버튼에 대한 클릭 이벤트 핸들러를 추가합니다.
  movie_ticketing.forEach(function(button) {
      button.addEventListener("click", function() {
          alert("확인");
          console.log("버튼이 클릭되었습니다.");
      });
  });


});