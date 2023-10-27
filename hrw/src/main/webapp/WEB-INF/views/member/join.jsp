<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
    <link rel="stylesheet" href="../css/member/form/join_form.css"> 
    
    <script src="../js/member/join.js"></script>
    
    <script>
    function confirmReset(event) {
        var isConfirm = confirm('입력하신 정보를 초기화 시키겠습니까?');
        if (!isConfirm) {
            event.preventDefault(); // 초기화 동작 방지
        }
    }
</script>
</head>
<body>
    <jsp:include page="../include/header.jsp"/>

    <div class="container">
    	
        <div class="word">
            <h2>회원 정보</h2>
             
       		 <h5> * 값은 필수 입력값입니다.</h5>
        </div>
        
        <hr>

        <form action="/member/join" method="post">
            <div class="input-container"> 
                <div class="input-group">
                    <label for="user_ID">* 아이디</label>
                    <input type="text" id="user_ID" name="userId" placeholder="영문,숫자 6~20자" maxlength="20" required="required">
                    <input type="button" value="중복 확인">
                </div>

                <div class="input-group">
                    <label for="user_PW">* 비밀번호</label>
                    <input type="password" id="user_PW" name="userPassword" placeholder="영문,숫자(6자리 이상)" maxlength="20" required="required">
                </div>

                <div class="input-group">
                    <label for="user_PW_Again">* 비밀번호 확인</label>
                    <input type="password" id="user_PW_Again" name="userPasswordAgain" placeholder="비밀번호 확인" maxlength="20" required="required">
                </div>

                <div class="input-group">
                    <label for="user_Name">* 이름</label>
                    <input type="text" id="user_Name" name="userName" placeholder="이름" maxlength="20" required="required">
                </div>

                <div class="input-group">
                    <label for="user_Gender">* 성별</label>
                    <select id="user_Gender" name="userGender">
                        <option value="">성별</option>
                        <option value="M">남성</option>
                        <option value="W">여성</option>
                    </select>
                </div>

                <div class="input-group">
                    <label for="user_Email">* 이메일</label>
                    <input type="email" id="user_Email" name="userEmail" placeholder="이메일" required="required">
                </div>

                <div class="input-group">
                    <label for="user_Phone">* 연락처</label>
                    <input type="text" id="user_Phone" name="userPhone" placeholder="연락처(' -'포함하여 입력)" maxlength="20" required="required">
                </div>

                <div class="button-group">
                    <input type="submit" value="회원 가입" class="big-button"> 
					<input type="reset" value="초기화" class="big-button" onclick="confirmReset(event)">

                </div>
            </div>
        </form>
    </div>

    <jsp:include page="../include/footer.jsp"/>
    
    <% if (request.getAttribute("errorMessage") != null) { %>
    <script>
        alert('<%= request.getAttribute("errorMessage") %>');
    </script>
<% } %>
    
</body>
</html>