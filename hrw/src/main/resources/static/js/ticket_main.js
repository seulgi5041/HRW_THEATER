document.addEventListener("DOMContentLoaded", function() {
  const depth1Select1 = document.querySelectorAll('.depth1');
  const depth2Select1 = document.querySelectorAll('.depth2 li');
  const groupTimeSelect = document.querySelectorAll('.group_time_select');
  const boxNotice = document.querySelector('.box_notice');


  /*2023-11-01 10:50분 수정 페이지가 로드 될 때 depth1이 자동으로 active되는 것을 방지하고
   * depth2의 css속성을 none으로 변경
  */
  depth1Select1.forEach((element) => {
    const depth2 = element.querySelector('.depth2');
    if (depth2) {
      depth2.style.display = 'none';
    }
  });


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
      depth2.style.display = 'block'; 
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

    if (!element.classList.contains('active')) { // 이미 active 클래스를 가지고 있지 않은 경우에만 실행
      element.classList.add('active');
      const depth1 = element.closest('.depth1');
      if (depth1) {
        depth1.classList.add('active');
      }
    }
    const selectedLocation = element.textContent.trim(); // 앞뒤 공백 제거
    const movieHall = document.querySelector('.hall').textContent;
    console.log("선택지점: " + selectedLocation + " (" + movieHall + ")");


     // <dd> 업데이트
    const ddElement = document.querySelector('li.step01.active dl dd');
    ddElement.textContent = selectedLocation + " (" + movieHall + ")";
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
  liSelect.forEach((liElement) => {
    liElement.classList.add('clickable-li'); // Add a class to style the li elements
  });

  // Event delegation: Listen for clicks on the ul element
  const ulElement = document.querySelector('.movie_select_wrap ul');
  ulElement.addEventListener('click', function (event) {
    const clickedLi = event.target.closest('.clickable-li'); // Find the closest clickable li element
    if (clickedLi) {
      // Remove active class from all li elements
      liSelect.forEach((liElement) => {
        liElement.classList.remove('active');
      });

      // Add active class to the clicked li
      clickedLi.classList.add('active');

      
      // Extract and log the movie title from the clicked li
      const movieTitle = clickedLi.querySelector('.bx_title .tit').textContent;
      console.log("선택영화: ", movieTitle);

      const ddElements = document.querySelectorAll('li.step01.active dl dd');
      ddElements[1].textContent = movieTitle;

      // for (let i = 0; i < ddElements.length; i++) {
      //   if (ddElements[i].textContent.trim() === "") {
      //     ddElements[1].textContent = movieTitle;
      //     break; // Stop after filling the first empty <dd>
      //   }
      // }
    }
});

function updateThirdDdText(event) {
  const radioDate = event.currentTarget.querySelector('input');
  const thirdDd = document.querySelectorAll('dl dd')[2]; // 세 번째 <dd> 요소 선택

  if (radioDate && thirdDd) {
    const playDate = radioDate.getAttribute('data-playdate');
    const playweek = radioDate.getAttribute('data-playweek'); // 주의 오타 수정
    thirdDd.textContent = `${playDate}(${playweek})`;
  }
}

  // 각 날짜를 클릭할 때 위에서 정의한 함수를 호출
  const dateElements = document.querySelectorAll('a.date');
  dateElements.forEach(dateElement => {
    dateElement.addEventListener('click', updateThirdDdText);
  });



  //상영시간 선택시 속성주기
  const groupTimeSelects = document.querySelectorAll('.group_time_select ul > li a');
  const strongElement = document.querySelector('.stepOnePopupHeader strong');
  //const ddElements = document.querySelectorAll('dl dd');

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


      // 네 번째 <dd> 요소 선택
      const ddElements = document.querySelectorAll('dl dd');

      // 네 번째 <dd> 요소 선택
      const fourthDd = ddElements[3];

      if (fourthDd) {
        fourthDd.textContent = `시작 ${selectedTime} ~ ${endTime}`;
        console.log(fourthDd.textContent);
      }
      

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