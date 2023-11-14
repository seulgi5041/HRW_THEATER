# HRW_CINEMA

팀프로젝트

-메인 설명-
1. 영화 사이트 구현
2. 현재 상영중인 상영작들을 슬라이드로 나열해줌
3. 현재 상영중인 상영작들의 순위를 보여주며, 각 상영작들의 순위가 어떻게 변화하였는지 증감률을 계산하여 띄워줌
4. 사용자의 검색을 바탕으로 추천작들을 선정해줌
5. 추천작은 현재 상영중인 영화를 기준으로 하나, 일치하는 검색결과가 없을 때에는 지난 상영작들의 목록들을 보여줌
6. 추천작 중 현재 상영중인 영화가 있으면, 자세히보기 페이지와 예매하기 페이지로 넘어갈 수 있음
7. 지난 상영작들을 자세히보기만 제공됨
8. 예매하기 페이지에서는 지역, 상영관, 영화, 날짜, 시간표를 선택할 수 있으며
9. 다음 단계에서 좌석을 선택할 수 있음
10. 일반 예매 사이트와 다르게, 좌석을 선택 후 음식선택을 함께 포함하여 사용자의 편의성을 증가시킴
11. 음식은 선택할수도 있으며, 선택하지 않을 수도 있음
12. 음식선택까지 끝났다면 결제하기로 넘어가, 내가 선택한 사항들을 다시 한번 확인한 후에 결제 과정을 거침
13. 결제가 완료되면, 결제정보가 간략하게 뜸

-그 외 메뉴 설명-
1. 매장 보기는 카카오 API로 구현하였음
1-1. 검색창에 주소, 혹은 지점명의 일부만 검색 후 원하는 상영관을 찾을 수 있음
1-2. 상영관을 찾아 클릭하면 해당 상영관의 위치로 마커를 이동시킬 수 있으며, 간략한 정보가 윈포윈도우로 출력되고 있음
2. 예매는 현재 상영중인 모든 영화들의 예매를 진행할 수 있음
2-1. 예매하기 버튼을 누르면 예매페이지로 넘어가게 되어 위의 메인설명에 설명한 8번부터의 과정을 거침
2-2. 자세히보기 버튼을 누르면 영화의 정보들을 볼 수 있는 페이지로 넘어감
3. 푸드스토어는 영화를 제외하고 음식만 주문하고 싶어하는 사용자들을 위해 구현함

-로그인 시-
1. 로그인 성공 시, 메뉴 상단에 ${userName}을 환영하는 문구가 띄워짐
2. 로그인 시 메뉴바는 자바스크립트로 구현함(주문확인, 정보확인, 로그아웃)
3. 로그아웃 버튼을 누르면 다시 로그인 페이지로 돌아오며 환영문구도 함께 사라짐
4. 주문확인에서는 사용자가 주문한 내역을 확인할 수 있음
5. 정보확인에서는 사용자의 정보를 확인 또는 수정할 수 있음