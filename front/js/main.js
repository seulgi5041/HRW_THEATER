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


//포스터 체인지 되는 부분
  function changePoster(movieTitle) {
    const moviePoster = document.getElementById("moviePoster");
    const movieid = getMovieIdByTitle(movieTitle);

    const posterPath = `../images/poster_rank/${movieid}.jpg`;
  
    // 포스터 이미지 변경
    moviePoster.src = posterPath;
  }
  
  // 영화 제목에 따라 movieid를 반환하는 함수
  function getMovieIdByTitle(movieTitle) {
    // posterMapping 객체를 사용하여 영화 제목에 해당하는 movieid 출력.
    // 객체에 해당하는 제목이 없는 경우, 'unknown' 으로 설정 이건 필요한대로 바꿔주세요
    return posterMapping[movieTitle] || 'unknown';
  }
  
  //딕셔너리 형식으로 포스터 바뀌게 해놨는데, 테스트 구간이라 간략하게 3개만 집어넣었습니다.
  //이 부분은 데이터 전부 가져온 후에 합시다
  //순서는 테이블에 적힌 제목과 포스터 id 입니다.
  const posterMapping = {
    '30일': '20228819',
    '1947 보스톤': '20197122',
    '천박사 퇴마 연구소: 설경의 비밀': '20227410',
    'title' : '20228819',
    
  };
  
  const spanElements = document.querySelectorAll(".ellip");
  spanElements.forEach(function (span) {
    span.addEventListener("click", function () {
      const movieTitle = span.textContent;
      const movieId = getMovieIdByTitle(movieTitle);
      const posterImage = document.getElementById("moviePoster");
      //테이블 이미지 movieId를 alt값에도 적용
      posterImage.alt = movieId;

      changePoster(movieTitle);
    });
  });




//검색부분
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



