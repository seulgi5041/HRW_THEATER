document.addEventListener("DOMContentLoaded", function() {
    // 로그인 상태 및 사용자 이름은 header.jsp에서 이미 설정된 상태
   
    // Elements
    const loginList = document.getElementById("login_list");
    const loginLink = document.getElementById("login_link");
    const userNameElement = document.getElementById("user_Name");
    const login_user = document.getElementById("login_user");

    if (!loginList || !loginLink) {
        console.error("loginList 또는 loginLink 요소를 찾을 수 없습니다.");
        return;
    }

    if (isLoggedIn === "true" && (!userNameElement || !login_user)) {
        console.error("userNameElement 또는 login_user 요소를 찾을 수 없습니다.");
        return;
    }

    function updateMenuOnLogin() {
        if (isLoggedIn === "true") {
            //로그인하면 보여질 메뉴들
            loginList.innerHTML = `
                <li><a href="#">주문 확인</a></li>
                <li><a href="/member/userInfo">정보 확인</a></li>
                <li><a href="/question/list">문의 하기</a></li>
                <li><a href="/member/logout" id="logout_link">로그아웃</a></li>
            `;

            // 로그인된 사용자의 이름 설정
            userNameElement.textContent = loggedUserName; 
            login_user.style.display = "block";

            const logoutLink = document.getElementById("logout_link");
            if (logoutLink) {
                logoutLink.addEventListener("click", function() {
                    isLoggedIn = "false";
                    updateMenuOnLogin();
                });
            }
        } else {
            //로그아웃을 했을때 원래의 메뉴로 되돌아감
            loginList.innerHTML = `
                <li><a href="/member/login" id="login_link">로그인</a></li>
                <li><a href="/member/join">회원가입</a></li>
                <li><a href="/question/list">문의 하기</a></li>
            `;
            userNameElement.textContent = "";
            login_user.style.display = "none";
        }
    }

    updateMenuOnLogin();

});