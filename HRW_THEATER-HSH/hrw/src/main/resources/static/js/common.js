document.addEventListener("DOMContentLoaded", function() {
    //테스트용. true로 바꾸면 로그인된 화면 볼 수 있음
    let isLoggedIn = false; 

    // Elements
    const loginList = document.getElementById("login_list");
    const loginLink = document.getElementById("login_link");
    const userNameElement = document.getElementById("userName");
    const login_user = document.getElementById("login_user");

    //콘솔 출력용
    if (!loginList || !loginLink || !userNameElement || !login_user) {
        console.error("요소를 찾을 수 없습니다.");
        return;
    }

    function updateMenuOnLogin() {
        if (isLoggedIn) {
            //로그인하면 보여질 메뉴들
            loginList.innerHTML = `
                <li><a href="#">주문 확인</a></li>
                <li><a href="#">정보 확인</a></li>
                <li><a href="#" id="logout_link">로그아웃</a></li>
            `;

            //실제로는 사용자의 이름을 넣어야 함. 지금은 테스트로 user 넣어봄
            userNameElement.textContent = "user"; 
            login_user.style.display = "block";

            const logoutLink = document.getElementById("logout_link");
            if (logoutLink) {
                logoutLink.addEventListener("click", function() {
                    
                    isLoggedIn = false;
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

            loginLink.addEventListener("click", function() {
                
                isLoggedIn = true;
                updateMenuOnLogin();
            });
        }
    }

    
    updateMenuOnLogin();


    window.addEventListener("scroll", function() {
        const scrollPosition = window.scrollY; 
        const topButton = document.getElementById("go_top"); 
        const headerMenu = document.getElementById("header_menu");
    
        if (scrollPosition > 90) {
            topButton.style.display = "block";
        } else {
            topButton.style.display = "none";
        }
    
        if (scrollPosition > 120) {
            headerMenu.style.width = "100%";
            // headerMenu.style.height = "70px";
            headerMenu.style.position = "fixed";
            headerMenu.style.zIndex = "999";
            headerMenu.style.top = "0px";
            // headerMenu.style.marginTop = "10px";
            headerMenu.style.backgroundColor = "#F5F4F2"; 
            headerMenu.style.borderBottom = "2px solid #FB3D28";
        } else {
            headerMenu.style.position = "static";
            headerMenu.style.backgroundColor = "transparent"; 
            headerMenu.style.borderBottom = "transparent";
        }
    });
    
});
