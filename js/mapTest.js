window.addEventListener('DOMContentLoaded', function () {
  // 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});


// HTML input element
var inputField = document.getElementById('cinema_search');

// Event listener to handle "Enter" key press in the input field
inputField.addEventListener('keypress', function (event) {
  if (event.key === 'Enter') {
    searchPlaces();
  }
});

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

  var keyword = inputField.value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

  var listEl = document.querySelector('.cinema_search_list');
  var searchNoneMessage = document.querySelector('.cinema_search_list_none');

   // Clear the list
   listEl.innerHTML = '';

  if (places.length === 0) {
    searchNoneMessage.style.display = 'block';
  } else {
    searchNoneMessage.style.display = 'none';
  }

  // Create and append search result items
  places.forEach(function (place) {
    var listItem = getListItem(place);
    listEl.appendChild(listItem);
  });
}

  
// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(places) {
  var listItem = document.createElement('li');
  var link = document.createElement('a');
  var contText = document.createElement('div');
  var contTextInner = document.createElement('div');
  contTextInner.innerHTML = `<b>${places.place_name}</b>`;

  listItem.innerHTML = `
    <a onclick="goTo({ lat: ${places.y}, lng: ${places.x} })">
      <div class="cont_text">
        <div class="cont_text_inner">
          <b>${places.place_name}</b>
        </div>
        <div class="cont_text_inner cont_text_info">
          ${places.road_address_name ? places.road_address_name : places.address_name}
        </div>
      </div>
    </a>
  `;
  link.appendChild(contTextInner);
  listItem.appendChild(link);
  return listItem;
  }



    

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}


// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}

});