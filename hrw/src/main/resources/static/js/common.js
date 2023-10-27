document.addEventListener("DOMContentLoaded", function() {
    // 로그인 상태 및 사용자 이름은 header.jsp에서 이미 설정된 상태
	
    // Elements
    const loginList = document.getElementById("login_list");
    const loginLink = document.getElementById("login_link");
    const userNameElement = document.getElementById("userName");
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
                <li><a href="#">정보 확인</a></li>
                <li><a href="#" id="logout_link">로그아웃</a></li>
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
            `;
            userNameElement.textContent = "";
            login_user.style.display = "none";
        }
    }

    updateMenuOnLogin();

    window.addEventListener("scroll", function() {
        const scrollPosition = window.scrollY; 
        const headerMenu = document.getElementById("header_menu");

        if (scrollPosition > 120) {
            headerMenu.style.width = "100%";
            headerMenu.style.position = "fixed";
            headerMenu.style.zIndex = "999";
            headerMenu.style.top = "0px";
            headerMenu.style.backgroundColor = "#F5F4F2"; 
            headerMenu.style.borderBottom = "2px solid #FB3D28";
        } else {
            headerMenu.style.position = "static";
            headerMenu.style.backgroundColor = "transparent"; 
            headerMenu.style.borderBottom = "transparent";
        }
    });
});
