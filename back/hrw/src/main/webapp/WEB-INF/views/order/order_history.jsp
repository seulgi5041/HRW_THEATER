<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>주문이력</title>
  <link rel="stylesheet" href="../css/common.css">
  <link rel="stylesheet" href="../css/oder_history.css"/>
</head>
<body>
  <jsp:include page="../include/header.jsp"/>


  <main>
   
      <div id="oder_history_title"><h1>주문이력</h1></div>

      <section id="oder_history_wrap">
      <div class="oder_container_title">
        <h2>이력 목록</h2>
      </div>
      <c:forEach items="${userOrder}" var="order" varStatus="status">
        <c:choose>
            <c:when test="${status.index <= 10}">
              <article class="oder_history_row"> 
            </c:when>
            <c:when test="${status.index > 10}">
            <article class="oder_history_row hidden"> 
            </c:when>
            <c:otherwise></c:otherwise>
          </c:choose>
          <div class="oder_history_info">
          
            <div class="oder_history_title_cell">
              <h3>${order.orderDate}</h3> <!--주문일-->
              <dl>
                <dt>주문번호</dt>
                <dd>${order.orderCode}</dd>
              </dl>
            </div>
  
            <div class="oder_history_info_cell">
              <table>
                <tr>
                  <th>영화</th>
                  <td>${order.movieTitle}</td>
                </tr>
  
                <tr>
                  <th>대표 음식</th>
                  <td>${order.representFoodName}</td>
                </tr>
  
                <tr>
                  <th>합계</th>
                  <td>${order.totalPrice}</td>
  
                </tr>
  
              </table>
            </div>
  
            <div class="oder_history_ditail_btn_cell">
              <button class="oder_history_ditail_btn" data-order="${order.orderCode}">상세보기</button>
            </div>
  
          </div>
        </article>

      </c:forEach>


      
      <div class="no_oder_result hidden">
        <img src="../images/movie/no_data.png" alt="X"><h2> 주문이력이 없습니다.</h2>
      </div>


      <button id="oder_history_show_next_button">
        더보기
      </button>

    </section>
  </main>
  
<!-- 상단 이동 버튼 -->
<a class="topBtn" id="go_top" href="#">
  <img src="../images/top.png" alt="누르면 홈페이지 상단으로 이동합니다.">
</a>

<!-- 푸터 -->
<jsp:include page="../include/footer.jsp"/>
<script>
  const order_list = [
  <c:forEach items="${userOrder}" var="order" varStatus="status">
    '${order.orderCode}'<c:if test="${!loop.last}">, </c:if>
  </c:forEach>
  ]
  
</script>

  <script src="../js/oder_history.js"></script>
  <script src="../js/common.js"></script>
</body>
</html>