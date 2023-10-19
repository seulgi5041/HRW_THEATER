
document.addEventListener("DOMContentLoaded", function() {
  // 지역선택 후, 영화관을 나타내는 구현
  const depth1Elements = document.querySelectorAll('.depth1');
  const depth2Elements = document.querySelectorAll('.depth2 li');

  function handleDepth1Click(element) {
    depth1Elements.forEach((el) => {
      if (el !== element) {
        el.classList.remove('active');
        const depth2 = el.querySelector('.depth2');
        if (depth2) {
          depth2.style.display = 'none';
        }
      }
    });

    element.classList.add('active');
    const depth2 = element.querySelector('.depth2');
    if (depth2) {
      depth2.style.display = 'block';
    }
  }

  function handleDepth2Click(element) {
    depth2Elements.forEach((el) => {
      if (el !== element) {
        el.classList.remove('active');
      }
    });
  
    element.classList.add('active');
    const depth1 = element.closest('.depth1');
    if (depth1) {
      depth1.classList.add('active');
    }
  }

  depth1Elements.forEach((element) => {
    element.addEventListener('click', () => {
      handleDepth1Click(element);
    });
  });

  depth2Elements.forEach((element) => {
    element.addEventListener('click', () => {
      handleDepth2Click(element);
    });
  });



  //영화 클릭하면 스타일 속성주기
  const liElements = document.querySelectorAll('.movie_select_wrap ul > li');

  liElements.forEach((element) => {
    element.addEventListener('click', () => {
      // Remove the 'active' class from all 'li' elements
      liElements.forEach((el) => {
        el.classList.remove('active');
      });

      // Add the 'active' class to the clicked 'li' element
      element.classList.add('active');
    });
  });
});


