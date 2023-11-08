<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    // 세션에서 사용자 아이디를 가져옵니다.
    String userIdFromSession = (String) session.getAttribute("loginId");
    if(userIdFromSession == null) {
        userIdFromSession = "GUEST";
    } 
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문의 글 작성</title>
    <link rel="stylesheet" href="../css/question/write.css">
</head>
<body>

    <jsp:include page="../include/header.jsp"/>
    <div class="container">
    
        <div class="word">
            <h2>문의 등록</h2>
            <h4>어떠한 내용이라도 답변드릴 준비가 되어 있습니다!<br>
			문의를 보내주세요! 가능한 한 빨리 답변 드리도록 하겠습니다.</h4>
        </div>
        
        <div class="wordImportant">
        <h4>상세 항목 *</h4>
        </div>
        
        <hr>
    
    <form action="/question/write" method="post">
		<div class="input-group">
		    <label for="userId">아 이 디 :</label>
		    <input type="text" name="userId" id="userId" required="required" readonly="readonly" 
		           value="<%= userIdFromSession %>">
		</div>

        <div class="input-group">
            <label for="userName">글 쓴 이 :</label>
            <input type="text" name="userName" id="userName" required="required">
        </div>

		<div class="input-group">
		    <label for="userQuestion">문의 내용 :</label>
		    <textarea name="userQuestion" id="userQuestion" rows="7" cols="50" placeholder="내용을 입력해주세요." required="required"></textarea>
		</div>

        <div class="input-group">
            <label for="userEmail">이 메 일 :</label>
            <input type="email" name="userEmail" id="userEmail" required="required">
        </div>

        <div class="button-group">
            <input type="submit" value="문의 하기">
            <a href="/member/list"><input type="button" value="글 목록"></a>
        </div>
    </form>
    </div>
    <jsp:include page="../include/footer.jsp"/>
    

</body>
</html>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    // 세션에서 사용자 아이디를 가져옵니다.
    String userIdFromSession = (String) session.getAttribute("loginId");
    if(userIdFromSession == null) {
        userIdFromSession = "GUEST";
    } 
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>문의 글 작성</title>
    <link rel="stylesheet" href="../css/question/write.css">
</head>
<body>

    <jsp:include page="../include/header.jsp"/>
    <div class="container">
    
        <div class="word">
            <h2>문의 등록</h2>
            <h4>어떠한 내용이라도 답변드릴 준비가 되어 있습니다!<br>
			문의를 보내주세요! 가능한 한 빨리 답변 드리도록 하겠습니다.</h4>
        </div>
        
        <div class="wordImportant">
        <h4>상세 항목 *</h4>
        </div>
        
        <hr>
    
    <form action="/question/write" method="post">
		<div class="input-group">
		    <label for="userId">아 이 디 :</label>
		    <input type="text" name="userId" id="userId" required="required" readonly="readonly" 
		           value="<%= userIdFromSession %>">
		</div>

        <div class="input-group">
            <label for="userName">글 쓴 이 :</label>
            <input type="text" name="userName" id="userName" required="required">
        </div>

		<div class="input-group">
		    <label for="userQuestion">문의 내용 :</label>
		    <textarea name="userQuestion" id="userQuestion" rows="7" cols="50" placeholder="내용을 입력해주세요." required="required"></textarea>
		</div>

        <div class="input-group">
            <label for="userEmail">이 메 일 :</label>
            <input type="email" name="userEmail" id="userEmail" required="required">
        </div>

        <div class="button-group">
            <input type="submit" value="문의 하기">
            <a href="/member/list"><input type="button" value="글 목록"></a>
        </div>
    </form>
    </div>
    <jsp:include page="../include/footer.jsp"/>
    

</body>
</html>
>>>>>>> main
