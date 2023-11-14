document.addEventListener("DOMContentLoaded", function() {

  const go_order_detail_btn = document.getElementById('go_order_detail_btn')

  go_order_detail_btn.addEventListener('click', function(){
     let oder_code = go_order_detail_btn.getAttribute('data-ordercode');
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
   
  });

});