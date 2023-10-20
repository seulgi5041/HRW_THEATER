<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HRW 푸드스토어</title>

    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/stroe.css">
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
          <li><a href="#">장바구니</a></li>
        </ul>
      </div>
    </div>
  </main>

  <!-- 푸드스토어 메인 구역 -->
  <section id="popcorn_store">
    <div class="store_title">
      <h4>스낵</h4>
      <div class="block_color"></div>
    </div>
    <!-- 상품 목록 메인 박스 -->
    <div class="store_content">
      <article class="food_box">
        <div class="food_image">
          <img src="../images/store/product/nachos.png" alt="칠리치즈나쵸">
        </div>
        <div class="product">  
          <p>칠리치즈나쵸</p>
          <div class="product_name">
            <h4>칠리치즈나쵸</h4>
          </div>
          <div class="shopping_basket">
            <div class="sum">
              <button class="minus-button">
                <img src="../images/store/minus.png" alt="minus">
              </button>
              <span>0</span>
              <button class="plus-button">
                <img src="../images/store/plus.png" alt="plus">
              </button>
            </div>
            <div class="price_wrap">
              <span>4,900<em>원</em></span>
            </div>
            <div class="add">
              <button><img id="sum_add" src="../images/store/cart.png" alt="장바구니"></button>
            </div>
          </div>
        </div>
      </article>

      <article class="food_box">
        <div class="food_image">
          <img src="../images/store/product/origin_hotdog.png" alt="플레인핫도그">
        </div>
        <div class="product">  
          <p>플레인핫도그</p>
          <div class="product_name">
            <h4>플레인핫도그</h4>
          </div>
          <div class="shopping_basket">
            <div class="sum">
              <button class="minus-button">
                <img src="../images/store/minus.png" alt="minus">
              </button>
              <span>0</span>
              <button class="plus-button">
                <img src="../images/store/plus.png" alt="plus">
              </button>
            </div>
            <div class="price_wrap">
              <span>4,500<em>원</em></span>
            </div>
            <div class="add">
              <button><img id="sum_add" src="../images/store/cart.png" alt="장바구니"></button>
            </div>
          </div>
        </div>
      </article>

      <article class="food_box">
        <div class="food_image">
          <img src="../images/store/product/cheese_hotdog.png" alt="치즈핫도그">
        </div>
        <div class="product">  
          <p>치즈핫도그</p>
          <div class="product_name">
            <h4>치즈핫도그</h4>
          </div>
          <div class="shopping_basket">
            <div class="sum">
              <button class="minus-button">
                <img src="../images/store/minus.png" alt="minus">
              </button>
              <span>0</span>
              <button class="plus-button">
                <img src="../images/store/plus.png" alt="plus">
              </button>
            </div>
            <div class="price_wrap">
              <span>5,000<em>원</em></span>
            </div>
            <div class="add">
              <button><img id="sum_add" src="../images/store/cart.png" alt="장바구니"></button>
            </div>
          </div>
        </div>
      </article>

      <article class="food_box">
        <div class="food_image">
          <img src="../images/store/product/chestnut.png" alt="맛밤">
        </div>
        <div class="product">  
          <p>맛밤</p>
          <div class="product_name">
            <h4>맛밤</h4>
          </div>
          <div class="shopping_basket">
            <div class="sum">
              <button class="minus-button">
                <img src="../images/store/minus.png" alt="minus">
              </button>
              <span>0</span>
              <button class="plus-button">
                <img src="../images/store/plus.png" alt="plus">
              </button>
            </div>
            <div class="price_wrap">
              <span>3,500<em>원</em></span>
            </div>
            <div class="add">
              <button><img id="sum_add" src="../images/store/cart.png" alt="장바구니"></button>
            </div>
          </div>
        </div>
      </article>

      <article class="food_box">
        <div class="food_image">
          <img src="../images/store/product/squidwithbutter.png" alt="땅콩버터오징어">
        </div>
        <div class="product">  
          <p>땅콩버터오징어</p>
          <div class="product_name">
            <h4>땅콩버터오징어</h4>
          </div>
          <div class="shopping_basket">
            <div class="sum">
              <button class="minus-button">
                <img src="../images/store/minus.png" alt="minus">
              </button>
              <span>0</span>
              <button class="plus-button">
                <img src="../images/store/plus.png" alt="plus">
              </button>
            </div>
            <div class="price_wrap">
              <span>3,500<em>원</em></span>
            </div>
            <div class="add">
              <button><img id="sum_add" src="../images/store/cart.png" alt="장바구니"></button>
            </div>
          </div>
        </div>
      </article>
    </div>
  </section>

    <jsp:include page="../include/footer.jsp"/>
	
	  <script src="../js/common.js"></script>
	  <script src="../js/store.js"></script>
</body>
</html>