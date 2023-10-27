<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HRW 매장 정보</title>

  <!-- 카카오맵 api -->
  <!-- 카카오API가져오기 -->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=485c800daaf7f4a608a950713639e97a"></script>
  <script src="../js/map/map.js"></script>

  <link rel="stylesheet" href="../css/map/map.css">

</head>
<body>

  <!-- 헤더 영역 -->
  <jsp:include page="include/header.jsp"/>
  
  <!-- 지도매장찾기 -->
  
  <div class="con_box find01">
    <div class="map_search_wrap">
      <div class="map_search">
        <div class="cont_text_wrap map_search_tab_wrap">
          <div class="search_tab">
            <ul>
              <li>매장찾기</li>
            </ul>
          </div>
        </div>

        <div class="cont_text_wrap map_search_box">
          <div class="cont_text_box map_search_title_wrap">
            <div class="cont_text cont_text_title">
              <strong>매장찾기</strong>
            </div>
            <div class="cont_text">함께하면 즐거운 HRW시네마</div>
            <div class="cont_text">
              <div class="input_text_wrap input_wrap">
                <label>
                  <input type="text" name="cinema_search" id="cinema_search" placeholder="지점명 또는 주소를 입력하세요" required="required">
                  <div class="search_icon">
                    <img src="../images/search_border_none.png" alt="검색">
                  </div>
                </label>
              </div>
            </div>
          </div>
          <div class="cont_text_box">
            <div class="cont_list cont_list1 cont_list_small cont_list_small1">
              <ul class="cinema_search_list">
                <div class="cinema_search_list_none">검색어가 없습니다.</div>
                <li>
                  <a onclick="panTo();">
                    <div class="cont_text">
                      <div class="cont_text_inner">
                        <b></b>
                      </div>
                      <div class="cont_text_inner cont_text_info">

                      </div>
                    </div>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>


  <!-- 카카오 API이용 <div id="map" class="map">  <div class="infowindow-content"> 건들지 말 것-->
  <div id="map" class="map" style="max-width:1440px; width:100%;height:700px; margin: 0 auto;">
    <div class="infowindow-content">
      <div class="cont_box mpa_point_info">
        <div class="cont_text_title cont_text_inner">
          <b></b>
        </div>
        <div class="cont_text_info cont_text_inner">
          
        </div>
        <div class="cont_text_info cont_text_inner">
          
        </div>
      </div>
    </div>
  </div>

  
    <!-- 푸터 영역 -->
  <jsp:include page="include/footer.jsp"/>

</body>
</html>