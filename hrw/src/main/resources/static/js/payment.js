<<<<<<< HEAD
document.addEventListener("DOMContentLoaded", function() {
  document.querySelector('.case1').addEventListener('click', function() {
    // "신용카드" 버튼 클릭 시
    // "article_pay_card" 메뉴를 표시하고 "article_pay_simple" 메뉴를 숨깁니다
    document.querySelector('.article_pay_card').style.display = 'block';
    document.querySelector('.article_pay_simple').style.display = 'none';
    document.querySelector('.group_item').classList.remove('active');
  });

  document.querySelector('.case2').addEventListener('click', function() {
    // "간편결제" 버튼 클릭 시
    // "article_pay_simple" 메뉴를 표시하고 "article_pay_card" 메뉴를 숨깁니다
    document.querySelector('.article_pay_simple').style.display = 'block';
    document.querySelector('.article_pay_card').style.display = 'none';
    document.querySelector('.group_item').classList.remove('active');
  });

  document.querySelector('.case3').addEventListener('click', function() {
    // "무통장입금" 버튼 클릭 시
    // "article_pay_card"와 "article_pay_simple" 메뉴를 숨깁니다
    document.querySelector('.article_pay_card').style.display = 'none';
    document.querySelector('.article_pay_simple').style.display = 'none';
    document.querySelector('.group_item').classList.add('active');
  });

  document.querySelector('.case4').addEventListener('click', function() {
    // "휴대폰" 버튼 클릭 시
    // "article_pay_card"와 "article_pay_simple" 메뉴를 숨깁니다
    document.querySelector('.article_pay_card').style.display = 'none';
    document.querySelector('.article_pay_simple').style.display = 'none';
    document.querySelector('.group_item').classList.add('active');
  });

  
=======
document.addEventListener("DOMContentLoaded", function() {
  document.querySelector('.case1').addEventListener('click', function() {
    // "신용카드" 버튼 클릭 시
    // "article_pay_card" 메뉴를 표시하고 "article_pay_simple" 메뉴를 숨깁니다
    document.querySelector('.article_pay_card').style.display = 'block';
    document.querySelector('.article_pay_simple').style.display = 'none';
    document.querySelector('.group_item').classList.remove('active');
  });

  document.querySelector('.case2').addEventListener('click', function() {
    // "간편결제" 버튼 클릭 시
    // "article_pay_simple" 메뉴를 표시하고 "article_pay_card" 메뉴를 숨깁니다
    document.querySelector('.article_pay_simple').style.display = 'block';
    document.querySelector('.article_pay_card').style.display = 'none';
    document.querySelector('.group_item').classList.remove('active');
  });

  document.querySelector('.case3').addEventListener('click', function() {
    // "무통장입금" 버튼 클릭 시
    // "article_pay_card"와 "article_pay_simple" 메뉴를 숨깁니다
    document.querySelector('.article_pay_card').style.display = 'none';
    document.querySelector('.article_pay_simple').style.display = 'none';
    document.querySelector('.group_item').classList.add('active');
  });

  document.querySelector('.case4').addEventListener('click', function() {
    // "휴대폰" 버튼 클릭 시
    // "article_pay_card"와 "article_pay_simple" 메뉴를 숨깁니다
    document.querySelector('.article_pay_card').style.display = 'none';
    document.querySelector('.article_pay_simple').style.display = 'none';
    document.querySelector('.group_item').classList.add('active');
  });

  
>>>>>>> 167ea023502192dc31f8cd1a7cbf773bda115a24
});