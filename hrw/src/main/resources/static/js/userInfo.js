document.addEventListener("DOMContentLoaded", function() {

    // 유효성 검사 함수
    function validateForm() {
        console.log("Validation form");

        // 아이디 검사: 영문, 숫자 6~20자
        var userId = document.getElementById("userId").value;
        var userIdPattern = /^[A-Za-z0-9]{6,20}$/;
        if (!userIdPattern.test(userId)) {
            alert("아이디는 영문, 숫자 6~20자여야 합니다.");
            return false;
        }

        // 비밀번호 검사: 영문, 숫자 6자리 이상
        var userPassword = document.getElementById("userPassword").value;
        var userPasswordPattern = /^[A-Za-z0-9]{6,}$/;
        if (!userPasswordPattern.test(userPassword)) {
            alert("비밀번호는 영문, 숫자로 6자리 이상이어야 합니다.");
            return false;
        }

        // 비밀번호 확인 검사
        var userPasswordAgain = document.getElementById("userPasswordAgain").value;
        if (userPassword !== userPasswordAgain) {
            alert("비밀번호가 일치하지 않습니다.");
            return false;
        }

        // 이름 검사
        var userName = document.getElementById("userName").value;
        if (userName.trim() === "") {
            alert("이름을 입력해주세요.");
            return false;
        }

        // 성별 검사
        var userGender = document.querySelector("#userGender").value;
        if (userGender === "") {
            alert("성별을 선택해주세요.");
            return false;
        }

        // 이메일 검사
        var userEmail = document.getElementById("userEmail").value;
        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        if (!emailPattern.test(userEmail)) {
            alert("유효한 이메일 주소를 입력해주세요.");
            return false;
        }

        // 연락처 검사: '-' 포함하여 입력
        var userPhone = document.getElementById("userPhone").value;
        var phonePattern = /^[0-9]{2,4}-[0-9]{3,4}-[0-9]{4}$/;
        if (!phonePattern.test(userPhone)) {
            alert("연락처를 ' -' 포함하여 올바르게 입력해주세요.");
            return false;
        }
        
        return true; // 모든 검사를 통과했을 때
    }

    // 폼 제출 이벤트에 유효성 검사 함수를 연결합니다.
    var userForm = document.getElementById("userForm");
    userForm.addEventListener("submit", function(event) {
        if (!validateForm()) {
            event.preventDefault(); // 유효성 검사에 실패하면 폼 제출을 막습니다.
        } else {
            // 유효성 검사를 통과하면 원하는 경로로 폼 제출 (예: '/member/update')
            submitForm('/member/update');
        }
    });

    // 기존의 JavaScript 코드
    function submitForm(action) {
        if (action === '/member/delete' && !confirm('정말 탈퇴하시겠습니까?')) {
            return;
        }

        var form = document.getElementById('userForm');
        form.action = action;
        form.submit(); // 폼을 직접 제출
    }
});
