window.addEventListener('DOMContentLoaded', function () {
  const markers = [];

  const mapContainer = document.getElementById("map");
  const mapOption = {
    center: new window.kakao.maps.LatLng(37.566826, 126.9786567),
    level: 3,
  };
  const map = new window.kakao.maps.Map(mapContainer, mapOption);

  const ps = new window.kakao.maps.services.Places();
  const infowindow = new window.kakao.maps.InfoWindow({ zIndex: 1 });

  const searchIcon = document.querySelector('.search_icon');
  const searchInput = document.getElementById('cinema_search');
  // const searchList = document.querySelector('.cinema_search_list');
  // const searchNoneMessage = document.querySelector('.cinema_search_list_none');

  searchIcon.addEventListener('click', searchPlaces);
  
  searchInput.addEventListener('keypress', function (event) {
    if (event.key === 'Enter') {
      searchPlaces();
    }
  });

  function searchPlaces() {
    const keyword = searchInput.value.trim();

    if (!keyword) {
      alert('키워드를 입력해주세요!');
      return;
    }

    const matchingPositions = places.filter((position) =>
      position.title.includes(keyword) || position.address.includes(keyword)
    );

    displayPlaces(matchingPositions);
  }

  function displayMarker(place) {
    const marker = new window.kakao.maps.Marker({
      map,
      position: new window.kakao.maps.LatLng(place.y, place.x),

    });
    
    var iwRemoveable = true;
    const infowindow = new window.kakao.maps.InfoWindow({
      content: `
        <div class="infowindow-content">
          <div class="cont_box mpa_point_info">
            <div class="cont_text_title cont_text_inner">
              <b>${place.title}</b>
            </div>
            <div class="cont_text_info cont_text_inner">
              ${place.address}
            </div>
            <div class="cont_text_info cont_text_inner">
              ${place.phone}
            </div>
          </div>
        </div>
      `,
      removable: iwRemoveable
    });
  
    window.kakao.maps.event.addListener(marker, "click", function () {
      // Open the InfoWindow and assign the marker to it
      infowindow.open(map, marker);
      map.panTo(new kakao.maps.LatLng(place.y, place.x));
    
      // Add an event listener to the close button
      const closeInfowindowButton = document.getElementById("closeInfowindow");
      if (closeInfowindowButton) {
        closeInfowindowButton.addEventListener("click", function () {
          infowindow.close();
        });
      }
      });
    }


  function displayPlaces(places) {
    const listEl = document.querySelector('.cinema_search_list');
    removeAllChildNodes(listEl);
    removeMarker();

    if (places.length === 0) {
      listEl.innerHTML = '<div class="cinema_search_list_none">검색 결과가 없습니다.</div>';
    } else {
      const fragment = document.createDocumentFragment();

      places.forEach((place, index) => {
        const placePosition = new window.kakao.maps.LatLng(place.y, place.x);
        displayMarker(place);
        const itemEl = getListItem(index, place);

        itemEl.addEventListener("click", function () {
          map.panTo(new window.kakao.maps.LatLng(place.y, place.x));
        });

        fragment.appendChild(itemEl);
      });

      listEl.appendChild(fragment);
    }
  }

  function getListItem(index, place) {
    const li = document.createElement("li");
    li.className = "item";

    li.innerHTML = `
      <a href="#">
        <div class="cont_text">
          <div class="cont_text_inner">
            <b>${place.title}</b>
          </div>
          <div class="cont_text_inner cont_text_info">
            ${place.address}
          </div>
        </div>
      </a>
    `;

    return li;
  }

  // Example usage:
  const places = [
    {
      title: 'HRW 가산디지털',
      x: 127.1231209,
      y: 37.63570256,
      address: '서울특별시 서대문구 연세로 50 지하1층 (신촌동 , 연세대학교 공학원)',
      phone: '1111-1111',
    },
    {
      title: 'HRW 구월',
      x: 126.7018872,
      y: 37.4519298,
      address: '인천광역시 남동구 백범로 어쩌구 (구월동 , 인천직능원)',
      phone: '1111-1111',
    },
    {
      title: 'HRW 광주어딘가',
      x: 126.8503422,
      y: 35.21647002,
      address: '광주광역시 남동구 백범로 어쩌구 (구월동 , 인천직능원)',
      phone: '1111-1111',
    },
    {
      title: 'HRW 해운대',
      x: 129.1296309,
      y: 35.16892183,
      address: '부산광역시 남동구 백범로 어쩌구 (구월동 , 인천직능원)',
      phone: '1111-1111',
    },
  ];


  function addMarker(position, idx) {
    const imageSrc =
      "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png";
    const imageSize = new window.kakao.maps.Size(36, 37);
    const imgOptions = {
      spriteSize: new window.kakao.maps.Size(36, 691),
      spriteOrigin: new window.kakao.maps.Point(0, idx * 46 + 10),
      offset: new window.kakao.maps.Point(13, 37),
    };

    const markerImage = new window.kakao.maps.MarkerImage(
      imageSrc,
      imageSize,
      imgOptions
    );

    const marker = new window.kakao.maps.Marker({
      position,
      image: markerImage,
    });

    marker.setMap(map);
    markers.push(marker);

    return marker;
  }

  function removeMarker() {
    for (let i = 0; i < markers.length; i++) {
      markers[i].setMap(null);
    }
    markers.length = 0;
  }

  function displayPagination(pagination) {
    const paginationEl = document.getElementById("pagination");
    const fragment = document.createDocumentFragment();
    while (paginationEl?.hasChildNodes()) {
      paginationEl.removeChild(paginationEl.lastChild);
    }

    for (let i = 1; i <= pagination.last; i++) {
      const el = document.createElement("a");
      el.href = "#";
      el.innerHTML = String(i);

      if (i === pagination.current) {
        el.className = "on";
      } else {
        el.onclick = (function (i) {
          return function () {
            pagination.gotoPage(i);
          };
        })(i);
      }

      fragment.appendChild(el);
    }
    paginationEl?.appendChild(fragment);
  }

  function removeAllChildNodes(el) {
    while (el.hasChildNodes()) {
      el.removeChild(el.lastChild);
    }
  }
});
