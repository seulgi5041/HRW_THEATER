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