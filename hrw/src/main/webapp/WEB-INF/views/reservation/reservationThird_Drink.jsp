<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HRW 예매페이지</title>

  <link rel="stylesheet" href="../css/common.css">
  <link rel="stylesheet" href="../css/ticket.css">
  <link rel="stylesheet" href="../css/ticket_step03.css">
  
</head>
<body>

  <!-- 헤더 영역 -->
    <jsp:include page="../include/header.jsp"/>

<main id="contents" class="contents_full contents_reserve" style="margin-top:30px;">
  <section class="wrap_reserve">
    <div id="reserveStep03" class="section_step_title">
      <ul>
        <!-- 상영시간 -->
        <li class="step01 prev">
          <a href="#reserveStep02">
            <strong class="tit">
              <span>01</span>
              <br>
              상영시간
            </strong>
            <div class="box_con">
              <dl>
                <dt>선택한 영화 정보</dt>
                <dd>title</dd>
                <dt>선택한 상영관</dt>
                <dd>"지점 " 
                    "관"</dd>
                <dt>선택한 상영 시간</dt>
                <dd>date(yyyy-mm-dd(요일))</dd>
                <dt>선택한 시간</dt>
                <dd>"00:00~" 
                    "00:00"</dd>
              </dl>
            </div>
          </a>
        </li>

        <!-- 인원,좌석 -->
        <li class="step01 prev">
          <a href="#reserveStep03">
            <strong class="tit">
              <span>02</span>
              <br>
              인원/좌석
            </strong>
            <div class="box_con">
              <dl>
                <dt>선택한 인원</dt>
                <dd>
                  <span id="preview_people_info"></span>
                </dd>
                <dt>선택한 좌석</dt>
                <dd>
                  <span id="preview_seat_info"></span>
                </dd>
              </dl>
            </div>
          </a>
        </li>

        <!-- 음식선택 -->
        <li class="step01 active">
          <a style="cursor: default;">
            <strong class="tit">
              <span>03</span>
              <br>
              음식선택
            </strong>
            <div class="box_con">
              <dl>
                <dt>선택한 음식</dt>
                <dd>
                  <span id="preview_store_info"></span>
                </dd>
                <dd>
                  <span id="preview_store_info"></span>
                </dd>
                <dd>
                  <span id="preview_store_info"></span>
                </dd>
              </dl>
            </div>
          </a>
        </li>

        <!-- 결제 -->
        <li class="disabled">
          <a style="cursor: default;">
            <strong class="tit">
              <span>04</span>
              <br>
              결제
            </strong>
            <div class="box_con">
              <dl>선택한 영화 제목
                <dt>title</dt>
                <dd>선택한 상영관</dd>
                <dd>"지점 " 
                    "관"</dd>
                <dt>선택한 상영 시간</dt>
                <dd>date(yyyy-mm-dd(요일))</dd>
                <dt>선택한 시간</dt>
                <dd>"00:00~" 
                    "00:00"</dd>
              </dl>
            </div>
          </a>
        </li>

        <!-- 결제완료 -->
        <li class="disabled">
          <a style="cursor: default;">
            <strong class="tit">
              <span>05</span>
              <br>
              결제완료
            </strong>
            <div class="box_con">
              <dl>선택한 영화 제목
                <dt>title</dt>
                <dd>선택한 상영관</dd>
                <dd>"지점 " 
                    "관"</dd>
                <dt>선택한 상영 시간</dt>
                <dd>date(yyyy-mm-dd(요일))</dd>
                <dt>선택한 시간</dt>
                <dd>"00:00~" 
                    "00:00"</dd>
              </dl>
            </div>
          </a>
        </li>
      </ul>
    </div>

  <!-- 스낵선택 -->
  <div id="reserveStep03" class="section_step_con step02 active">
    <article class="article_layer article_store">
      <div class="group_header">
        <h4 class="tit">음식 선택</h4>
      </div>
      <div class="inner">
          <!-- 좌석 선택 부분 -->
        <div id="container" class="store_wrap">
          <article class="m_store_wrap">
            <div class="m_store_inner">
              <div class="mCustomScrollbar _mCS_1 mCS-autoHide mCS_no_scrollbar" style="position: relative; overflow: visible; height: 960px;">
                <div id="mCSB_1" class="mCustomScrollBox mCS-minimal-dark mCSB_vertical mCSB_outside" tabindex="0" style="max-height: none;">
                  <div id="mCSB_1_container" class="mCSB_container" style="position: relative; top: 0px; left: 0px;" dir="ltr">
                    
                    <!-- 스토어메인 -->
                    <div id="store">
                      <!-- 푸드 스토어 메뉴 -->
                      <div class="store_menu">
                        <p>푸드스토어</p>
                        <div class="snb_menu">
                          <ul class="food_menu">
                            <li><a href="/reservation/third_combo">콤보</a></li>
                            <li><a href="/reservation/third_popcorn">팝콘</a></li>
                            <li><a href="/reservation/third_drink">음료</a></li>
                            <li><a href="/reservation/third_snack">스낵</a></li>
                          </ul>
                          <ul class="add_food">
                            <!-- <li><a href="#">장바구니</a></li> -->
                          </ul>
                        </div>
                      </div>
                    </div>

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


                  </div><!--id= "mCSB_1_container" 완료-->

                </div>
              </div>
            </div> 
          </article>
        </div>
      </div>

        <!-- 총합계 -->
      <div class="storeSum">
        <div class="select_store_result">
          <div class="bottom_left">
            <dl class="total_price">
              <dt>총 합계</dt>
              <dd>
                <strong>금액</strong>
                원
              </dd>
            </dl>
          </div>
          <div class="bottom_right">
            <a href="/reservation/payment" class="btn_col" id="link_pay">결제하기</a>
          </div>
        </div>
      </div>
    </article>
  </div>

  </section>
</main>

<!-- 푸터 -->
    <jsp:include page="../include/footer.jsp"/>
    
    
<!-- 자바스크립트 영역 -->
<script src="../js/store/store_depth.js"></script>
<script src="../js/ticket_main.js"></script>
<script src="../js/ticket_reverse.js"></script> 

</body>
</html>