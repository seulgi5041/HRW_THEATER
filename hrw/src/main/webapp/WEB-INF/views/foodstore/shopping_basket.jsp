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
									<c:forEach items="${cartItems}" var="cartItem">
									    <tr>
									        <td><img src="${cartItem.productImage}" alt="${cartItem.productName}"></td>
									        <td>${cartItem.productName}</td>
									        <td>${cartItem.productPrice} 원</td>
									        <td>${cartItem.quantity}</td>
									        <td>${cartItem.productPrice * cartItem.quantity} 원</td>
									    </tr>
									</c:forEach>
							  </tbody>
							</table>

                    </div>

                    <div class="oder_food_price_sum hidden">
                        <h3>합계</h3>
                        <p>35,000 원</p>
                    </div>
                </div>
                <div class="no_oder_result">
                    <img src="../images/no_data.png" alt="X">
                    <h2>주문정보가 없습니다.</h2>
                </div>
            </article>
            <article id="oder_payment_container">
                <div class="oder_container_title">
                    <h2>결제 정보</h2>
                </div>

            </article>
            <!-- 주문직전이면 결제 하기 버튼이 보여야하고, 결제후 나중에 주문확인건결제 하기 버튼이 없어야함-->
            <!-- 주문 직후 -->
            <article class="oder_button_container">
                <button id="oder_page_button_submit">환불신청</button>
            </article>
            <div class="empty_place"></div>
        </section>
    </main>
    
    <!-- 푸터 부분 -->
    <jsp:include page="../include/footer.jsp"/>
    
    <script src="../js/shopping_basket.js"></script>
    <script src="../js/common.js"></script>
    
    <script>
    function addToCart(productName, price, image) {
        // 장바구니에 상품 추가하는 로직 (이미 구현한 코드 참조)

        // 테이블에 추가
        var cartTable = document.getElementById("cart-table");
        var tbody = cartTable.getElementsByTagName("tbody")[0];
        var newRow = tbody.insertRow(tbody.rows.length);

        var cell1 = newRow.insertCell(0);
        var cell2 = newRow.insertCell(1);
        var cell3 = newRow.insertCell(2);
        var cell4 = newRow.insertCell(3);
        var cell5 = newRow.insertCell(4);

        cell1.innerHTML = '<img src="' + image + '" alt="' + productName + '">';
        cell2.innerHTML = productName;
        cell3.innerHTML = price + " 원";
        cell4.innerHTML = 1; // 초기 수량 (나중에 업데이트 가능)
        cell5.innerHTML = price + " 원"; // 초기 합계 (나중에 업데이트 가능)
    }

    </script>
    
</body>
</html>
