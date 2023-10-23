<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보</title> 
    <link rel="stylesheet" href="../css/member/form/userInfo.css"> 
</head>
<body> 
    <jsp:include page="../include/header.jsp"/>

    <div class="container">
       
        <div class="word">
        
            <h2>회원 프로필</h2>

        </div>
        
        <hr>

        <form action="" id = "userForm" method="post">
            <div class="input-container"> 
                <div class="input-group">
                    <label for="userId">* 아이디</label>
                    <input type="text" id="userId" name="userId" placeholder="아이디 보일 곳! 고치지 못하게!" readonly maxlength="20">
                </div>

                <div class="input-group">
                    <label for="userPw">* 비밀번호</label>
                    <input type="password" id="userPassword" name="userPassword" placeholder="영문,숫자(6자리 이상)" maxlength="20" required="required">
                </div> 

                <div class="input-group">
                    <label for="u_m_pw_again">* 비밀번호 확인</label>
                    <input type="password" id="userPasswordAgain" name="userPasswordAgain" placeholder="비밀번호 확인" maxlength="20" required="required">
                </div>

                <div class="input-group">
                    <label for="user_Name">* 이름</label>
                    <input type="text" id="userName" name="userName" placeholder="이름" maxlength="20" required="required">
                </div>

                <div class="input-group">
                    <label for="u_m_gender">* 성별</label>
                    <select id="u_m_gender" name="userGender">
                        <option value="">성별</option>
                        <option value="M">남성</option>
                        <option value="W">여성</option>
                    </select>
                </div>

                <div class="input-group">
                    <label for="user_Email">* 이메일</label>
                    <input type="email" id="userEmail" name="userEmail" placeholder="이메일" required="required">
                </div>

                <div class="input-group">
                    <label for="user_Phone">* 연락처</label>
                    <input type="text" id="userPhone" name="userPhone" placeholder="연락처(' -'포함하여 입력)" maxlength="20" required="required">
                </div>

				<div class="button-group">
				        <input type="button" value="회원 수정" class="big-button" onclick="submitForm('/member/update');">
				        <input type="button" value="회원 탈퇴" class="big-button" onclick="submitForm('/member/delete');">
				</div>
            </div>
        </form>
    </div>

    <jsp:include page="../include/footer.jsp"/>
    <script>
    function submitForm(action) {
        if (action === '/member/delete' && !confirm('정말 탈퇴하시겠습니까?')) {
            return;
        }

        var form = document.getElementById('userForm');
        form.action = action;
        form.submit();
    }
    </script>
 
</body>
</html>