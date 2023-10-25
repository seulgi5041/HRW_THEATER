window.addEventListener('DOMContentLoaded', function () {
  var mapContainer = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
      var mapOption = { //지도를 생성할 때 필요한 기본 옵션
          center: new kakao.maps.LatLng(37.48631642, 126.9052296), //지도의 중심좌표.
          level: 3 //지도의 레벨(확대, 축소 정도)
      };
  
      var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

  
      // 마커를 표시할 위치와 title 객체 배열입니다 
      var positions = [
        {
            title: '카카오', 
            latlng: new kakao.maps.LatLng(37.63570256, 127.1231209)
        },
        {
            title: '생태연못', 
            latlng: new kakao.maps.LatLng(37.56128867, 127.038382)
        },
        {
            title: '텃밭', 
            latlng: new kakao.maps.LatLng(37.48631642, 126.9052296)
        },
        {
            title: '근린공원',
            latlng: new kakao.maps.LatLng(37.55656147, 126.9402322)
        }
      ];

      // 마커 이미지의 이미지 주소입니다
      var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
          
      for (var i = 0; i < positions.length; i ++) {
          
          // 마커 이미지의 이미지 크기 입니다
          var imageSize = new kakao.maps.Size(24, 35); 
          
          // 마커 이미지를 생성합니다    
          var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
          
          // 마커를 생성합니다
          var marker = new kakao.maps.Marker({
              map: map, // 마커를 표시할 지도
              position: positions[i].latlng, // 마커를 표시할 위치
              title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
              image : markerImage, // 마커 이미지 
              clickable: true 
          });
          // 마커에 클릭이벤트를 등록합니다
      kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, positions[i].title));
    }

     // 마커 클릭 시 인포윈도우를 표시하는 함수
      function makeClickListener(map, marker, title) {
        return function() {
          var iwContent = '<div class="infowindow-content">' +
            '<div class="cont_box mpa_point_info">' +
              '<div class="cont_text_title cont_text_inner">' +
                '<b>' + title + '</b>' +
              '</div>' +
              '<div class="cont_text_info cont_text_inner">' +
                '서울특별시 서대문구 연세로 50 지하1층 (신촌동 , 연세대학교 공학원)' +
              '</div>' +
              '<div class="cont_text_info cont_text_inner">' +
                '1111-1111' +
              '</div>' +
            '</div>' +
          '</div>';
          
            var infowindow = new kakao.maps.InfoWindow({
                content: iwContent,
                removable: true
            });
            infowindow.open(map, marker);
        };
    }    
});