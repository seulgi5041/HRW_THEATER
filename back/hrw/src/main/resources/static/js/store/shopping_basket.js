document.addEventListener("DOMContentLoaded", function() {

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
    });
  });
  
  
  
  });