document.addEventListener("DOMContentLoaded", function() {
  // Get the <div> element with id "reserveStep01"
  const reserveStep01 = document.getElementById("reserveStep01");
  
  // Check if the <div> has the id "reserveStep01"
  if (reserveStep01) {
    // Get the <li> element with class "step01"
    const step01Li = document.querySelector('.step01');
  
    // Add the "active" class to the <li> to make it active
    step01Li.classList.add('active');
  }

  



    const step01Li = document.querySelector('.step01');

    // Get the "box_con" element inside the <li>
    const boxCon = step01Li.querySelector('.box_con');

    // Add a mouse enter event listener
    step01Li.addEventListener('mouseenter', function() {
      // Show the "box_con" element
      boxCon.style.display = 'block';
    });

    // Add a mouse leave event listener
    step01Li.addEventListener('mouseleave', function() {
      // Hide the "box_con" element
    boxCon.style.display = 'none';
  });
});