<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문의 글 작성</title>
    <link rel="stylesheet" href="../css/write.css">
</head>
<body>

    <jsp:include page="include/header.jsp"/>
    <div class="container">
    
        <div class="word">
            <h2>문의 내역</h2>
        </div>

        <hr>
    
    <form action="#">
        <div class="input-group">
            <label for="userId">아 이 디 :</label>
            <input type="text" name="userId" id="userId" required="required" readonly="readonly">
        </div>

        <div class="input-group">
            <label for="userName">글 쓴 이 :</label>
            <input type="text" name="userName" id="userName" required="required" readonly="readonly">
        </div>

		<div class="input-group">
		    <label for="userQuestion">문의 내용 :</label>
		    <textarea name="userQuestion" id="userQuestion" rows="7" cols="50" placeholder="내용을 입력해주세요." required="required" readonly="readonly"></textarea>
		</div>

        <div class="input-group">
            <label for="userEmail">이 메 일 :</label>
            <input type="email" name="userEmail" id="userEmail" required="required" readonly="readonly">
        </div>
        
        <div class="input-group">
            <label for="registrationDate">작 성 일 :</label>
            <input type="text" name="registrationDate" id="registrationDate" required="required" readonly="readonly">
        </div>

        <div class="button-group">
            <a href="/question/list"><input type="button" value="전체 문의 보기"></a>
        </div>
    </form>
    </div>
    <jsp:include page="include/footer.jsp"/>
</body>
</html>
