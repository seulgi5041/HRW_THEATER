window.addEventListener('DOMContentLoaded', function () {

  const searchIcons = document.getElementsByClassName('search_icon');
  const searchInput = document.getElementById('cinema_search');
  const searchList = document.querySelector('.cinema_search_list');
  const searchNoneMessage = document.querySelector('.cinema_search_list_none');
 
  var ps = new kakao.maps.services.Places();

  console.log(positions);

 

 //이미지를 클릭, 혹은 input창에서 엔터를 쳤을때 검색어가 반영되게 하기
 for (const searchIcon of searchIcons) {
  searchIcon.addEventListener('click', performSearch);
}

searchInput.addEventListener('keypress', function (event) {
  if (event.key === 'Enter') {
    performSearch();
  }
});

// Define the goTo function
function goTo(coordinates) {
  // Extract latitude and longitude from the coordinates object
  const { lat, lng } = coordinates;
  
  // Assuming 'map' is the variable referencing your Kakao Maps map object
  map.setCenter(new kakao.maps.LatLng(lat, lng));
}

  // 검색어를 입력하고 난 후에 실행할 것
  function performSearch() {
    const searchQuery = searchInput.value;
    searchList.innerHTML = ''; // Clear previous search results

    const matchingPositions = positions.filter((position) =>
      position.title.includes(searchQuery) || position.address.includes(searchQuery)
    );

    searchNoneMessage.style.display = matchingPositions.length === 0 && searchQuery.trim() !== '' ? 'block' : 'none';
      
    // 테스트용 검색 결과 찍어보기
    console.log('검색결과:', searchQuery);

    if (matchingPositions.length === 0) {
      // No matching results
      searchList.innerHTML = '<div class="cinema_search_list_none">검색어가 없습니다.</div>';
    } else {
      // Displaying matching results
      matchingPositions.forEach((position) => {
        const listItem = document.createElement('li');
        const link = document.createElement('a');
        const contText = document.createElement('div');
        const contTextInner = document.createElement('div');

        

        listItem.innerHTML = `
          <a onclick="goTo(0);">
            <div class="cont_text">
              <div class="cont_text_inner">
                <b>${position.title}</b>
              </div>
              <div class="cont_text_inner cont_text_info">
                ${position.address}
              </div>
            </div>
          </a>
        `;



        link.appendChild(contTextInner);
        listItem.appendChild(link);
        searchList.appendChild(listItem);

        link.onclick = function () {
          goTo({ lat: position.lat, lng: position.lng });
        };

      });
    }

    // Now perform your map-based search
    ps.keywordSearch(searchQuery, placesSearchCB);
  }

  function goTo(index) {
    if (index >= 0 && index < positions.length) {
      const latlng = positions[index].latlng;
      const lat = latlng.Ma;
      const lng = latlng.La;
  
      // Assuming 'map' is the variable referencing your Kakao Maps map object
      map.setCenter(new kakao.maps.LatLng(lat, lng));
    }
  }

  

  // Your existing code for map-based search
  function placesSearchCB(data, status) {
    if (status === kakao.maps.services.Status.OK) {
      // Handle the map-based search results
      // This code is outside the scope of your HTML updates
      // It should handle displaying markers or changing the map bounds
      // based on the search results.
    }
  }
});