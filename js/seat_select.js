document.addEventListener("DOMContentLoaded", function () {
    const seatTitElements = document.querySelectorAll('.seat_tit');
    let topValue = 0;
  
    seatTitElements.forEach((element) => {
      element.style.top = `${topValue}px`;
      topValue += 30;
    });
  
    const seatArea = document.querySelector('.seat_area');
    const numRows = 7;
    const numColumns = 13; // Number of columns
    const seatWidth = 26; // Width of each seat
    const seatHeight = 30; // Height of each seat
  
    const rowLabels = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];
  
    rowLabels.forEach((rowLabel) => {
      for (let i = 1; i <= numColumns; i++) {
        const seatElement = document.createElement('a');
        seatElement.href = 'javascript:void(0);';
        seatElement.className = 'sel p0';
        seatElement.setAttribute('alt', `좌석 번호:${rowLabel}${i} 일반석`);
        seatElement.setAttribute('data-seat', `${rowLabel}${i}`);
        
        let leftMargin = 32; // Default left margin

        if (i === 1 || i === 2) {
            leftMargin += 10; // Add 10px margin to the 1st and 2nd seats
        } else if (i >= 3 && i <= 9) {
            leftMargin += 30; // Add 20px margin to seats 3 to 9
        } else if (i >= 10) {
            leftMargin += 50; // Add 20px margin to seats 10 and beyond
        } else {
            // Default styling for other seats
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
        });
        seatArea.appendChild(seatElement);
      }
    });
  });
  