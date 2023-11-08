<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문의 내역</title>
    <link rel="stylesheet" href="../css/question/list.css">
</head>
<body>
    <!-- Header 부분 -->
    <jsp:include page="../include/header.jsp" />

    <div class="container">

        <!-- 문의 내용 제목 및 설명 -->
        <div class="word">
            <h2>문의 내역</h2>
            <h4>
                어떠한 내용이라도 답변드릴 준비가 되어 있습니다!<br>
                문의를 보내주세요! 가능한 한 빨리 답변 드리도록 하겠습니다.
            </h4>
        </div>
        
        <hr>

        <!-- 테이블 부분 -->
        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>아이디</th>
                        <th>질문 내용</th>
                        <th>글쓴이</th>
                        <th>등록일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="question" items="${questions}">
                        <tr onclick="redirectToMorePage(${question.idx});">
                            <td>${question.idx}</td>
                            <td>${question.userId}</td>
                            <td class="question-content">${question.userQuestion}</td>
                            <td>${question.userName}</td>
                            <td>${question.registrationDate}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- 페이지네이션 -->
        <div class="pagination">
            <c:forEach var="i" begin="1" end="${totalPages}">
                <c:choose>
                    <c:when test="${i == currentPage}">
                        <span>${i}</span>
                    </c:when>
                    <c:otherwise>
                        <a href="/question/list?page=${i}">${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        
        <!-- 문의 하기 버튼 -->
        <div class="button-group">
            <a href="/question/write"><input type="button" value="문의 하기"></a>
        </div>

    </div>

    <!-- Footer 부분 -->
    <jsp:include page="../include/footer.jsp" />
    
    <script>
    function redirectToMorePage(idx) {
        location.href = '/question/listMore?idx=' + idx;
    }
</script>
</body>
</html>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문의 내역</title>
    <link rel="stylesheet" href="../css/question/list.css">
</head>
<body>
    <!-- Header 부분 -->
    <jsp:include page="../include/header.jsp" />

    <div class="container">

        <!-- 문의 내용 제목 및 설명 -->
        <div class="word">
            <h2>문의 내역</h2>
            <h4>
                어떠한 내용이라도 답변드릴 준비가 되어 있습니다!<br>
                문의를 보내주세요! 가능한 한 빨리 답변 드리도록 하겠습니다.
            </h4>
        </div>
        
        <hr>

        <!-- 테이블 부분 -->
        <div class="table-wrapper">
            <table>
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>아이디</th>
                        <th>질문 내용</th>
                        <th>글쓴이</th>
                        <th>등록일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="question" items="${questions}">
                        <tr onclick="redirectToMorePage(${question.idx});">
                            <td>${question.idx}</td>
                            <td>${question.userId}</td>
                            <td class="question-content">${question.userQuestion}</td>
                            <td>${question.userName}</td>
                            <td>${question.registrationDate}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- 페이지네이션 -->
        <div class="pagination">
            <c:forEach var="i" begin="1" end="${totalPages}">
                <c:choose>
                    <c:when test="${i == currentPage}">
                        <span>${i}</span>
                    </c:when>
                    <c:otherwise>
                        <a href="/question/list?page=${i}">${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        
        <!-- 문의 하기 버튼 -->
        <div class="button-group">
            <a href="/question/write"><input type="button" value="문의 하기"></a>
        </div>

    </div>

    <!-- Footer 부분 -->
    <jsp:include page="../include/footer.jsp" />
    
    <script>
    function redirectToMorePage(idx) {
        location.href = '/question/listMore?idx=' + idx;
    }
</script>
</body>
</html>
>>>>>>> main
