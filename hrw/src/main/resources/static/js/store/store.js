document.addEventListener("DOMContentLoaded", function() {

  //일정 스크롤 내려가면 store메뉴가 상단에 나타나기
  window.addEventListener("scroll", function() {
    const scrollPosition = window.scrollY;
    const storeMenu = document.querySelector(".snb_menu");
    const storeTitle = document.querySelector(".store_menu p");
    const foodMenu = document.querySelector(".food_menu");
    const addFood = document.querySelector(".add_food");

    if (scrollPosition > 120) {
        storeTitle.style.display = "none";
        storeMenu.style.position = "fixed";
        storeMenu.style.backgroundColor = "#F5F4F2";
        foodMenu.style.backgroundColor = "#F5F4F2";
        addFood.style.backgroundColor = "#F5F4F2";
    } else {
        storeTitle.style.display = "block";
        storeMenu.style.position = "static";
        storeMenu.style.top = "107px";
        storeMenu.style.zIndex = "999";
    }
});


  const minusButtons = document.querySelectorAll(".minus-button");
  const plusButtons = document.querySelectorAll(".plus-button");

   //마이너스 버튼을 누르면 수량 감소(0밑으로는 비활성화)
    minusButtons.forEach((button) => {
      button.addEventListener("click", () => {
      const span = button.nextElementSibling;
      let count = parseInt(span.innerText);
      
      if (count > 0) {
        count--;
        span.innerText = count;
      }
      
      
      button.disabled = count === 0;
    });
  });

  //플러스 버튼을 누르면 수량 증가
  plusButtons.forEach((button) => {
    button.addEventListener("click", () => {
      const span = button.previousElementSibling;
      let count = parseInt(span.innerText);
      count++;
      span.innerText = count;
      
      button.previousElementSibling.previousElementSibling.disabled = count === 0;
    });
  });

});