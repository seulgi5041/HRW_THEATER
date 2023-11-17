<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
    // 세션에서 사용자 정보를 가져옵니다.
    String loggedInUserName = (String) session.getAttribute("loginId"); 
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>

    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/store/shopping_basket.css">
    <script>
    function showOrderConfirmation() {
        // 주문이 성공적으로 완료되었을 때 사용자에게 알림을 표시
        alert("주문이 성공적으로 완료되었습니다. 감사합니다!");


        // 주문 완료 페이지로 이동 (이동 경로를 변경할 수 있음)
        window.location.href = "/foodstore/orderComplete"; 
    }
    </script>
</head>
<body>

<!-- 헤더 부분 -->
<jsp:include page="../include/header.jsp"/>

<main>
    <section id="oder_confirmation_wrap">
        <div id="oder_confirmation_title">
            <h1><%= loggedInUserName %>님 장바구니</h1>
        </div>

        <article id="oder_food_container">
            <div class="oder_container_title">
                <h2>푸드 주문 정보</h2>
            </div>
            <div id="oder_food_container_info">
                <div class="oder_food_container_cell">
                    <div class="no_oder_result">
                        <h2><img src="../images/no_data.png" alt="X">주문정보가 없습니다.</h2>
                    </div>
                    <table id="cart-table">
                        <thead>
                            <tr>
                                <th>상품 이미지</th>
                                <th>상품 이름</th>
                                <th>가격</th>
                                <th>수량</th>
                                <th>합계</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- 장바구니 정보를 JavaScript로 동적으로 채웁니다 -->
                        </tbody>
                    </table>
                </div>

                <div class="oder_food_price_sum hidden">
                    <h3>합계</h3>
                    <p>35,000 원</p>
                </div>
            </div>
        </article>
        
        <article id="oder_payment_container">
            <div class="oder_container_title">
                <h2>결제 정보</h2>
            </div>
            <table class="payment_info">
                <tr>
                    <th>총 금액</th>
                    <td id="total-amount">0 원</td>
                </tr>
                <!-- 다른 결제 정보 항목들을 추가하세요 (항목명과 항목값을 변경) -->
            </table>
        </article>

        <!-- 주문 직전이면 결제하기 버튼이 보여야 하고, 결제 후에는 버튼이 없어야 합니다 -->
        <!-- 주문 직전 -->
        <article class="oder_button_container">
            <button id="oder_page_button_submit"
            style="padding: 10px 15px;
    background-color: #FB3D28;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 1.5em;
    margin-left: 1150px;
    height: 60px;
    width: 150px;
    font-size: 25px;"><a href="/foodstore/orderComplete" style="color: white;" onclick="showOrderConfirmation();">결제하기</a>
</button>
        </article>
        <div class="empty_place"></div>
    </section>
</main>

<!-- 푸터 부분 -->
<jsp:include page="../include/footer.jsp"/>

<script src="../js/store/shopping_basket.js"></script>

<script>

// 장바구니 정보를 가져와서 표시하는 함수
function displayCartItems() {
    // 테이블 요소와 tbody 요소 가져오기
    var cartTable = document.getElementById("cart-table");
    var tbody = cartTable.getElementsByTagName("tbody")[0];

    // sessionStorage에서 장바구니 정보 가져오기
    var cartItems = JSON.parse(sessionStorage.getItem('cart'));
	console.log(cartItems);
    // 테이블을 비웁니다.
    tbody.innerHTML = '';

    var totalAmount = 0; // 총 합계 초기화

    // 장바구니 정보를 테이블에 동적으로 추가하면서 합계 계산
    cartItems.forEach(function (item) {
        var newRow = tbody.insertRow(tbody.rows.length);

        var cell1 = newRow.insertCell(0);
        var cell2 = newRow.insertCell(1);
        var cell3 = newRow.insertCell(2);
        var cell4 = newRow.insertCell(3);
        var cell5 = newRow.insertCell(4);

        cell1.innerHTML = '<img src="' + item.image + '" alt="' + item.productName + '">';
        cell2.innerHTML = item.name;
        cell3.innerHTML = item.price + " 원";
        cell4.innerHTML = item.quantity;
        var subtotal = item.price * item.quantity;
        cell5.innerHTML = subtotal + " 원"; // 합계 계산

        totalAmount += subtotal; // 총 합계에 합계 더하기
    });

    // 총 합계 업데이트
    var totalAmountElement = document.getElementById("total-amount");
    totalAmountElement.innerText = totalAmount + " 원";

    // 결제 정보 표에도 총 합계 업데이트 (필요에 따라 다른 결제 정보도 업데이트 가능)
    var paymentTotalAmountElement = document.getElementById("payment-total-amount");
    paymentTotalAmountElement.innerText = totalAmount + " 원";
}

// 페이지가 로드될 때 장바구니 정보를 표시합니다.
window.addEventListener('load', displayCartItems);

window.addEventListener('load', function () {
    // sessionStorage에서 장바구니 정보 가져오기
    var cartItems = JSON.parse(sessionStorage.getItem('cart'));
    console.log(cartItems);

    // 테이블 요소 가져오기
    var cartTable = document.getElementById("cart-table");
    var noOrderMessage = document.querySelector(".no_oder_result");

    if (cartItems && cartItems.length > 0) {
        // 장바구니에 정보가 있는 경우
        cartTable.style.display = 'table'; // 표 보이기
        noOrderMessage.style.display = 'none'; // 메시지 숨기기
    } else {
        // 장바구니에 정보가 없는 경우
        cartTable.style.display = 'none'; // 표 숨기기
        noOrderMessage.style.display = 'block'; // 메시지 보이기
    }
    

});

</script>


</body>
</html>
