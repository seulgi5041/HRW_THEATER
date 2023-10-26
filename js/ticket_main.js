document.addEventListener("DOMContentLoaded", function() {
  const depth1Select1 = document.querySelectorAll('.depth1');
  const depth2Select1 = document.querySelectorAll('.depth2 li');
  const groupTimeSelect = document.querySelectorAll('.group_time_select');
  const boxNotice = document.querySelector('.box_notice');

  function handleDepth1Click(element) {
    // depth1에 active가 없다면 depth2가 나타나지 않음
    depth1Select1.forEach((el) => {
      if (el !== element) {
        el.classList.remove('active');
        const depth2 = el.querySelector('.depth2');
        if (depth2) {
          depth2.style.display = 'none';
        }
      }
    });

    // depth1에 active가 있다면 depth2가 나타남
    element.classList.add('active');
    const depth2 = element.querySelector('.depth2');
    if (depth2) {
      depth2.style.display = 'block'; // 이 부분에서 '=' 기호가 빠졌습니다.
    }

    // 기존에 있던 이미지와 글씨들 사라짐
    boxNotice.style.display = 'none';

    // group_time_select 클래스를 보여줌
    groupTimeSelect.forEach((el) => {
      el.style.display = 'block';
    });
  }

  function handleDepth2Click(element) {
    depth2Select1.forEach((el) => {
      // depth2에 active가 없으면 li에서 active 제거
      if (el !== element) {
        el.classList.remove('active');
      }
    });

    // element에 active를 추가하고, 가장 가까운 depth1에서도 active를 추가
    element.classList.add('active');
    const depth1 = element.closest('.depth1');
    if (depth1) {
      depth1.classList.add('active');
    }
  }

  // depth1Select에 대한 클릭 이벤트 처리
  depth1Select1.forEach((element) => {
    element.addEventListener('click', () => {
      handleDepth1Click(element);
    });
  });

  // depth2Select에 대한 클릭 이벤트 처리
  depth2Select1.forEach((element) => {
    element.addEventListener('click', () => {
      handleDepth2Click(element);
    });
  });

  //영화 선택시 속성주기
  const liSelect = document.querySelectorAll('.movie_select_wrap ul > li');

  liSelect.forEach((element) => {
    element.addEventListener('click', () => {
      // li에 있는 class에 active 속성 삭제
      liSelect.forEach((el) => {
        el.classList.remove('active');
      });

      // li에 있는 class에 active 속성 활성화
      element.classList.add('active');
    });
  });

  

  //상영시간 선택시 속성주기
  const groupTimeSelects = document.querySelectorAll('.group_time_select ul > li a');
  const strongElement = document.querySelector('.stepOnePopupHeader strong');

  groupTimeSelects.forEach((groupTimeSelect) => {
    groupTimeSelect.addEventListener('click', (event) => {
      // 클릭된 요소에 active 클래스 추가
      groupTimeSelect.classList.add('active');

      // 다른 요소의 active 클래스 제거
      groupTimeSelects.forEach((otherGroupTimeSelect) => {
        if (otherGroupTimeSelect !== groupTimeSelect) {
          otherGroupTimeSelect.classList.remove('active');
        }
      });

      //모달창 안의 stepOnePopupHeader 아이디의 strong 태그에 출력해 줄 내용들
      const selectedTime = groupTimeSelect.querySelector('.time strong').textContent;
      const endTime = groupTimeSelect.querySelector('.time .tooltip').textContent;
      const hall = groupTimeSelect.querySelector('.hall').textContent;

      // 선택한 요소의 속성을 stepOnePopupHeader의 strong 태그에 출력
      strongElement.textContent = `시작 ${selectedTime} - ${endTime} (${hall})`;


      //모달js에 전달할 함수
      // 모달 열기 함수 호출
      openModal();

      // 이벤트 기본 동작 방지 (a 태그의 링크 이동 방지)
      event.preventDefault();
    });
  });
});
