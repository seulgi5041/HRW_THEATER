document.addEventListener("DOMContentLoaded", function() {

  /* 클릭한 도큐먼트에게만 choice클래스 추가하기위해 choice클래스 가진것들 없애기*/
  function choice_class_reset() {
    const have_choice_class = document.querySelectorAll('.choice')
    have_choice_class.forEach(element => {
      element.classList.remove('choice');
  });
  }

  function choice_company_class_reset() {
    const have_choice_class = document.querySelectorAll('.choice_company')
    have_choice_class.forEach(element => {
      element.classList.remove('choice_company');
  });
  }
  
  document.querySelector('.case1').addEventListener('click', function() {
    // "신용카드" 버튼 클릭 시
    // "article_pay_card" 메뉴를 표시하고 "article_pay_simple" 메뉴를 숨깁니다
    document.querySelector('.article_pay_card').style.display = 'block';
    document.querySelector('.article_pay_simple').style.display = 'none';
    document.querySelector('.group_item').classList.remove('active');
    choice_class_reset();
    this.classList.add('choice');
  });

  document.querySelector('.case2').addEventListener('click', function() {
    // "간편결제" 버튼 클릭 시
    // "article_pay_simple" 메뉴를 표시하고 "article_pay_card" 메뉴를 숨깁니다
    document.querySelector('.article_pay_simple').style.display = 'block';
    document.querySelector('.article_pay_card').style.display = 'none';
    document.querySelector('.group_item').classList.remove('active');
    choice_class_reset();
    this.classList.add('choice');
  });

  document.querySelector('.case3').addEventListener('click', function() {
    // "무통장입금" 버튼 클릭 시
    // "article_pay_card"와 "article_pay_simple" 메뉴를 숨깁니다
    document.querySelector('.article_pay_card').style.display = 'none';
    document.querySelector('.article_pay_simple').style.display = 'none';
    document.querySelector('.group_item').classList.add('active');
    choice_class_reset();
    choice_company_class_reset();
    this.classList.add('choice');
  });

  document.querySelector('.case4').addEventListener('click', function() {
    // "휴대폰" 버튼 클릭 시
    // "article_pay_card"와 "article_pay_simple" 메뉴를 숨깁니다
    document.querySelector('.article_pay_card').style.display = 'none';
    document.querySelector('.article_pay_simple').style.display = 'none';
    document.querySelector('.group_item').classList.add('active');
    choice_class_reset();
    choice_company_class_reset();
    this.classList.add('choice');
  });

  const elementsWithDataPaycompany = document.querySelectorAll('[data-paycompany]');
  elementsWithDataPaycompany.forEach(paycompany => {
    paycompany.addEventListener('click', function(){
      choice_company_class_reset();
    paycompany.classList.add("choice_company");
    const choice_company = paycompany.getAttribute('data-paycompany');
    console.log(choice_company)
    })
    
  });

  /* 메인 약관을체크하면 나머지도 다 체크되게하기*/

  const chkSavingTerm = document.getElementById('chkSavingTerm');

  // 다른 약관 동의 체크박스들
  const chkProvisionTerm01 = document.getElementById('chkProvisionTerm01');
  const chkProvisionTerm02 = document.getElementById('chkProvisionTerm02');
  const chkProvisionTerm03 = document.getElementById('chkProvisionTerm03');
  const chkProvisionTerm04 = document.getElementById('chkProvisionTerm04');
  
  // 결제대행 서비스 약관 동의 체크박스 상태가 변경될 때 이벤트 핸들러 추가
  chkSavingTerm.addEventListener('change', function() {
      // 만약 결제대행 서비스 약관 동의 체크박스가 체크되면
      if (chkSavingTerm.checked) {
          // 나머지 약관 동의 체크박스들도 모두 체크
          chkProvisionTerm01.checked = true;
          chkProvisionTerm02.checked = true;
          chkProvisionTerm03.checked = true;
          chkProvisionTerm04.checked = true;
      } else {
          // 결제대행 서비스 약관 동의 체크박스가 체크 해제되면
          // 나머지 약관 동의 체크박스들도 모두 체크 해제
          chkProvisionTerm01.checked = false;
          chkProvisionTerm02.checked = false;
          chkProvisionTerm03.checked = false;
          chkProvisionTerm04.checked = false;
      }
  });


  /*정보 포스트로 보내기*/
  function go_on_post_mapping(choice_pay_info) {
    let form = document.createElement('form');
    
    let choice_pay_info_input = document.createElement('input');
    choice_pay_info_input.setAttribute('type', 'hidden');
    choice_pay_info_input.setAttribute('name', 'pay_info');
    choice_pay_info_input.setAttribute('value', JSON.stringify(choice_pay_info));
    form.appendChild(choice_pay_info_input);
  
    form.setAttribute('method', 'post');
    form.setAttribute('action', '/reservation/paymentCheck');
    
    // 필요한 경우 데이터 유효성 검사 수행
  
    document.body.appendChild(form);
    form.submit();
  }


  /*결제버튼클릭시 이벤트 */
  function check_to_check_box(){
    const checkboxes = document.querySelectorAll('input[type="checkbox"]');
    
    for (const checkbox of checkboxes) {
        if (!checkbox.checked) {
            return false; // 하나라도 체크되지 않은 경우 false 반환
        }
    }
    
    return true; // 모든 체크박스가 체크된 경우 true 반환
  }

    function check_to_pay_info() {
    const choice_payment_element = document.querySelector('.choice');

    if(choice_payment_element !== null){
     const choice_payment = choice_payment_element.getAttribute('data-payment');
      var choice_company = "정보없음";
    if(choice_payment==='카드' ||choice_payment==='간편결제'){
    const choice_company_element = document.querySelector('.choice_company');
    if(choice_company_element !== null){
    choice_company = choice_company_element.getAttribute('data-paycompany');}
    else{alert("카드사 또는 결제사를 선택해주세요"); return;}
    }else if(!check_to_check_box()){
      alert("모든 약관에 동의가 필요합니다.")
      return;
    }
    const choice_pay_info={
      '결제방법' : choice_payment,
      '결제사' : choice_company
    }
    sessionStorage.clear();
    go_on_post_mapping(choice_pay_info);


  }else{alert("결제 방법을 선택해주세요");}
     
  }


    const next_page_btn = document.getElementById('next_page_btn');
    next_page_btn.addEventListener('click',function() {
      check_to_pay_info();
    })

  
  
  
});