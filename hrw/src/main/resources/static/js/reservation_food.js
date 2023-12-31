document.addEventListener("DOMContentLoaded", function() {

  var food_info_setting = [
      {
      '이름' : "더블콤보",
      '구매 가격' : 0,
      '수량' : 0
  },{
      '이름' : "라지콤보",
      '구매 가격' : 0,
      '수량' : 0
  },{
      '이름' : "스몰콤보",
      '구매 가격' : 0,
      '수량' : 0
  },{
      '이름' : "HRW콤보",
      '구매 가격' : 0,
      '수량' : 0
  },{
      '이름' : "팝콘(M) 오리지널",
      '구매 가격' : 0,
      '수량' : 0
  },{
      '이름' : "팝콘(L) 오리지널",
      '구매 가격' : 0,
      '수량' : 0
  },{
      '이름' : "팝콘(M) 카라멜",
      '구매 가격' : 0,
      '수량' : 0
  },{
      '이름' : "팝콘(L) 카라멜",
      '구매 가격' : 0,
      '수량' : 0
  },{
      '이름' : "반반팝콘(오리지널/카라멜)L",
      '구매 가격' : 0,
      '수량' : 0
  },{
      '이름' : "콜라(M)",
      '구매 가격' : 0,
      '수량' : 0
  },{
      '이름' : "콜라(L)",
      '구매 가격' : 0,
      '수량' : 0
  },{
      '이름' : "사이다(M)",
      '구매 가격' : 0,
      '수량' : 0
  },{
      '이름' : "사이다(L)",
      '구매 가격' : 0,
      '수량' : 0
  },{
      '이름' : "아메리카노(ICE)",
      '구매 가격' : 0,
      '수량' : 0
  },{
      '이름' : "아메리카노(HOT)",
      '구매 가격' : 0,
      '수량' : 0
  },{
      '이름' : "칠리치즈나쵸",
      '구매 가격' : 0,
      '수량' : 0
  },{
      '이름' : "플레인핫도그",
      '구매 가격' : 0,
      '수량' : 0
  },{
      '이름' : "치즈핫도그",
      '구매 가격' : 0,
      '수량' : 0
  },{
      '이름' : "맛밤",
      '구매 가격' : 0,
      '수량' : 0
  },{
      '이름' : "땅콩버터오징어",
      '구매 가격' : 0,
      '수량' : 0
  }

];
  const storedData = sessionStorage.getItem('food_info_setting');
  
  if(storedData){
      food_info_setting = JSON.parse(storedData);
  };
  
  

  

const food_price_info =[
  {
      '이름' : "더블콤보",
      '가격' : 13000,
      '이미지명' : "double_combo"
  },{
      '이름' : "라지콤보",
      '가격' : 15000,
      '이미지명' : "large_combo"
  },{
      '이름' : "스몰콤보",
      '가격' : 7000,
      '이미지명' : "small_combo"
  },{
      '이름' : "HRW콤보",
      '가격' : 10000,
      '이미지명' : "hrw_combo"
  },{
      '이름' : "팝콘(M) 오리지널",
      '가격' : 5000,
      '이미지명' : "single_popcorn"
  },{
      '이름' : "팝콘(L) 오리지널",
      '가격' : 5500,
      '이미지명' : "double_popcorn"
  },{
      '이름' : "팝콘(M) 카라멜",
      '가격' : 6000,
      '이미지명' : "single_sweet_popcorn"
  },{
      '이름' : "팝콘(L) 카라멜",
      '가격' : 6500,
      '이미지명' : "double_sweet_popcorn"
  },{
      '이름' : "반반팝콘(오리지널/카라멜)L",
      '가격' : 6500,
      '이미지명' : "half_popcorn"
  },{
      '이름' : "콜라(M)",
      '가격' : 2500,
      '이미지명' : "coke_M"
  },{
      '이름' : "콜라(L)",
      '가격' : 3000,
      '이미지명' : "coke_L"
  },{
      '이름' : "사이다(M)",
      '가격' : 2500,
      '이미지명' : "cider_M"
  },{
      '이름' : "사이다(L)",
      '가격' : 3000,
      '이미지명' : "cider_L"
  },{
      '이름' : "아메리카노(ICE)",
      '가격' : 4000,
      '이미지명' : "coffee_ice"
  },{
      '이름' : "아메리카노(HOT)",
      '가격' : 3500,
      '이미지명' : "coffee_hot"
  },{
      '이름' : "칠리치즈나쵸",
      '가격' : 4900,
      '이미지명' : "nachos"
  },{
      '이름' : "플레인핫도그",
      '가격' : 4500,
      '이미지명' : "origin_hotdog"
  },{
      '이름' : "치즈핫도그",
      '가격' : 5000,
      '이미지명' : "cheese_hotdog"
  },{
      '이름' : "맛밤",
      '가격' : 3500,
      '이미지명' : "chestnut"
  },{
      '이름' : "땅콩버터오징어",
      '가격' : 3500,
      '이미지명' : "squidwithbutter"
  }
];

//세션있을경우 span 이 있는만큼이미 변경되게하기 

function updateQuantities() {
  const foodBoxes = document.querySelectorAll('.food_box');
  foodBoxes.forEach(foodBox => {
      const productName = foodBox.getAttribute('data-product');
      const sumElement = foodBox.querySelector('.sum span');
      const foodInfo = food_info_setting.find(item => item['이름'] === productName);
      
      if (foodInfo) {
          // '수량' 값을 가져와 화면에 표시
          sumElement.textContent = foodInfo['수량'].toString();
      }
  });
}

// 초기 페이지 로딩 시 수량 업데이트
updateQuantities();
set_side_step01(food_info_setting);
set_all_price(food_info_setting);

//마이너스 버튼을 누르면 수량 감소(0밑으로는 비활성화)
const minusButtons = document.querySelectorAll(".minus-button");
 const plusButtons = document.querySelectorAll(".plus-button");

//  마이너스 버튼을 누르면 수량 감소(0밑으로는 비활성화)
   minusButtons.forEach((button) => {
     button.addEventListener("click", () => {
   const span = button.nextElementSibling;
  let count = parseInt(span.innerText);
  const product_name = button.closest('article').getAttribute('data-product');
     if (count > 0) {
       count--;
      span.innerText = count;
      food_info_count_setting(count,product_name);
     }
    
     
    button.disabled = count === 0;
  });
});

 //플러스 버튼을 누르면 수량 증가
 plusButtons.forEach((button) => {
  
   button.addEventListener("click", () => {
  const product_name = button.closest('article').getAttribute('data-product');
    const span = button.previousElementSibling;
     let count = parseInt(span.innerText);
     count++;
   span.innerText = count;
   food_info_count_setting(count,product_name);
  button.previousElementSibling.previousElementSibling.disabled = count === 0;
   });
 });


 //플러스마이너스버튼클릭시 food_info_setting에 추가

 function food_info_count_setting(count, product_name) {
  const choice_food = food_info_setting.find(item => item['이름'] === product_name);
const choice_food_price = food_price_info.find(item => item['이름'] === product_name);

if (choice_food && choice_food_price) {
  choice_food['수량'] = count;
  choice_food['구매 가격'] = count * choice_food_price['가격'];
  
} else {
  console.log('배열에서 제품을 찾지 못하거나 가격이 없습니다.');
}
console.log(food_info_setting);

 }

 

 // add버튼클릭시 금액에합산, 사이드에 정보보내기

 function set_side_step01(food_info_setting) {
  const choice_food_info = food_info_setting.filter(item => item['수량'] !== 0);
  

  // 음식 정보를 담고 있는 <dl> 요소에 접근
  const dlElement = document.querySelector('li.step01.active dl');

  // <dd> 요소들을 모두 삭제
  const ddElements = dlElement.querySelectorAll('dd');
  ddElements.forEach(ddElement => {
      dlElement.removeChild(ddElement);
  });

  // 선택한 음식 정보에 따라 <dd> 요소 생성
  for (let i = 0; i < choice_food_info.length; i++) {
      const ddElement = document.createElement('dd');
      const spanElement = document.createElement('span');
      let foodInfo = choice_food_info[i];
      spanElement.textContent = `${foodInfo.이름}, 수량: ${foodInfo.수량}, 가격: ${foodInfo['구매 가격']}원`;
      spanElement.id = 'preview_store_info';
      ddElement.appendChild(spanElement);
      dlElement.appendChild(ddElement);
  };
 };

 function set_all_price(food_info_setting) {
  const choice_food_info = food_info_setting.filter(item => item['수량'] !== 0);
  let totalPrice = choice_food_info.reduce((total, item) => total + item['구매 가격'], 0);
  document.getElementById("total_choice_food_price").textContent=totalPrice;
 };


 const add_count_btns = document.querySelectorAll(".add_count_btn");
 add_count_btns.forEach((button)=>{
  button.addEventListener("click", () =>{
  sessionStorage.setItem('food_info_setting', JSON.stringify(food_info_setting));
  
  set_side_step01(food_info_setting);
  set_all_price(food_info_setting);
  });

 });

/*다음버튼으로 보내기 post로 상품, 수량 가격 보내기 */


const link_rpay_btn = document.getElementById('link_pay');

link_rpay_btn.addEventListener("click", () => {
  let choice_food_info = food_info_setting.filter(item => item['수량'] !== 0);

  if (choice_food_info.length === 0) {
      // choice_food_info가 비어있을 경우 기본값으로 설정
      choice_food_info = [{
          '이름': "주문정보없음",
          '구매 가격': 0,
          '수량': 0 ,
          "이미지명" : "no_data"
      }];
  }
  
  for (let item of choice_food_info) {
      const matchingItem = food_price_info.find(info => info['이름'] === item['이름']);
      if (matchingItem) {
          item['이미지명'] = matchingItem['이미지명'];
      }
  }
  
  console.log(choice_food_info)
//sessionStorage.clear();
/*나중에 완전결제 완료시 클리어되도록 변경예정 */
go_on_post_mapping(choice_food_info);
});

function go_on_post_mapping(choice_food_info) {
let form = document.createElement('form');
form.setAttribute('method', 'post');
form.setAttribute('action', '/reservation/payment');

let food_info_input = document.createElement('input');
food_info_input.setAttribute('type', 'hidden');
food_info_input.setAttribute('name', 'choice_food_info');
food_info_input.setAttribute('value', JSON.stringify(choice_food_info));
form.appendChild(food_info_input);

document.body.appendChild(form);
form.submit();
}

});