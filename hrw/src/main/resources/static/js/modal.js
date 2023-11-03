document.addEventListener("DOMContentLoaded", function() {
  
  function openModal() {
    var modal = document.getElementById("modal");
    modal.style.display = "block";
  }

  // 모달 열기 함수 호출
  window.openModal = openModal;

  //x버튼을 클릭했을때 모달 창 닫기
  const closeModalButtons = document.getElementsByClassName("btn_close");

  for (const closeButton of closeModalButtons) {
    closeButton.addEventListener('click', closeModal);
  }

  // 모달 닫기 함수
  function closeModal() {
    const modal = document.getElementById("modal");
    modal.style.display = "none";
  }

  // 모달 창 내의 취소 버튼을 선택
  const cancelButtons = document.querySelectorAll('.btn_col1');

  // 모달 창 내의 취소 버튼에 대한 클릭 이벤트 추가
  for (const cancelButton of cancelButtons) {
    cancelButton.addEventListener('click', function() {
      const modal = this.closest('#modal');
      if (modal) {
        modal.style.display = 'none';
      }
    });
  }
});