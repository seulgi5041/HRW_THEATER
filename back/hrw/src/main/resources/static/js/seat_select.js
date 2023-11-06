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

      /* 함수명*/
      on_choice_person_count_list()
       
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
      /* 함수명*/
      on_choice_person_count_list()
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
        if (seatElement.classList.contains('readonly')){
          alert('이미 사용중인 좌석입니다.');
          return
        }
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
        }on_choice_seat_list()
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


/*클릭시 좌석정보 step01에 추가*/

function on_choice_seat_list(){
  const choice_seats = document.querySelectorAll('.sel.on'); /*배열에 추가 */
const choice_seat_list = [];
choice_seats.forEach((seat) => {
  const dataSeat = seat.getAttribute('data-seat');
  choice_seat_list.push(dataSeat);
});
console.log("choice_seat_list :"+choice_seat_list);
set_dd_choice_seats_list(choice_seat_list)
}

function set_dd_choice_seats_list(choice_seat_list){
document.getElementById("dd_choice_seats").textContent=choice_seat_list;
}



/*클릭시 인원정보 step01에 추가*/
function on_choice_person_count_list(){
  const person_ounts_string = Object.keys(personCounts).map((key) => `${key}: ${personCounts[key]}`).join(', ');

  document.getElementById("dd_choice_person_count").textContent=person_ounts_string;
  set_total_Price()
}

/*가격보여주기*/
function set_total_Price(){
  let total_Price = 0;
  for (const key in personCounts) {
    if (personCounts.hasOwnProperty(key) && cost_in_choice_schedule.hasOwnProperty(key)) {
      total_Price += personCounts[key] * cost_in_choice_schedule[key];
    }
  }
  document.getElementById("setting_total_Price").textContent=total_Price;
}



  /*팔린 좌석은 잠그기*/

function on_use_seat_check(){
  let all_seat_list = document.querySelectorAll('.sel'); // 'sel' 클래스를 가진 모든 좌석 요소를 선택

  all_seat_list.forEach((seat) => {
    let seat_code = seat.getAttribute('data-seat');
    if (in_use_seats.includes(seat_code)) {
      seat.classList.add('readonly')
    }

});
}
on_use_seat_check();


/*다음버튼으로 보내기 post로 좌석배열, 제이슨, 가격 보내기 */


const link_rpay_btn = document.getElementById('link_rpay');
function set_go_to_next_info(choice_list, choice_person_count, choice_total_price) {
  const dd_choice_list = document.getElementById("dd_choice_seats").textContent;
  const  set_choice_seat_list = dd_choice_list.split(',');
  const  set_choice_person_count = personCounts;
  const  set_choice_total_price = document.getElementById('setting_total_Price').textContent;
  return { choice_seat_list: set_choice_seat_list, choice_person_count: set_choice_person_count, choice_total_price: set_choice_total_price };
}

link_rpay_btn.addEventListener("click", () => {
 /**입력한좌석수와 인원수가안맞으면 안보내기 */
  const { choice_seat_list, choice_person_count, choice_total_price } = set_go_to_next_info();
  let total_choice_count = Object.values(personCounts).reduce((acc, count) => acc + count, 0);
  if(total_choice_count ===choice_seat_list.length){
  go_on_post_mapping(choice_seat_list, choice_person_count, choice_total_price)}
  else{
    alert("선택한 좌석 수와 인원 수가 일치 해야 합니다.")
  }
});

function go_on_post_mapping(choice_seat_list, choice_person_count, choice_total_price) {
  let form = document.createElement('form');
  const seat_list_value = choice_seat_list.join(',');

  // scheduleCode를 숨겨진 입력 필드로 추가
  let seat_list_input = document.createElement('input');
  seat_list_input.setAttribute('type', 'hidden');
  seat_list_input.setAttribute('name', 'seat_list');
  seat_list_input.setAttribute('value', seat_list_value);
  form.appendChild(seat_list_input);

  let person_count_input = document.createElement('input');
  person_count_input.setAttribute('type', 'hidden');
  person_count_input.setAttribute('name', 'person_count');
  person_count_input.setAttribute('value', JSON.stringify(choice_person_count));
  form.appendChild(person_count_input);

  let total_price_input = document.createElement('input');
  total_price_input.setAttribute('type', 'hidden');
  total_price_input.setAttribute('name', 'total_price');
  total_price_input.setAttribute('value', choice_total_price.toString());
  form.appendChild(total_price_input);


  form.setAttribute('method', 'post');
  form.setAttribute('action', '/reservation/third_combo');
  
  // 필요한 경우 데이터 유효성 검사 수행

  document.body.appendChild(form);
  form.submit();
}

});
