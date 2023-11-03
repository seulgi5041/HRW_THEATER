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



});