document.addEventListener("DOMContentLoaded", function() {

    const hidden_oder_history_row = document.querySelectorAll(".oder_history_row.hidden");
    const oder_history_show_next_button = document.getElementById("oder_history_show_next_button");
    const oder_history_ditail_btn = document.querySelectorAll('.oder_history_ditail_btn')
  
    let oder_history_rowIndex = 0; // 현재 표시할 요소의 인덱스

    function set_oder_history_show_next_button() {
      if(order_list.length <=10){
        oder_history_show_next_button.style.opacity = 0;
      }
      
    }
  set_oder_history_show_next_button()
    // 더보기 버튼 클릭 시 이벤트 핸들러
    oder_history_show_next_button.addEventListener("click", function () {
      if (oder_history_rowIndex < hidden_oder_history_row.length) {
        // 아직 표시되지 않은 요소가 남아 있다면 다음 요소를 표시합니다.
        for (let i = 0; i < 10; i++) {
        hidden_oder_history_row[oder_history_rowIndex].classList.remove("hidden");
        oder_history_rowIndex++;
  
        if (oder_history_rowIndex >= hidden_oder_history_row.length) {
          // 모든 요소가 표시된 경우, 더보기 버튼을 숨깁니다.
          oder_history_show_next_button.style.opacity = 0;
        }}}
      
    });

    oder_history_ditail_btn.forEach((button) => {
      button.addEventListener('click', () => {
        const choiceOrderCode = button.getAttribute('data-order');
        go_on_post_mapping(choiceOrderCode)
      });
    });

    function go_on_post_mapping(oder_code) {
    
      let form = document.createElement('form');
      
        // scheduleCode를 숨겨진 입력 필드로 추가
        let orderCodeSend = document.createElement('input');
        orderCodeSend.setAttribute('type', 'hidden');
        orderCodeSend.setAttribute('name', 'orderCode');
        orderCodeSend.setAttribute('value', oder_code);
        form.appendChild(orderCodeSend);
      
      
        form.setAttribute('method', 'post');
        form.setAttribute('action', '/order/detail');
        
        // 필요한 경우 데이터 유효성 검사 수행
      
        document.body.appendChild(form);
        form.submit();
    }

    
    

});