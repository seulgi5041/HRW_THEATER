document.addEventListener("DOMContentLoaded", function () {
  const seatTitElements = document.querySelectorAll('.seat_tit');
  let topValue = 0;

  seatTitElements.forEach((element) => {
    element.style.top = `${topValue}px`;
    topValue += 30;
  });

  const seatArea = document.querySelector('.seat_area');
  const numRows = 7;
  const numColumns = 13;
  const seatWidth = 26;
  const seatHeight = 30;
  const rowLabels = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];
  // 좌석 정보를 저장할 배열
  const seatData = [];

  const personCounts = {
    '성인': 0,
    '청소년': 0,
    '장애인': 0,
  };

  let availableSeats = 9;
  let totalPeopleCount = 9;
  const clickedSeats = new Set();


  function updateSeatSelection() {
    const seatElements = document.querySelectorAll('.sel');
    availableSeats = availableSeats - totalPeopleCount; // Update available seats based on the total people count.

    //console.log('totalPeopleCount:', totalPeopleCount);
    //console.log('availableSeats:', availableSeats);

    
    seatElements.forEach((seatElement) => {
      const seatNumber = seatElement.getAttribute('data-seat');
      //console.log('seatElement:', seatElement);
      // const altValue = seatElement.getAttribute('alt');
      // const seatNumber = extractSeatNumber(altValue);
      // console.log('포맷된 숫자 : ', seatNumber);

      if (totalPeopleCount === 0 || availableSeats === 0) {
        seatElement.classList.remove('on');
        seatElement.removeEventListener('click', seatClickHandler);
      } else if (availableSeats > 0) {
        seatElement.addEventListener('click', () => {
          selectSeat(seatElement, seatNumber);
        });
      } else {
        seatElement.classList.remove('on');
        seatElement.removeEventListener('click', seatClickHandler);
      }
    });
  }

  // 좌석을 선택할 때 호출되는 함수
  function selectSeat(seatElement, seatNumber) {

    if (clickedSeats.has(seatNumber)) {
      clickedSeats.delete(seatNumber);
      seatElement.classList.remove('on');
      seatElement.removeEventListener('click', seatClickHandler);
      totalPeopleCount--;
      console.log(seatElement.classList);
    } else {
      if (totalPeopleCount < 9) {
        clickedSeats.add(seatNumber);
        seatElement.classList.add('on');
        totalPeopleCount++;
        seatElement.removeEventListener('click', seatClickHandler);
      } else {
        alert('인원은 최대 8명까지 가능합니다.');
      }
    }
    updateSeatSelection();
  }


  

  function updatePersonCounts() {
    const personElements = document.querySelectorAll('[data-people]');
    personElements.forEach((personElement) => {
      const personType = personElement.getAttribute('data-people');
      const countElement = personElement.querySelector('.txt_num');
      personCounts[personType] = parseInt(countElement.innerText);
    });
    totalPeopleCount = Object.values(personCounts).reduce((acc, count) => acc + count, 0);
    updateSeatSelection();
  }


///////////////////////////////////////////////

  const minusButtons = document.querySelectorAll(".minus-button");
  const plusButtons = document.querySelectorAll(".plus-button");

  plusButtons.forEach((button) => {
    button.addEventListener("click", () => {
      const span = button.previousElementSibling;
      const personType = button.closest('li').getAttribute('data-people');
      let count = parseInt(span.innerText);
      
      if (count === 9 && personCounts[personType] > 0) {
        // If the count is already 8, clicking plus should decrease the count by 1
        count--;
        span.innerText = count;
        personCounts[personType] = count;
        alert('인원은 최대 8명까지 가능합니다.');
      } else if (count < 9 && personCounts[personType] < 9) {
        count++;
        span.innerText = count;
        personCounts[personType] = count;   
      } else {
        count--;
        span.innerText = count;
        personCounts[personType] = count;  
      }
  
      const totalPeopleCount = Object.values(personCounts).reduce((acc, count) => acc + count, 0);
      if (totalPeopleCount > 8) {
        alert('인원은 최대 8명까지 가능합니다.');
        count--;
        span.innerText = count;
        personCounts[personType] = count;
      }

      //totalPeopleCount = Object.values(personCounts).reduce((acc, count) => acc + count, 0);
      updatePersonCounts();
      updateSeatSelection();
      console.log(personCounts); 
      console.log(totalPeopleCount);
       
    });
  });

  minusButtons.forEach((button) => {
    button.addEventListener("click", () => {
      const span = button.nextElementSibling;
      const personType = button.closest('li').getAttribute('data-people');
      let count = parseInt(span.innerText);

      if (count > 0) {
        count--;
        span.innerText = count;
        personCounts[personType] = count; 
      }

      // 여기서 totalPeopleCount를 업데이트
      totalPeopleCount = Object.values(personCounts).reduce((acc, count) => acc + count, 0);
      updatePersonCounts();
      updateSeatSelection();
      console.log(personCounts); 
      console.log(totalPeopleCount);
    });
  });

  

  ///////////////////////////////////////
  
  rowLabels.forEach((rowLabel) => {
    for (let i = 1; i <= numColumns; i++) {
      const seatElement = document.createElement('a');
      seatElement.href = 'javascript:void(0);';
      seatElement.className = 'sel';
      const seatNumber = `${rowLabel}열${i}`;
      seatElement.setAttribute('alt', `좌석번호: ${seatNumber}`);

      // Set 'data-seat' attribute to store the seat number
      seatElement.setAttribute('data-seat', seatNumber);
      

      let leftMargin = 32;

      if (i === 1 || i === 2) {
        leftMargin += 10;
      } else if (i >= 3 && i <= 9) {
        leftMargin += 30;
      } else if (i >= 10) {
        leftMargin += 50;
      }

      seatElement.style.left = `${(i - 1) * 26 + leftMargin}px`;
      seatElement.style.top = `${rowLabels.indexOf(rowLabel) * seatHeight}px`;

      seatElement.innerHTML = `<span class="f1 bland">${i}</span>`;
      // seatElement.addEventListener('click', () => {
      //   seatArea.querySelectorAll('.sel').forEach(seat => {
      //     seat.classList.remove('on');
      //   });
      //   seatElement.classList.toggle('on');
      //   const seatNumber = seatElement.getAttribute('data-seat'); // seatElement에서 좌석 정보 가져오기
      //   console.log(`클릭한 좌석: ${seatNumber}`);
      // });

      // 좌석 생성 후 이벤트 추가
      //seatElement.addEventListener('click', seatClickHandler);

      // 좌석을 추가
      seatArea.appendChild(seatElement);

      // 좌석 정보를 배열에 저장
      seatData.push({
        element: seatElement,
        seatNumber: seatNumber,
      });
    }
});


    const seatElements = document.querySelectorAll('.sel');
    const selectedSeats = new Set();


    seatElements.forEach(seatElement => {
      seatElement.addEventListener('click', seatClickHandler);
    });

    function seatClickHandler() {
      const seatElement = this; // 'this'를 사용해 클릭된 좌석 요소 가져오기
      //console.log(seatElement);
      const seatNumber = seatElement.getAttribute('data-seat'); // 좌석 정보 추출
      //const isSeatSelected = clickedSeats.has('on');
      // const seatNumber = this.getAttribute('data-seat');
      //const isSeatSelected = seatElements.classList('on');

      if (selectedSeats.has(seatNumber) && totalPeopleCount >= 1) {
        selectedSeats.add(seatNumber);
        seatElement.classList.add('on');
      } else if (selectedSeats.has(seatNumber)) {
        selectedSeats.delete(seatNumber);
        seatElement.classList.remove('on');
      } 
    
      updateSeatSelection();
    
      console.log('선택됨:', seatNumber);
      console.log('총 인원의 합:', totalPeopleCount);
      console.log('선택 좌석:', Array.from(selectedSeats));


    }
});
