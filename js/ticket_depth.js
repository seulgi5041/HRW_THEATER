
document.addEventListener("DOMContentLoaded", function() {
  // 지역선택 후, 영화관을 나타내는 구현
  const depth1Select = document.querySelectorAll('.depth1');
  const depth2Select = document.querySelectorAll('.depth2 li');

  //.depth1 클래스의 클릭 이벤트
  function handleDepth1Click(element) {
    //depth1에 active가 없다면 depth2가 나타나지 않음
    depth1Select.forEach((el) => {
      if (el !== element) {
        el.classList.remove('active');
        const depth2 = el.querySelector('.depth2');
        if (depth2) {
          depth2.style.display = 'none';
        }
      }
    });

    //depth1에 active가 있다면 depth2가 나타남
    element.classList.add('active');
    const depth2 = element.querySelector('.depth2');
    if (depth2) {
      depth2.style.display = 'block';
    }
  }

  //.depth2 li의 클릭 이벤트를 처리
  function handleDepth2Click(element) {
    depth2Select.forEach((el) => {
      //depth2에 active가 없으면 li에서 active 제거
      if (el !== element) {
        el.classList.remove('active');
      }
    });
  
    element.classList.add('active');
    const depth1 = element.closest('.depth1');
    //depth2에 active가 있으면 li에서 active 추가
    if (depth1) {
      depth1.classList.add('active');
    }
  }

  //depth1에 있는 요소를 반복하여 클릭된 것을 찾음
  depth1Select.forEach((element) => {
    element.addEventListener('click', () => {
      handleDepth1Click(element);
    });
  });

  //depth2에 있는 요소를 반복하여 클릭된 것을 찾음
  depth2Select.forEach((element) => {
    element.addEventListener('click', () => {
      handleDepth2Click(element);
    });
  });



  //영화 클릭하면 스타일 속성주기
  const liSelect = document.querySelectorAll('.movie_select_wrap ul > li');

  liSelect.forEach((element) => {
    element.addEventListener('click', () => {
      // li에 있는 class에 active속성 삭제
      liSelect.forEach((el) => {
        el.classList.remove('active');
      });

      // li에 있는 class에 active속성 활성화
      element.classList.add('active');
    });
  });
});


