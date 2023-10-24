// document.addEventListener("DOMContentLoaded", function () {
//     const seatTitElements = document.querySelectorAll('.seat_tit');
//     let topValue = 0;
  
//     seatTitElements.forEach((element) => {
//       element.style.top = `${topValue}px`;
//       topValue += 30;
//     });
  
//     const seatArea = document.querySelector('.seat_area');
//     const numRows = 7;
//     const numColumns = 13; // Number of columns
//     const seatWidth = 26; // Width of each seat
//     const seatHeight = 30; // Height of each seat
  
//     const rowLabels = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];
  
//     rowLabels.forEach((rowLabel) => {
//     for (let i = 1; i <= numColumns; i++) {
//       const seatElement = document.createElement('a');
//       seatElement.href = 'javascript:void(0);';
//       seatElement.className = 'sel p0';
//       seatElement.setAttribute('alt', `좌석 번호:${rowLabel}${i} 일반석`);
//       seatElement.setAttribute('data-seat', `${rowLabel}${i}`);
      
//       let leftMargin = 32; // Default left margin

//       if (i === 1 || i === 2) {
//           leftMargin += 10; // Add 10px margin to the 1st and 2nd seats
//       } else if (i >= 3 && i <= 9) {
//           leftMargin += 30; // Add 20px margin to seats 3 to 9
//       } else if (i >= 10) {
//           leftMargin += 50; // Add 20px margin to seats 10 and beyond
//       } else {
//           // Default styling for other seats
//       }

//       seatElement.style.left = `${(i - 1) * 26 + leftMargin}px`;
//       seatElement.style.top = `${rowLabels.indexOf(rowLabel) * seatHeight}px`;

//       seatElement.innerHTML = `<span class="f1 bland">${i}</span>`;
//       seatElement.addEventListener('click', () => {
//         // Remove "on" class from all seats
//         seatArea.querySelectorAll('.sel').forEach(seat => {
//           seat.classList.remove('on');
//         });
//         seatElement.classList.toggle('on');
//       });
//       seatArea.appendChild(seatElement);
//     }
//   });
// });
  


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

  const personCounts = {
    '성인': 0,
    '청소년': 0,
    '장애인': 0,
  };

  let availableSeats = 0;
  let totalPeopleCount = 0;
  let clickedSeats = new Set();

 

  function updateSeatSelection() {
    availableSeats = 8 - totalPeopleCount; // Update available seats based on the total people count.

    const seatElements = document.querySelectorAll('.sel');
    seatElements.forEach((seatElement) => {
      if (totalPeopleCount === 0) {
        seatElement.removeEventListener('click', seatClickHandler);
      } else if (availableSeats > 0) {
        seatElement.addEventListener('click', seatClickHandler);
      } else {
        seatElement.removeEventListener('click', seatClickHandler);
      }
    });
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
  
  updatePersonCounts();
  updateSeatSelection();

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
      } else if (count < 8 && personCounts[personType] < 8) {
        count++;
        span.innerText = count;
        personCounts[personType] = count;   
      } else {
        alert('인원은 최대 8명까지 가능합니다.');
      }
  
      const totalPeopleCount = Object.values(personCounts).reduce((acc, count) => acc + count, 0);
      if (totalPeopleCount > 8) {
        alert('인원은 최대 8명까지 가능합니다.');
        count--;
        span.innerText = count;
        personCounts[personType] = count;
        updateSeatSelection();
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
        updateSeatSelection();
      }
    });
  });

  

  ///////////////////////////////////////
  
  rowLabels.forEach((rowLabel) => {
    for (let i = 1; i <= numColumns; i++) {
      const seatElement = document.createElement('a');
      seatElement.href = 'javascript:void(0);';
      seatElement.className = 'sel p0';
      seatElement.setAttribute('alt', `좌석 번호:${rowLabel}${i} 일반석`);
      seatElement.setAttribute('data-seat', `${rowLabel}${i}`);

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
      seatElement.addEventListener('click', () => {
        // Remove "on" class from all seats
        seatArea.querySelectorAll('.sel').forEach(seat => {
          seat.classList.remove('on');
        });
        seatElement.classList.toggle('on');
        const seatNumber = i;
        const rowLabelValue = rowLabel;
        console.log(`클릭한 좌석:  ${rowLabelValue}열${seatNumber}`);
      });
      seatArea.appendChild(seatElement);
    }
  });

  function seatClickHandler() {
    console.log('totalPeopleCount:', personCounts);
    if (totalPeopleCount === 0) {
      alert('먼저 인원을 선택하세요');
    } else {
      // Your existing code to toggle the 'on' class and manage clicked seats
      this.classList.toggle('on');
      const seatId = this.getAttribute('data-seat');
      if (clickedSeats.has(seatId)) {
        clickedSeats.delete(seatId); // If the seat was already clicked, remove it
      } else {
        clickedSeats.add(seatId); // Add the seat to the set
      }
      console.log('Clicked seats:', clickedSeats); // Log the clicked seats
    }
  }

  const seatElements = document.querySelectorAll('.sel');
  seatElements.forEach(seatElement => {
    seatElement.addEventListener('click', seatClickHandler);
  });
});


