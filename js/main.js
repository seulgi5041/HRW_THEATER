document.addEventListener("DOMContentLoaded", function () {
  function handleZoomEffect() {
    const imageContainers = document.querySelectorAll(".image_container");

    imageContainers.forEach((container) => {
      const imageBox = container.querySelector(".image_box");
      const zoomImage = container.querySelector(".zoom_image");
      const overlay = container.querySelector(".overlay");

      if (zoomImage) {
        imageBox.addEventListener("mouseover", () => {
          imageBox.style.transform = "scale(1.2)";
          overlay.style.transform = "scale(1.2)";
        });

        imageBox.addEventListener("mouseout", () => {
          imageBox.style.transform = "scale(1)";
          overlay.style.transform = "scale(1)";
        });
      }
    });
  }

  function overlayEffect() {
    const overlays = document.querySelectorAll(".overlay");

    overlays.forEach((overlay) => {
      const buttons = overlay.querySelectorAll("button");

      overlay.addEventListener("mouseover", () => {
        overlay.style.background = "rgba(0, 0, 0, 0.7)";
        buttons.forEach((button) => {
          button.style.display = "block";
        });
      });

      overlay.addEventListener("mouseout", () => {
        overlay.style.background = "rgba(0, 0, 0, 0)";
        buttons.forEach((button) => {
          button.style.display = "none";
        });
      });
    });
  }

  handleZoomEffect();
  overlayEffect();




const searchInput = document.getElementById("searchInput");
const searchButton = document.getElementById("searchButton");

searchInput.addEventListener("keyup", function(event) {
  if (event.key === "Enter") {
    performSearch(); 
  }
});

searchButton.addEventListener("click", function() {
  performSearch();  
});

function performSearch() {
  const searchQuery = searchInput.value;
  alert("검색결과(나중에 쿼리문 사용 수정) " + searchQuery);
}
});



