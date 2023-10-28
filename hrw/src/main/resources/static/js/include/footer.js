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

