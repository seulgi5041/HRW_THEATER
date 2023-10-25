document.addEventListener("DOMContentLoaded", function() {

    const hidden_oder_history_row = document.querySelectorAll(".oder_history_row.hidden");
    const oder_history_show_next_button = document.getElementById("oder_history_show_next_button");
  
    let oder_history_rowIndex = 0; // 현재 표시할 요소의 인덱스
  
    // 더보기 버튼 클릭 시 이벤트 핸들러
    oder_history_show_next_button.addEventListener("click", function () {
      if (oder_history_rowIndex < hidden_oder_history_row.length) {
        // 아직 표시되지 않은 요소가 남아 있다면 다음 요소를 표시합니다.
        for (let i = 0; i < 10; i++) {
        hidden_oder_history_row[oder_history_rowIndex].classList.remove("hidden");
        oder_history_rowIndex++;
  
        if (oder_history_rowIndex >= hidden_oder_history_row.length) {
          // 모든 요소가 표시된 경우, 더보기 버튼을 숨깁니다.
          oder_history_show_next_button.style.display = "none";
        }}}
      
    });

});