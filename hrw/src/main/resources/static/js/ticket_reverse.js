document.addEventListener("DOMContentLoaded", function() {
  //<li class="step01 prev"> 에서 step 이 들어간 것을 모두 찾는다
  const steps = document.querySelectorAll('[class^="step"]');

  steps.forEach((step) => {
    const boxCon = step.querySelector('.box_con');

    if (boxCon) {
      step.addEventListener('mouseenter', function() {
        boxCon.style.display = 'block';
      });

      step.addEventListener('mouseleave', function() {
        boxCon.style.display = 'none';
      });
    }
  });
});