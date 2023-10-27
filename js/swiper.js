// document.addEventListener("DOMContentLoaded", function() {
//   const swiper = new Swiper(".mySwiper", {
//     slidesPerView: 5,
//     spaceBetween: 8,
//     loop: true,
//     centeredSlides: false,
//     autoplay: {
//       delay: 3000,
//       disableOnInteraction: false,
//     },
//     pagination: {
//       el: ".swiper-pagination",
//       clickable: true,
//     },
//     navigation: {
//       nextEl: ".swiper-button-next",
//       prevEl: ".swiper-button-prev",
//     },
//   });

// });


window.addEventListener("load", function() {
  const imagesToLoad = document.querySelectorAll('img');
  let loadedImages = 0;

  imagesToLoad.forEach(img => {
    img.addEventListener('load', () => {
      loadedImages++;
      if (loadedImages === imagesToLoad.length) {
        initializeSwiper();
      }
    });
    img.src = img.getAttribute('src');
  });

  function initializeSwiper() {
    const swiper = new Swiper(".mySwiper", {
      slidesPerView: 5,
      spaceBetween: 8,
      loop: true,
      centeredSlides: false,
      autoplay: {
        delay: 3000,
        disableOnInteraction: false,
      },
      pagination: {
        el: ".swiper-pagination",
        clickable: true,
      },
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });
  }
});