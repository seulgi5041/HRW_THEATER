
document.addEventListener("DOMContentLoaded", function() {
    var form = document.querySelector("form");
    form.addEventListener("submit", function(e) {
        if (!validateForm()) {
            e.preventDefault();
        }
    });

    function validateForm() {
        // 아이디 검사: 영문, 숫자 6~20자
        var userId = document.getElementById("user_ID").value;
        var userIdPattern = /^[A-Za-z0-9]{6,20}$/;
        if (!userIdPattern.test(userId)) {
            alert("아이디는 영문, 숫자 6~20자여야 합니다.");
            return false;
        }

        // 비밀번호 검사: 영문, 숫자 6자리 이상
        var userPassword = document.getElementById("user_PW").value;
        var userPasswordPattern = /^[A-Za-z0-9]{6,}$/;
        if (!userPasswordPattern.test(userPassword)) {
            alert("비밀번호는 영문, 숫자로 6자리 이상이어야 합니다.");
            return false;
        }

        // 비밀번호 확인 검사
        var userPasswordAgain = document.getElementById("user_PW_Again").value;
        if (userPassword !== userPasswordAgain) {
            alert("비밀번호가 일치하지 않습니다.");
            return false;
        }

        // 이름 검사
        var userName = document.getElementById("user_Name").value;
        if (userName.trim() === "") {
            alert("이름을 입력해주세요.");
            return false;
        }

        // 성별 검사
        var userGender = document.getElementById("user_Gender").value;
        if (userGender === "") {
            alert("성별을 선택해주세요.");
            return false;
        }

        // 이메일 검사
        var userEmail = document.getElementById("user_Email").value;
        var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        if (!emailPattern.test(userEmail)) {
            alert("유효한 이메일 주소를 입력해주세요.");
            return false;
        }

        // 연락처 검사: '-' 포함하여 입력
        var userPhone = document.getElementById("user_Phone").value;
        var phonePattern = /^[0-9]{2,4}-[0-9]{3,4}-[0-9]{4}$/;
        if (!phonePattern.test(userPhone)) {
            alert("연락처를 ' -' 포함하여 올바르게 입력해주세요.");
            return false;
        }
        
        return true; // 모든 검사를 통과했을 때
    }


    /*중복 */
    const double_check_btn = document.getElementById('double_check_btn');
    double_check_btn.addEventListener("click", function(){
        let userId = document.getElementById("user_ID").value;
        var userIdPattern = /^[A-Za-z0-9]{6,20}$/;
        if (!userIdPattern.test(userId)) {
            alert("아이디는 영문, 숫자 6~20자여야 합니다.");
            return false;
        }

    const xhr = new XMLHttpRequest();
    xhr.open("POST", "/idDoubleCheck", true);

    // HTTP 요청 헤더 설정
    xhr.setRequestHeader("Content-Type", "application/json");

    xhr.onload = function() {
        if (xhr.status === 200) {
            const response = parseInt(xhr.responseText);
            if (response === 0) {
                alert("사용 가능한 아이디입니다.")
            } else {
                alert("이미 사용 중인 아이디입니다.")
            }
        } else {
            alert("서버 오류가 발생했습니다.")
        }
    };

    // 데이터를 JSON 문자열로 변환하여 body에 설정
    const data = JSON.stringify({ user_Id : userId });

    xhr.send(data);
    });
});