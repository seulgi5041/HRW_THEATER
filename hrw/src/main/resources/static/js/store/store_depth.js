document.addEventListener("DOMContentLoaded", function() {
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