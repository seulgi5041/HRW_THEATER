window.addEventListener('DOMContentLoaded', function () {
  const markers = [];
  let places = [];
  const cinemaAddressEntity = [];


  const mapContainer = document.getElementById("map");
  const mapOption = {
    center: new window.kakao.maps.LatLng(37.566826, 126.9786567),
    level: 3,
  };
  const map = new window.kakao.maps.Map(mapContainer, mapOption);

  const searchIcon = document.querySelector('.search_icon');
  const searchInput = document.getElementById('cinema_search');


  searchIcon.addEventListener('click', searchPlaces);
  
  searchInput.addEventListener('keypress', function (event) {
    if (event.key === 'Enter') {
      searchPlaces();
    }
  });



  function searchPlaces() {
    const keyword = searchInput.value.trim();
    console.log('Keyword:', keyword);

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

    const imageSrc = "../images/marker.png";
    const imageSize = new window.kakao.maps.Size(36, 37);
    const imgOptions = { offset: new kakao.maps.Point(27, 69) };

    const markerImage = new window.kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions);
    const markerPosition = new kakao.maps.LatLng(place.y, place.x);

    const marker = new window.kakao.maps.Marker({
      map,
      position: markerPosition,
      image: markerImage,
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
    console.log('Displaying places:', places);

    const listEl = document.querySelector('.cinema_search_list');
    removeAllChildNodes(listEl);
    //removeMarker();

    if (places.length === 0) {
      listEl.innerHTML = '<div class="cinema_search_list_none">검색 결과가 없습니다.</div>';
    } else {
      const fragment = document.createDocumentFragment();

      
      places.forEach((place, index) => {
        //const placePosition = new window.kakao.maps.LatLng(place.y, place.x);
        displayMarker(place);
        
        const itemEl = getListItem(index, place);

        itemEl.addEventListener("click", function () {
          console.log('Clicked item coordinates (y, x):', place.y, place.x);
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

  

  // Process the cinemaAddressEntity data to create places array
cinemaAddressEntity.forEach((cinemaAddressEntity) => {
  const cinemaAddressDTO = {
    cinemaName: cinemaAddressEntity.cinemaName,
    address: cinemaAddressEntity.address,
    tell: cinemaAddressEntity.tell,
    xAxis: cinemaAddressEntity.xAxis,
    yAxis: cinemaAddressEntity.yAxis,
  };

  const place = {
    title: cinemaAddressDTO.cinemaName,
    y: parseFloat(cinemaAddressDTO.yAxis),
    x: parseFloat(cinemaAddressDTO.xAxis),  
    address: cinemaAddressDTO.address,
    phone: cinemaAddressDTO.tell,
  };

  places.push(place);
});

// Fetch new data and display markers on the map
fetch('/api/getCinemaData')
  .then((response) => {
    if (!response.ok) {
      throw new Error('Network response was not ok');
    }
    return response.json(); // Assuming the server returns JSON data
  })
  .then((data) => {
    // Process the data and add it to the places array
    data.forEach((cinemaAddressDTO) => {
      const place = {
        title: cinemaAddressDTO.cinemaName,
        y: parseFloat(cinemaAddressDTO.yaxis),
        x: parseFloat(cinemaAddressDTO.xaxis), 
        address: cinemaAddressDTO.address,
        phone: cinemaAddressDTO.tell,
      };
      places.push(place);

      console.log(`x: ${place.y}, y: ${place.x}`);

      displayMarker(place);
    });
  })
  .catch((error) => {
    console.error('There was a problem with the fetch operation:', error);
  });

  

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


  // 사용하지 않는 부분(페이지 넘기는 부분인데 사용하지 않지만, 안정성을)
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