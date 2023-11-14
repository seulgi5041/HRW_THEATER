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
            <article id="oder_movie_container">
                <div class="oder_container_title">
                    <h2>영화 예매 정보</h2>
                </div>
                <div class="oder_movie_info_cell">
                    <div class="oder_movie_poster">
                        <img src="../images/poster_rank/20212667.jpg" alt="영화제목">
                    </div>
                    <div class="oder_movie_info">
                        <h3>영화 제목</h3>
                        <h4>12세 연령가</h4>
                        <h4>2D 디지털</h4>
                    </div>
                    <div class="oder_cinema_info">
                        <table class="oder_movie_info_table">
                            <tr>
                                <th>극장</th>
                                <td>인천부평역점</td>
                            </tr>
                            <tr>
                                <th>일시</th>
                                <td>2023년10월10일 00:00~00:00</td>
                            </tr>
                            <tr>
                                <th>인원</th>
                                <td>일반 2명</td>
                            </tr>
                        </table>
                    </div>
                    <div class="oder_theater_info">
                        <table class="oder_movie_info_table">
                            <tr>
                                <th>상영관</th>
                                <td>10관 6층</td>
                            </tr>
                            <tr>
                                <th>좌석명</th>
                                <td>일반석</td>
                            </tr>
                            <tr>
                                <th>좌석번호</th>
                                <td>b11, b11, b11, b11</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="oder_movie_info_cell hidden">
                    <!-- ... (same structure as above) ... -->
                </div>
                <div class="oder_movie_info_sum">
                    <h3>합계</h3>
                    <p>35,000 원</p>
                </div>
            </article>
            <div class="no_oder_result">
                <img src="../images/no_data.png" alt="X">
                <h2>주문정보가 없습니다.</h2>
            </div>
            <article id="oder_food_container">
                <div class="oder_container_title">
                    <h2>푸드 주문 정보</h2>
                </div>
                <div id="oder_food_container_info">
                    <div class="oder_food_container_cell">
                        <!-- ... (similar structure as above) ... -->
                    </div>
                    <div class="oder_food_container_cell hidden">
                        <!-- ... (similar structure as above) ... -->
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
                <div class="payment_info">
                    <table>
                        <tr>
                            <th>결제수단</th>
                            <td>카드</td> <!-- 카드, 무통장입금, 간편결제-->
                        </tr>
                        <tr>
                            <th>카드사</th><!-- 무통장입금시 은행, 간편결제시 결제사-->
                            <td>현대</td>
                        </tr>
                    </table>
                </div>
                <div id="oder_price_content">
                    <h3>총 결제금액</h3>
                    <p>35,000 원</p>
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
    
</body>
</html>