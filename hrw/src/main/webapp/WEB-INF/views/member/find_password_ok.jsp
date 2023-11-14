<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기 결과</title>
    <link rel="stylesheet" href="../css/member/result/find_password_ok.css">

</head>
<body>
    <jsp:include page="../include/header.jsp"/>

    <div class="container">
        <div class="store_title">
            <h3 class="title">비밀번호 재설정</h3>
            <div class="block_color"></div>
        </div>
        <h5 class="subtitle">
            비밀번호를 변경해 주세요.<br>
            다른 아이디나 사이트에서 사용한 적 없는 안전한 비밀번호로 변경해 주세요.
        </h5>

        <form method="post" action="/member/resetPassword"> <!-- 액션 수정 -->
            <div class="password-display">
                <div class="input-display">
                    <p>HRW 아이디: ${foundUserId}<br>
                    <input type="hidden" name="foundUserId" value="${foundUserId}">
                    <input type="password" name="userPassword" placeholder="새 비밀번호" maxlength="20"><br>
                    <input type="password" name="userPasswordAgain" placeholder="새 비밀번호 확인" maxlength="20"> <!-- 새 비밀번호 확인 필드 추가 -->
                    <hr>
                </div>
                <ol>
                    <li>영문, 숫자, 특수문자를 함께 사용하면 (6자 이상 20자 이하)보다 안전합니다.
                    <li>다른 사이트와 다른 HRW 아이디만의 비밀번호를 만들어 주세요.
                </ol>
            </div>
            <p>
                <input type="submit" value="확인">
            </p>
        </form>
    </div>
    <jsp:include page="../include/footer.jsp"/>
</body>

</html>