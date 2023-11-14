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



  /**영화 정보 변경 */
  /*로드 한직후엔 첫번째 영화띄워주기*/
  window.addEventListener('load', async function() {
    const firstMovie = document.querySelector('[data-movie-code]'); // 첫 번째 영화 요소
    const movieCode = firstMovie.getAttribute('data-movie-code'); // 영화 코드
    const movieTitle = firstMovie.textContent; // 영화 제목
  
    changePoster(movieCode); // 포스터 이미지 변경
    var movie_data = await box_office_info(movieCode); // 영화 정보
    changeMovieInfo(movie_data, movieTitle); // 영화 코드에 맞는 정보로 변경
  });

  function changeMovieInfo(movie_data, movieTitle){
    console.log(movie_data)

    document.getElementById("movieNm").textContent = movieTitle;
    document.getElementById("movieNmEn").textContent = movie_data.get('영문명') || '정보없음';
    document.getElementById("openDt_api").textContent = movie_data.get('개봉일') || '정보없음';
    document.getElementById("typeNm_api").textContent = movie_data.get('영화구분') || '정보없음';
    document.getElementById("peopleNm_api").textContent = movie_data.get('출연진') || '정보없음';
    document.getElementById("watchGradeNm_api").textContent = movie_data.get('관람등급') || '정보없음';
    document.getElementById("showTm_api").textContent = movie_data.get('상영시간') || '정보없음';
    document.getElementById("nationNm_api").textContent = movie_data.get('제작국가') || '정보없음';
    document.getElementById("peopleNmEn_api").textContent = movie_data.get('감독') || '정보없음';
    document.getElementById("genreNm_api").textContent = movie_data.get('장르') || '정보없음';
    document.getElementById("companyNm_api").textContent = movie_data.get('배급사') || '정보없음';

  
  };

      

async function box_office_info(movieCode){
  var apiKey = 'c5df5d07dd8a15b2f5d00f6c21e37cc1';
  var url = 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key='+apiKey+'&movieCd='+movieCode;
  
  try {
    var response = await fetch(url);
    if (!response.ok) {
      throw new Error('영화 정보를 가져오는 중 오류가 발생했습니다.');
    }

    var data = await response.json();
    var movieInfo = data.movieInfoResult.movieInfo; 

    const movieInfoMap = new Map();

    movieInfoMap.set('영문명', movieInfo.movieNmEn );
    movieInfoMap.set('개봉일', movieInfo.openDt);
    movieInfoMap.set('영화구분', movieInfo.typeNm);
    movieInfoMap.set('출연진', movieInfo.actors.map(actor => actor.peopleNm).join(', '));
    movieInfoMap.set('관람등급', movieInfo.audits[0].watchGradeNm);
    movieInfoMap.set('상영시간', movieInfo.showTm);
    movieInfoMap.set('제작국가', movieInfo.nations[0].nationNm);
    movieInfoMap.set('감독', movieInfo.directors[0].peopleNm);
    movieInfoMap.set('장르', movieInfo.genres[0].genreNm);
    movieInfoMap.set('배급사', movieInfo.companys.filter(company => company.companyPartNm === '배급사')
    .map(company => company.companyNm).join(', '));


    return movieInfoMap;
  } catch (error) {
    console.error(error);
  }
}



//포스터 체인지 되는 부분
  function changePoster(movieCode) {
    
    const moviePoster = document.getElementById("moviePoster");
    const posterPath = `./images/poster_rank/${movieCode}.jpg`;
    
    // 포스터 이미지 변경
    moviePoster.src = posterPath;
    moviePoster.alt = movieCode;

    const top10_list_detail_btn = document.getElementById("top10_list_movie_detail");
    const top10_list_ticketing_btn = document.getElementById("top10_list_movie_ticketing");
    top10_list_detail_btn.name=movieCode
    top10_list_ticketing_btn.name=movieCode

  }
  
  const spanElements = document.querySelectorAll(".ellip");
spanElements.forEach(function (span) {
  span.addEventListener("click", async function () {
    const movieCode = span.getAttribute("data-movie-code"); // 영화코드
    const movieTitle = span.textContent; // 영화제목
    changePoster(movieCode); // 영화 코드를 넘겨주어 포스터를 변경합니다.
    var movie_data = await  box_office_info(movieCode); // 영화정보
    changeMovieInfo(movie_data, movieTitle); // 영화코드에 맞는 정보로 변경

  });
});

/*상세보기 , 예매 버튼클릭시 겟매핑으로 정보전달하여 링크*/

const movie_detail_btn = document.querySelectorAll(".movie_detail");
const movie_ticketing_btn = document.querySelectorAll(".movie_ticketing");

movie_detail_btn.forEach(button => {
    button.addEventListener("click", function () {
        var movieCode = this.getAttribute("name");
        var movie_detail_link = "/movieinfo?code="+movieCode;
        window.location.href = movie_detail_link;
    });
});

movie_ticketing_btn.forEach(button => {
    button.addEventListener("click", function () {
        var movieCode = this.getAttribute("name");
        var movie_ticketing_link = "/reservation/first?code="+movieCode;
        window.location.href = movie_ticketing_link;
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
  //alert("검색결과(나중에 쿼리문 사용 수정) " + searchQuery);
  let form = document.createElement('form');
    
    let obj;
    obj = document.createElement('input');
    obj.setAttribute('type', 'text');
    obj.setAttribute('name', 'searchQuery');
    obj.setAttribute('value', searchQuery);
    
    form.appendChild(obj);
    form.setAttribute('method', 'post');
    form.setAttribute('action', '/movierecommend');
    document.body.appendChild(form);
    form.submit();
}





});

