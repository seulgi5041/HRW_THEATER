document.addEventListener("DOMContentLoaded", function() {
  //<li class="step01 prev"> 에서 step 이 들어간 것을 모두 찾는다
  const steps = document.querySelectorAll('[class^="step"]');

  //클래스 안의 .box_con을 찾아 마우스를 올리면 보여주고, 내리면 안 보여줌
  steps.forEach((step) => {
    const boxCon = step.querySelector('.box_con');

    step.addEventListener('mouseenter', function() {
      boxCon.style.display = 'block';
    });

    step.addEventListener('mouseleave', function() {
      boxCon.style.display = 'none';
    });
  });


/*//마이너스 버튼을 누르면 수량 감소(0밑으로는 비활성화)
 const minusButtons = document.querySelectorAll(".minus-button");
   const plusButtons = document.querySelectorAll(".plus-button");

  //  마이너스 버튼을 누르면 수량 감소(0밑으로는 비활성화)
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
   });*/


});