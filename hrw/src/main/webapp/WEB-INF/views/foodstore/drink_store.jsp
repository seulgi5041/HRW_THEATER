<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          <li><a href="#">장바구니</a></li>
        </ul>
      </div>
    </div>
  </main>

  <!-- 푸드스토어 메인 구역 -->
  <section id="popcorn_store">
    <div class="store_title">
      <h4>음료</h4>
      <div class="block_color"></div>
    </div>
    <!-- 상품 목록 메인 박스 -->
    <div class="store_content">
      <article class="food_box">
        <div class="food_image">
          <img src="../images/store/product/coke_M.png" alt="콜라(M)">
        </div>
        <div class="product">  
          <p>콜라(M)</p>
          <div class="product_name">
            <h4>콜라(M)</h4>
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
              <span>2,500<em>원</em></span>
            </div>
            <div class="add">
              <button><img id="sum_add" src="../images/store/cart.png" alt="장바구니"></button>
            </div>
          </div>
        </div>
      </article>

      <article class="food_box">
        <div class="food_image">
          <img src="../images/store/product/coke_L.png" alt="콜라(L)">
        </div>
        <div class="product">  
          <p>콜라(L)</p>
          <div class="product_name">
            <h4>콜라(L)</h4>
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
              <span>3,000<em>원</em></span>
            </div>
            <div class="add">
              <button><img id="sum_add" src="../images/store/cart.png" alt="장바구니"></button>
            </div>
          </div>
        </div>
      </article>

      <article class="food_box">
        <div class="food_image">
          <img src="../images/store/product/cider_M.png" alt="사이다(M)">
        </div>
        <div class="product">  
          <p>사이다(M)</p>
          <div class="product_name">
            <h4>사이다(M)</h4>
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
              <span>2,500<em>원</em></span>
            </div>
            <div class="add">
              <button><img id="sum_add" src="../images/store/cart.png" alt="장바구니"></button>
            </div>
          </div>
        </div>
      </article>

      <article class="food_box">
        <div class="food_image">
          <img src="../images/store/product/cider_L.png" alt="사이다(L)">
        </div>
        <div class="product">  
          <p>사이다(L)</p>
          <div class="product_name">
            <h4>사이다(L)</h4>
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
              <span>3,000<em>원</em></span>
            </div>
            <div class="add">
              <button><img id="sum_add" src="../images/store/cart.png" alt="장바구니"></button>
            </div>
          </div>
        </div>
      </article>

      <article class="food_box">
        <div class="food_image">
          <img src="../images/store/product/coffee_ice.png" alt="아메리카노(ICE)">
        </div>
        <div class="product">  
          <p>아메리카노(ICE)</p>
          <div class="product_name">
            <h4>아메리카노(ICE)</h4>
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
              <span>4,000<em>원</em></span>
            </div>
            <div class="add">
              <button><img id="sum_add" src="../images/store/cart.png" alt="장바구니"></button>
            </div>
          </div>
        </div>
      </article>

      <article class="food_box">
        <div class="food_image">
          <img src="../images/store/product/coffee_hot.png" alt="아메리카노(HOT)">
        </div>
        <div class="product">  
          <p>아메리카노(HOT)</p>
          <div class="product_name">
            <h4>아메리카노(HOT)</h4>
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
	

	  <script src="../js/store.js"></script>
</body>
</html>