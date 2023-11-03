document.addEventListener("DOMContentLoaded", function () {
  const seatTitElements = document.querySelectorAll('.seat_tit');
  let topValue = 0;

  seatTitElements.forEach((element) => {
    element.style.top = `${topValue}px`;
    topValue += 30;
  });

  const seatArea = document.querySelector('.seat_area');
  const numColumns = 13;
  const seatHeight = 30;
  const rowLabels = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];
  
  const personCounts = {
    '성인': 0,
    '청소년': 0,
    '장애인': 0,
  };

  

///////////////////////////////////////////////

  const minusButtons = document.querySelectorAll(".minus-button");
  const plusButtons = document.querySelectorAll(".plus-button");

  plusButtons.forEach((button) => {
    button.addEventListener("click", () => {
      const span = button.previousElementSibling;
      const personType = button.closest('li').getAttribute('data-people');
      let count = parseInt(span.innerText);
      
      if (count > 9 && personCounts[personType] > 1) {
        // 총 인원의 수가 8이 됐을때 플러스 버튼 클릭하면 1씩 줄어든다
        //(즉 모든 타입의 좌석을 8에 맞춤)
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

      
    });
  });

  

  ///////////////////////////////////////
  let totalSelectedSeats = 0;
  let maxSelectedSeats = 0;
  let seatSelectionEnabled = false;
  // 좌석 클릭시 수행할 부분
  function handleSeatClick(event) {
    const seatElement = event.currentTarget;
    console.log('seatElement : ', seatElement);
  
    if (seatSelectionEnabled) {
      if (seatElement.classList.contains('sel')) {
        if (maxSelectedSeats === 0) {
          // If no seats are allowed to be selected, show an alert message
          alert('먼저 인원을 선택하세요.');
        } else if (seatElement.classList.contains('on')) {
          // 좌석 선택 해제
          seatElement.classList.remove('on');
          totalSelectedSeats--;
  
          // 모든 숨겨진 좌석 활성화
          const allSeats = document.querySelectorAll('.sel.disabled');
          allSeats.forEach((otherSeat) => {
            otherSeat.classList.remove('disabled');
          });
        } else {
          // 선택한 좌석이 총 합계와 맞는지 확인
          if (totalSelectedSeats < maxSelectedSeats) {
            seatElement.classList.add('on');
            totalSelectedSeats++;
  
            if (totalSelectedSeats === maxSelectedSeats) {
              // 만약 사용자가 모든 좌석을 선택했으면, 다른 좌석들을 비활성화
              const allSeats = document.querySelectorAll('.sel:not(.on)');
              allSeats.forEach((otherSeat) => {
                otherSeat.classList.add('disabled');
              });
            }
          }
        }
      }
    } else if (maxSelectedSeats === 0) {
      alert('먼저 인원을 선택하세요.'); 
    }
  }

  // 플러스 버튼 클릭 시 좌석을 선택하기
  plusButtons.forEach((button) => {
    button.addEventListener("click", () => {
      maxSelectedSeats = Object.values(personCounts).reduce((acc, count) => acc + count, 0);
      // 좌석 선택 활성화
      seatSelectionEnabled = true;

      
      const allSeats = document.querySelectorAll('.sel');
      allSeats.forEach((seat) => {
        seat.classList.remove('disabled');
      });
    });
  });


  let alertShown = false; 
  minusButtons.forEach((button) => {
    button.addEventListener("click", () => {
      maxSelectedSeats = Object.values(personCounts).reduce((acc, count) => acc + count, 0);
      // 좌석 선택 활성화
      seatSelectionEnabled = true;
      totalSelectedSeats = 0;
      
      const allSeats = document.querySelectorAll('.sel');
      allSeats.forEach((seat) => {
        seat.classList.remove('disabled');

        // 다시 활성화된 좌석 중 이미 선택한 좌석을 클릭하기 전 상태로 되돌리기
        if (seat.classList.contains('on')) {
          seat.classList.remove('on');
        }
      });

      console.log('totalSelectedSeats:', maxSelectedSeats);

      if (maxSelectedSeats === 0 && alertShown) {
        alert('먼저 인원을 선택하세요.');
      }
      alertShown = true;
  
      // Reset the alertShown flag when totalSelectedSeats is not 0
      if (maxSelectedSeats !== 0) {
        alertShown = false;
      }
    });
  });

  

  //좌석을 생성하는 부분
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

      seatElement.addEventListener('click', handleSeatClick);

      seatArea.appendChild(seatElement);

    }
});

});