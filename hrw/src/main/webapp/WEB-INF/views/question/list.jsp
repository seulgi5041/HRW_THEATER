<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문의 글 작성</title>
    <link rel="stylesheet" href="../css/list.css">
</head>
<body>
    <jsp:include page="../include/header.jsp" />

    <div class="container">
        <div class="word">
            <h2>문의 내역</h2>
            <h4>
                어떠한 내용이라도 답변드릴 준비가 되어 있습니다!<br>
                문의를 보내주세요! 가능한 한 빨리 답변 드리도록 하겠습니다.
            </h4>
        </div>
        
        <hr>
        
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
                    <tr>
                        <td>1</td>
                        <td>user123</td>
                        <td>문의 내용 예제입니다.</td>
                        <td>홍길동</td>
                        <td>2023-10-26</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>user456</td>
                        <td>또 다른 문의 내용 예제입니다.</td>
                        <td>이순신</td>
                        <td>2023-10-25</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>user456</td>
                        <td>또 다른 문의 내용 예제입니다.</td>
                        <td>이순신</td>
                        <td>2023-10-25</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>user456</td>
                        <td>또 다른 문의 내용 예제입니다.</td>
                        <td>이순신</td>
                        <td>2023-10-25</td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td>user456</td>
                        <td>또 다른 문의 내용 예제입니다.</td>
                        <td>이순신</td>
                        <td>2023-10-25</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="button-group">
            <a href="/question/write"><input type="button" value="문의 하기"></a>
        </div>
    </div>

    <jsp:include page="../include/footer.jsp" />
</body>
</html>
