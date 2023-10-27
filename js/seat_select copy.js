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
        // If the count is already 8, clicking plus should decrease the count by 1
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
  // Function to handle seat click event
  function handleSeatClick(event) {
    const seatElement = event.currentTarget;
    console.log('seatElement : ', seatElement);
  
    if (seatSelectionEnabled) {
      if (seatElement.classList.contains('sel')) {
        if (seatElement.classList.contains('on')) {
          // Deselect the seat
          seatElement.classList.remove('on');
          totalSelectedSeats--;

          // Enable the seat
          disabledSeats.delete(seatElement);
        } else {
          // Check if the total selected seats have reached the maximum
          if (totalSelectedSeats < maxSelectedSeats) {
            // Select the seat
            seatElement.classList.add('on');
            totalSelectedSeats++;
            
          } else {
            // Remove the 'disabled' class when trying to select another seat
            const allSeats = document.querySelectorAll('.sel');
            allSeats.forEach((otherSeat) => {
              if (!otherSeat.classList.contains('on')) {
                otherSeat.classList.add('disabled');
              }
            });
            // Add 'disabled' class to the selected seat
            seatElement.classList.add('disabled');
          }
        }
      }
    } else if (totalSelectedSeats === 0) {
      alert('먼저 인원을 선택하세요.'); // Prompt to select the number of people
    }
  }

  // Enable seat selection when plus button is clicked
  plusButtons.forEach((button) => {
    button.addEventListener("click", () => {
      maxSelectedSeats = Object.values(personCounts).reduce((acc, count) => acc + count, 0);
      // Enable seat selection
      seatSelectionEnabled = true;

      
      const allSeats = document.querySelectorAll('.sel');
      allSeats.forEach((seat) => {
        seat.classList.remove('disabled');
      });
    });
  });

  minusButtons.forEach((button) => {
    button.addEventListener("click", () => {
      maxSelectedSeats = Object.values(personCounts).reduce((acc, count) => acc + count, 0);
      // Enable seat selection
      seatSelectionEnabled = true;

      
      const allSeats = document.querySelectorAll('.sel');
      allSeats.forEach((seat) => {
        seat.classList.remove('disabled');
      });
    });
  });

  
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
