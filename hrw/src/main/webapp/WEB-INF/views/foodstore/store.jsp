<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HRW 푸드스토어</title>

    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/store/store.css">
</head>
<body>
    <jsp:include page="../include/header.jsp"/>

    <!-- 푸드스토어 메인 -->
    <main id="store">
        <!-- 푸드 스토어 메뉴 -->
        <div class="store_menu">
            <p>푸드스토어</p>
            <div class="snb_menu">
                <ul class="food_menu">
                    <li><a href="/foodstore/store">콤보</a></li>
                    <li><a href="/foodstore/popcorn">팝콘</a></li>
                    <li><a href="/foodstore/drink">음료</a></li>
                    <li><a href="/foodstore/snack">스낵</a></li>
                </ul>
                <ul class="add_food">
                    <li><a href="/foodstore/shopping_basket">장바구니</a></li>
                </ul>
            </div>
        </div>
    </main>

    <!-- 푸드스토어 메인 구역 -->
    <section id="popcorn_store">
        <div class="store_title">
            <h4>콤보</h4>
            <div class="block_color"></div>
        </div>
        <!-- 상품 목록 메인 박스 -->
        <div class="store_content">
            <article class="food_box">
                <div class="food_image">
                    <img src="../images/store/product/single_combo.png" alt="더블콤보">
                </div>
                <div class="product">
                    <p>팝콘(M)2 + 탄산(M)2</p>
                    <div class="product_name">
                        <h4>더블콤보</h4>
                    </div>
                    <div class="shopping_basket">
                        <div class="sum">
                            <button class="minus-button">
                                <img src="../images/store/minus.png" alt="minus">
                            </button>
                            <span id="count_1">0</span>
                            <button class="plus-button">
                                <img src="../images/store/plus.png" alt="plus">
                            </button>
                        </div>
                        <div class="price_wrap">
                            <span id="price_1">13,000<em>원</em></span>
                        </div>
                        <div class="add">
                            <button class="add-to-cart-button" data-name="더블콤보" data-price="13000"
                                data-image="../images/store/product/single_combo.png" data-count="count_1"
                                onclick="addToCart(this)"><img id="sum_add" src="../images/store/cart.png"
                                    alt="장바구니"></button>
                            <button></button>
                        </div>
                    </div>
                </div>
            </article>

            <article class="food_box">
                <div class="food_image">
                    <img src="../images/store/product/double_combo.png" alt="라지콤보">
                </div>
                <div class ="product">
                    <p>팝콘(L)2 + 탄산(L)2</p>
                    <div class="product_name">
                        <h4>라지콤보</h4>
                    </div>
                    <div class="shopping_basket">
                        <div class="sum">
                            <button class="minus-button">
                                <img src="../images/store/minus.png" alt="minus">
                            </button>
                            <span id="count_2">0</span>
                            <button class="plus-button">
                                <img src="../images/store/plus.png" alt="plus">
                            </button>
                        </div>
                        <div class "price_wrap">
                            <span id="price_2">15,000<em>원</em></span>
                        </div>
                        <div class="add">
                            <button class="add-to-cart-button" data-name="라지콤보" data-price="15000"
                                data-image="../images/store/product/double_combo.png" data-count="count_2"
                                onclick="addToCart(this)"><img id="sum_add" src="../images/store/cart.png"
                                    alt="장바구니"></button>
                            <button></button>
                        </div>
                    </div>
                </div>
            </article>

            <article class="food_box">
                <div class="food_image">
                    <img src="../images/store/product/single_combo.png" alt="스몰콤보">
                </div>
                <div class="product">
                    <p>팝콘(M)1 + 탄산(M)1</p>
                    <div class="product_name">
                        <h4>스몰콤보</h4>
                    </div>
                    <div class="shopping_basket">
                        <div class="sum">
                            <button class="minus-button">
                                <img src="../images/store/minus.png" alt="minus">
                            </button>
                            <span id="count_3">0</span>
                            <button class="plus-button">
                                <img src="../images/store/plus.png" alt="plus">
                            </button>
                        </div>
                        <div class="price_wrap">
                            <span id="price_3">7,000<em>원</em></span>
                        </div>
                        <div class="add">
                            <button class="add-to-cart-button" data-name="스몰콤보" data-price="7000"
                                data-image="../images/store/product/single_combo.png" data-count="count_3"
                                onclick="addToCart(this)"><img id="sum_add" src="../images/store/cart.png"
                                    alt="장바구니"></button>
                            <button></button>
                        </div>
                    </div>
                </div>
            </article>

            <article class="food_box">
                <div class="food_image">
                    <img src="../images/store/product/double_combo.png" alt="HRW콤보">
                </div>
                <div class="product">
                    <p>팝콘(M)1 + 탄산(M)1</p>
                    <div class="product_name">
                        <h4>HRW콤보</h4>
                    </div>
                    <div class="shopping_basket">
                        <div class="sum">
                            <button class="minus-button">
                                <img src="../images/store/minus.png" alt="minus">
                            </button>
                            <span id="count_4">0</span>
                            <button class="plus-button">
                                <img src="../images/store/plus.png" alt="plus">
                            </button>
                        </div>
                        <div class="price_wrap">
                            <span id="price_4">10,000<em>원</em></span>
                        </div>
                        <div class="add">
                            <button class="add-to-cart-button" data-name="HRW콤보" data-price="10000"
                                data-image="../images/store/product/double_combo.png" data-count="count_4"
                                onclick="addToCart(this)"><img id="sum_add" src="../images/store/cart.png"
                                    alt="장바구니"></button>
                            <button></button>
                        </div>
                    </div>
                </div>
            </article>
        </div>

        <div class="store_title">
            <h4>장바구니</h4>
            <div class="block_color"></div>
        </div>
        <table id="cart-table">
            <thead>
                <tr>
                    <th>상품 사진</th>
                    <th>상품명</th>
                    <th>가격</th>
                    <th>수량</th>
                    <th>주문관리</th>
                </tr>
            </thead>
            <tbody>
                <!-- 여기에 장바구니 내용이 추가될 것입니다. -->
            </tbody>
        </table>
    </section>
    <jsp:include page="../include/footer.jsp"/>

    <script src="../js/store/store.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

var shoppingCart = [];

// 페이지가 로드될 때 실행할 초기화 함수
window.onload = function() {
    shoppingCart = [];
}
function addToCart(button) {
    // 장바구니 아이템을 저장하기 위한 배열


    // 버튼에서 상품 정보를 가져오기
    var productName = button.getAttribute('data-name');
    var productPrice = parseFloat(button.getAttribute('data-price'));
    var productImage = button.getAttribute('data-image');

    // 버튼에서 수량 정보를 가져오기
    var countID = button.getAttribute('data-count');
    var count = parseInt(document.getElementById(countID).textContent);

    // 이미 장바구니에 있는 상품인지 확인
    var existingItem = shoppingCart.find(item => item.name === productName);

    if (existingItem) {
        // 이미 장바구니에 있는 상품이면 수량만 증가
        existingItem.count += count;
        updateCartItem(existingItem);
    } else {
        // 장바구니에 상품 추가
        var cartItem = {
            name: productName,
            price: productPrice,
            image: productImage,
            count: count
        };
        shoppingCart.push(cartItem);
        updateCartItem(cartItem);
    }

    // 장바구니에 추가되었다는 메시지 표시 (나중에 실제 서버로 전송할 수 있음)
    alert(productName + "가 장바구니에 추가되었습니다.");
}

function updateCartItem(item) {
    // 장바구니 테이블 업데이트
    var cartTable = document.getElementById("cart-table").getElementsByTagName('tbody')[0];
    // 기존 행 찾기
    var existingRow = Array.from(cartTable.rows).find(row => row.cells[1].textContent === item.name);

    if (existingRow) {
        // 기존 행이 있는 경우 수량 및 가격 업데이트
        var countCell = existingRow.cells[3];
        var priceCell = existingRow.cells[2];
        countCell.textContent = item.count;
        priceCell.textContent = (item.price * item.count) + "원";
    } else {
        // 새로운 행을 만들어 추가
        var newRow = cartTable.insertRow(-1);
        var cell1 = newRow.insertCell(0);
        var cell2 = newRow.insertCell(1);
        var cell3 = newRow.insertCell(2);
        var cell4 = newRow.insertCell(3);
        var cell5 = newRow.insertCell(4);

        // 이미지 추가
        var image = document.createElement("img");
        image.src = item.image;
        cell1.appendChild(image);

        cell2.innerHTML = item.name;
        cell3.innerHTML = (item.price * item.count) + "원";
        cell4.innerHTML = item.count;

     // 삭제 버튼 추가
        var deleteButton = document.createElement("button");
        deleteButton.innerHTML = "삭제";
        deleteButton.onclick = function() {
            // 행 삭제
            var rowIndex = newRow.rowIndex; // Get the index of the row to be deleted
            cartTable.deleteRow(rowIndex);
            // 장바구니에서 상품 삭제
            var index = shoppingCart.findIndex(cartItem => cartItem.name === item.name);
            if (index !== -1) {
                shoppingCart.splice(index, 1);
            }
        };
        cell5.appendChild(deleteButton);
    }
}
</script>

</body>
</html>
