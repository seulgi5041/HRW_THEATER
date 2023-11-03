$(document).ready(function() {
  var locations = ["서울", "경기", "인천", "부산", "대구", "광주", "대전", "울산", "세종", "강원", "충청", "전라", "경상", "제주"];

  locations.forEach(function(location) {
    var ulId = location.toLowerCase() + "CinemaList";
    var ul = $("#" + ulId);

    $.get("/getCinemaNamesInLocation?location=" + location, function(data) {
      ul.empty();
      data.forEach(function(cinemaName) {
        var li = $("<li class><a href='#none'>" + cinemaName + "</a></li>");
        ul.append(li);
      });
    });
  });
});