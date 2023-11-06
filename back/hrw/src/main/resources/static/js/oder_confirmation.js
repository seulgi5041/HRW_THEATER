document.addEventListener("DOMContentLoaded", function() {

  /*구매한음식가져오기 */
function set_food_info(){
  const xhr = new XMLHttpRequest();
  xhr.open("POST", "/choiceFoodOrder", true);

  // HTTP 요청 헤더 설정
  xhr.setRequestHeader("Content-Type", "application/json");

  xhr.onload = function() {
    if (xhr.status === 200) {
      const response = JSON.parse(xhr.responseText);

      displayFoodOrderInfo(response);
      
    } else {
      alert("서버 오류가 발생했습니다.");
    }
  };

  // 데이터를 JSON 문자열로 변환하여 body에 설정
  const data = JSON.stringify({ choice_order_code: choice_order_code });

  xhr.send(data);
}

function displayFoodOrderInfo(foodOrderEntityList) {
  const food_no_order = document.getElementById('food_no_order');
  const oder_food_price_sum = document.querySelectorAll('.oder_food_price_sum');
 if(foodOrderEntityList.length === 0){
  oder_food_price_sum.forEach(function(element) {
    element.classList.add("hidden");
  });
 }else{
  foodOrderEntityList.forEach(function(foodOrder) {
    food_no_order.classList.add("hidden");

    const oder_food_container_info = document.getElementById("oder_food_container_info");

    const oder_food_container_cell = document.createElement("div");
    oder_food_container_cell.className = "oder_food_container_cell";

    const oder_food_container_cell_img = document.createElement("div");
    oder_food_container_cell_img.className = "oder_food_container_cell_img";

    const food_cell_image = document.createElement("img");
    food_cell_image.src = `../images/store/product/${foodOrder.foodImgName}.png`;
    food_cell_image.alt = foodOrder.foodImgName;

    oder_food_container_cell_img.appendChild(food_cell_image);
    oder_food_container_cell.appendChild(oder_food_container_cell_img);

    const oder_food_info = document.createElement("div");
    oder_food_info.className = "oder_food_info";

    const oder_food_info_description = document.createElement("p");
    oder_food_info_description.innerText = foodOrder.foodDescription;

    oder_food_info.appendChild(oder_food_info_description)

    const oder_food_name = document.createElement("div");
    oder_food_name.className = "oder_food_name";

    const oder_food_info_name = document.createElement("h4");
    oder_food_info_name.innerText = foodOrder.foodNameStr;
    console.log(foodOrder.foodNameStr)

    oder_food_name.appendChild(oder_food_info_name)
    oder_food_info.appendChild(oder_food_name)

    const oder_food_basket = document.createElement("div");
    oder_food_basket.className = "oder_food_basket";

    const oder_food_quantity = document.createElement("div");
    oder_food_quantity.className = "oder_food_quantity";

    const oder_food_food_count = document.createElement("span");
    oder_food_food_count.innerText = foodOrder.foodCount;

    oder_food_quantity.appendChild(oder_food_food_count)
    oder_food_basket.appendChild(oder_food_quantity)

    const oder_food_price = document.createElement("div");
    oder_food_price.className = "oder_food_price";

    const oder_food_food_cost = document.createElement("span");
    oder_food_food_cost.innerText = foodOrder.foodPrice;

    const oder_food_food_cost_em = document.createElement("em");
    oder_food_food_cost_em.innerText = '원';

    oder_food_food_cost.appendChild(oder_food_food_cost_em)
    oder_food_price.appendChild(oder_food_food_cost)
    oder_food_basket.appendChild(oder_food_price)
    oder_food_info.appendChild(oder_food_basket)

    const oder_food_basket_check = document.createElement("div");
    oder_food_basket_check.className = "oder_food_basket_check";

    const oder_food_quantity_check = document.createElement("div");
    oder_food_quantity_check.className = "oder_food_quantity";

    const oder_food_minusbutton = document.createElement("button");
    oder_food_minusbutton.className = "oder_food_minusbutton";

    const oder_food_minusbutton_img = document.createElement("img");
    oder_food_minusbutton_img.src = "../images/store/minus.png";
    oder_food_minusbutton_img.alt = "minus";

    oder_food_minusbutton.appendChild(oder_food_minusbutton_img)
    oder_food_quantity_check.appendChild(oder_food_minusbutton)

    const oder_food_food_count_check = document.createElement("span");
    oder_food_food_count_check.setAttribute("data-price", foodOrder.foodCost);
    oder_food_food_count_check.innerText = foodOrder.foodCount;

    oder_food_quantity_check.appendChild(oder_food_food_count_check)

    const oder_food_plusbutton = document.createElement("button");
    oder_food_plusbutton.className = "oder_food_plusbutton";

    const oder_food_plusbutton_img = document.createElement("img");
    oder_food_plusbutton_img.src = "../images/store/plus.png";
    oder_food_plusbutton_img.alt = "plus";

    oder_food_plusbutton.appendChild(oder_food_plusbutton_img)
    oder_food_quantity_check.appendChild(oder_food_plusbutton)
    oder_food_basket_check.appendChild(oder_food_quantity_check)

    const oder_food_price_check = document.createElement("div");
    oder_food_price_check.className = "oder_food_price";

    const oder_food_price_check_cost = document.createElement("span");
    oder_food_price_check_cost.innerText = foodOrder.foodCost;

    const oder_food_price_check_cost_em = document.createElement("em");
    oder_food_price_check_cost_em.innerText = "원";

    oder_food_price_check_cost.appendChild(oder_food_price_check_cost_em)
    oder_food_price_check.appendChild(oder_food_price_check_cost)
    oder_food_basket_check.appendChild(oder_food_price_check)
    oder_food_info.appendChild(oder_food_basket_check)
    oder_food_container_cell.appendChild(oder_food_info)
    oder_food_container_info.appendChild(oder_food_container_cell)
  
  });
  const totalFoodPrice = foodOrderEntityList.reduce((total, foodOrder) => {
    return total + foodOrder.foodPrice;
  }, 0);
  const oder_food_price_sum = document.getElementById('oder_food_price_sum');
  oder_food_price_sum.querySelector('p').innerText = `${totalFoodPrice} 원`
}

function setTotalPrice() {
  const oderFoodPriceSum = document.getElementById('oder_food_price_sum'); // 'oder_food_price_sum' ID를 가진 요소를 선택
  const oder_movie_info_sum_id = document.getElementById('oder_food_price_sum');
  var food_oeder_price ;
  var movie_oeder_price ;
if (oderFoodPriceSum) { // 요소가 존재하는지 확인
  const totalPriceElement = oderFoodPriceSum.querySelector('p'); // <P> 요소 선택
  if (totalPriceElement) {
    const totalPriceText = totalPriceElement.innerText; // <P> 요소 내부 텍스트 가져오기
    const totalPriceWithoutCurrency = totalPriceText.replace('원', ''); // "원" 부분 제거
    food_oeder_price = parseInt(totalPriceWithoutCurrency);
  }}
  if (oder_movie_info_sum_id) {
    const totalPriceElement = oderFoodPriceSum.querySelector('p');
    if (totalPriceElement) {
      const totalPriceText = totalPriceElement.innerText; // <P> 요소 내부 텍스트 가져오기
      const totalPriceWithoutCurrency = totalPriceText.replace('원', ''); // "원" 부분 제거
      movie_oeder_price = parseInt(totalPriceWithoutCurrency);
    }
  }
  const totalPrice=food_oeder_price + movie_oeder_price;
  const oder_price_content = document.getElementById('oder_price_content');
  oder_price_content.querySelector('p').innerText = `${totalPrice} 원`;
}
setTotalPrice()
function chaingeMoviePrice() {order_movie_price
  const oder_movie_info_sum_id = document.getElementById('oder_movie_info_sum_id');
  const clicked_btn_check = document.querySelectorAll('.clicked')
  var totalPrice;
  if(clicked_btn_check.length!==0){totalPrice =0;}
  else{totalPrice = order_movie_price}
  oder_movie_info_sum_id.querySelector('p').innerText = `${totalPrice} 원`;
  setTotalPrice();
}

function chaingeFoodPrice() {
  const spanElements = document.querySelectorAll('.oder_food_quantity span[data-price]');
  var totalFoodPrice=0;
  spanElements.forEach((span) => {
    const dataCost =  parseInt(span.getAttribute('data-price'));
    const dataCount =  parseInt(span.innerText);
    const dataPrice = dataCost*dataCount
    totalFoodPrice+=dataPrice
  });
  const oderFoodPriceSum = document.getElementById('oder_food_price_sum');
  const totalPriceElement = oderFoodPriceSum.querySelector('p')
  totalPriceElement.innerText = totalFoodPrice + " 원"
  setTotalPrice();
}

const food_minusbutton = document.querySelectorAll(".oder_food_minusbutton");
  const food_plusbutton = document.querySelectorAll(".oder_food_plusbutton");

   //마이너스 버튼을 누르면 수량 감소(0밑으로는 비활성화)
  food_minusbutton.forEach((button) => {
      button.addEventListener("click", () => {
      const span = button.nextElementSibling;
      let count = parseInt(span.innerText);

      if (count > 0) {
        count--;
        span.innerText = count;
      }
      
      
      button.disabled = count === 0;
      chaingeFoodPrice(button , span)
    });
  });

  //플러스 버튼을 누르면 수량 증가
  food_plusbutton.forEach((button) => {
    button.addEventListener("click", () => {
      const span = button.previousElementSibling;
      let count = parseInt(span.innerText);
      count++;
      span.innerText = count;

      button.previousElementSibling.previousElementSibling.disabled = count === 0;
      chaingeFoodPrice(button , span)
    });
  });


  

  // 결제 체크버튼누를때 마다 색상변환
const oder_movie_check_buttons = document.querySelectorAll(".oder_movie_check_btn");
const oder_movie_check_imgs = document.querySelectorAll(".oder_movie_check_img");

oder_movie_check_buttons.forEach((button, index) => {
  button.addEventListener("click", () => {
    const isClicked = button.classList.contains("clicked");
    isClicked
    ? (button.classList.remove("clicked"), oder_movie_check_imgs[index].classList.remove("clicked"))
    : (button.classList.add("clicked"), oder_movie_check_imgs[index].classList.add("clicked"));

    chaingeMoviePrice()
  });
});

/*영화 주문정보 있으면 no에 히든 주문정보 없으면 그냥정보에 히든 */

function movie_hidden_check() {
  const oder_movie_info_cell = document.getElementsByClassName('oder_movie_info_cell');
  const oder_movie_info_sum = document.getElementsByClassName('oder_movie_info_sum');
  const movie_no_order = document.getElementById("movie_no_order");
  
  if (movie_order_condition === 1||movie_order_condition === 2) { /*주문함 1 , 수령완료 2 */
    movie_no_order.classList.add("hidden");
  } else {
    
    Array.from(oder_movie_info_cell).forEach((element) => {
      element.classList.add("hidden");
    });
    
   
    Array.from(oder_movie_info_sum).forEach((element) => {
      element.classList.add("hidden");
    });
  }
}
movie_hidden_check()

/*takeDate에따라 환불가능여부 체크 */
function refund_able_check() {
const oder_butten_container = document.getElementsByClassName('oder_butten_container');
const oder_food_basket_check = document.querySelectorAll('.oder_food_basket_check');
const oder_movie_check = document.querySelectorAll('.oder_movie_check');
const oder_food_basket =  document.querySelectorAll('.oder_food_basket');
 let today = new Date();
 let take_date = new Date(order_take_date);
  if(today<=take_date){/*환불불가 */
    Array.from(oder_butten_container).forEach((element) => {
      element.classList.add("hidden");
    });

    oder_food_basket_check.forEach(function(element) {
      element.classList.add("hidden");
    });

    oder_movie_check.forEach(function(element) {
      element.classList.add("hidden");
    });

  }else{
    oder_food_basket.forEach(function(element) {
      element.classList.add("hidden");
    });
  }
}

refund_able_check()
const oder_page_butten_submit = document.getElementById('oder_page_butten_submit');

oder_page_butten_submit.addEventListener('click', function() {
    alert('환불완료되었습니다~')
    const newLocation = '/'; 

    
    location.href = newLocation;
  });

}
set_food_info()

  


});