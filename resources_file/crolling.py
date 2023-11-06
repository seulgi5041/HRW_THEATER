
import time
import os
import requests
from selenium import webdriver
from bs4 import BeautifulSoup
import re
import pymysql

# 크롬 드라이버 경로 설정
driver_path = r"C:\FileIO\chromedriver.exe"

# 크롬 드라이버 옵션 설정
chrome_options = webdriver.ChromeOptions()
chrome_options.add_argument("--disable-gpu")
chrome_options.add_argument("--headless")

# 크롬 드라이버 초기화 및 웹 브라우저 열기
driver = webdriver.Chrome(options=chrome_options)

# 웹 페이지 열기
url = "https://www.kobis.or.kr/kobis/business/stat/boxs/findFormerBoxOfficeList.do"
driver.get(url)

# 팝업 창을 여는 함수 정의
def open_popup(title_element):
    script = title_element['onclick']
    movie_code = script.split("('movie','")[1].split("');")[0]
    driver.execute_script(script)
    return movie_code

# 디렉토리 생성 및 이미지 저장 경로 설정
image_dir = r"C:\FileIO\movies\moviePoster"
os.makedirs(image_dir, exist_ok=True)

# 웹 페이지가 로드될 때까지 대기
time.sleep(10)  # 필요에 따라 대기 시간 조정

# 웹 페이지의 HTML 가져오기
main_HTML = driver.page_source
main_HTML_soup = BeautifulSoup(main_HTML, 'html.parser')

# 결과를 저장할 CSV 파일 경로
csv_filename = r"C:\FileIO\movies\movie_info.csv"

# CSV 파일에 저장할 헤더



    # 팝업 창을 클릭하고 정보 수집
for i in range(200):
    tr_id = f"tr_{i}"
    tr = main_HTML_soup.find('tr', id=tr_id)
    if tr:  # 해당 id를 가진 <tr> 태그가 있으면
        title_element = tr.select_one('td[id="td_movie"] a')
        if title_element:
            title = title_element.get_text(strip=True)
            print(f"{i + 1}. {title}")

            # 팝업 창 열기
            movie_code = open_popup(title_element)

            # 팝업 창의 HTML 코드 가져오기
            time.sleep(2)  # 팝업 창이 로드될 때까지 대기 (필요에 따라 대기 시간 조정)
            popup_html = driver.page_source
            popup_soup = BeautifulSoup(popup_html, 'html.parser')

            # pop필요한 정보 추출
            '''code, title, aka, summary, rating, release_date, production_year, production_condition
            , crank_in_up, filming_count, screen_type, synopsis, director, actor, producer, distributor, 
            importer, poster_url'''
            code = popup_soup.find('dt', string='코드').find_next('dd').get_text(strip=True)
            aka = popup_soup.find('dt', string='A.K.A.').find_next('dd').get_text(strip=True)
            aka = re.sub(r'\s+', ' ', aka)
            summary = popup_soup.find('dt', string='요약정보').find_next('dd').get_text(strip=True)
            summary = re.sub(r'\s+', ' ', summary)
            rating_tag = popup_soup.find('dt', string='등급분류').find_next('img')
            if rating_tag:
                src = rating_tag['src']
                rating = src.split("/")[-1]  # 등급분류이미지
                if rating.startswith("rating"):
                    rating = rating.replace("rating", "gr")
                    rating = rating.replace(".jpg", "")
                else:
                    rating_text=popup_soup.find('dt', string='등급분류').find_next('dd').get_text(strip=True)
                    if rating_text.startswith("전체"):
                        rating="gr_all"
                    else:
                        rating_tag = rating_text[:2]
                        rating="gr_"+rating_tag
            release_date_element = popup_soup.find('dt', string='개봉일')
            if release_date_element:
                release_date = release_date_element.find_next('dd').get_text(strip=True)
            else:
                release_date_element = popup_soup.find('dt', string='개봉(예정)일')
                if release_date_element:
                    release_date = release_date_element.find_next('dd').get_text(strip=True)
                    release_date = release_date + " 개봉예정"
                else:
                    release_date="정보없음"
            production_year_element=popup_soup.find('dt', string='제작연도')
            production_year="정보없음"
            if production_year_element:
                production_year=production_year_element.find_next('dd').get_text(strip=True)

            production_condition_element=popup_soup.find('dt', string='제작상태')
            production_condition = "정보없음"
            if production_condition_element:
                production_condition=production_condition_element.find_next('dd').get_text(strip=True)


            crank_in_up_element = popup_soup.find('dt', string='크랭크인/업')
            crank_in_up = crank_in_up_element.find_next('dd').get_text(strip=True) if crank_in_up_element else "정보없음"


            filming_count_element=popup_soup.find('dt', string='촬영회차')
            filming_count=filming_count_element.find_next('dd').get_text(strip=True) if filming_count_element else "정보없음"

            screen_type_element=popup_soup.find('dt', string='상영타입')
            screen_type="정보없음"
            if screen_type_element:
                screen_type_tag = screen_type_element.find_next('dd')
                screen_type = ""
                for strong in screen_type_tag.find_all('strong'):
                    current_strong = strong.text.strip()
                    next_text = strong.find_next_sibling(string=True).strip()
                    next_text = re.sub(r'\s', '', next_text)
                    screen_type += f"{current_strong} {next_text}<br>"

            synopsis_tag = popup_soup.find('strong', string='시놉시스')
            synopsis = "정보없음"
            if synopsis_tag:
                synopsis = synopsis_tag.find_next('p')
                synopsis = str(synopsis)
                synopsis = re.sub(r'\s+', ' ', synopsis)
                synopsis = synopsis.replace('<p class="desc_info">', '')
                synopsis = synopsis.replace('</p>', '')

            director_element = popup_soup.find('dt', string='감독')
            director ="정보없음"
            directors = []
            if director_element:
                director_element_tag = director_element.find_next('dd').find_all('a')
                for director_a in director_element_tag:
                    directors.append(director_a.get_text(strip=True))
                director = ' | '.join(directors) if directors else "정보 없음"


            actor_element = popup_soup.find('dt', string='배우')
            actor = ''
            if actor_element:
                actor_info_trs = actor_element.find_next('dd').find_all('table')
                for table in actor_info_trs:
                    actor_type=table.find_next('td').find_next('strong').get_text(strip=True)
                    actor_names = table.find_next('td').find_all("a")
                    actor_names_str = ' | '.join(actors.get_text(strip=True) for actors in actor_names)
                    actor += f"{actor_type} {actor_names_str}<br>"
            else:actor = '정보없음'

            producer_element = popup_soup.find('dt', string='제작사')
            producer = '정보없음'
            if producer_element:
                producer_dd_tag = producer_element.find_next('dd')
                producer_a_tag = producer_dd_tag.find_all('a')
                producer = ' | '.join(d.get_text(strip=True) for d in producer_a_tag)


            distributor_element = popup_soup.find('dt', string='배급사')
            distributor = '정보없음'
            if distributor_element:
                distributor_dd_tag = distributor_element.find_next('dd')
                distributor_a_tag = distributor_dd_tag.find_all('a')
                distributor = ' | '.join(d.get_text(strip=True) for d in distributor_a_tag)


            importer_element = popup_soup.find('dt', string='수입사')
            importer = '정보없음'
            if importer_element:
                importer_dd_tag = importer_element.find_next('dd')
                importer_a_tag = importer_dd_tag.find_all('a')
                importer = ' | '.join(d.get_text(strip=True) for d in importer_a_tag)



            # 포스터 이미지 URL 가져오기
            poster_link = popup_soup.find('a', class_='thumb')['href']

            # 포스터 이미지 다운로드 및 저장
            poster_url = f"https://www.kobis.or.kr{poster_link}"
            response = requests.get(poster_url)
            if response.status_code == 200:
                poster_filename = os.path.join(image_dir, f"{movie_code}.jpg")
                with open(poster_filename, 'wb') as f:
                    f.write(response.content)
                    print(f"Poster saved: {poster_filename}")
            else:
                print(f"Failed to download poster: {poster_url}")

            # 팝업 창 닫기
            try:
                driver.execute_script("dtlRmAll();")
            except:
                print("닫기 버튼을 실행할 수 없습니다.")

            # 각 정보를 DB저장
            # MySQL 데이터베이스에 정보 저장
            conn = pymysql.connect(host='localhost', user='root', password='1234',
                                db='moviepjt', charset='utf8')
            try:
                with conn.cursor() as cursor:

                    sql = ("INSERT INTO old_movietbl (code, title, aka, summary, rating, release_date, "
                    "production_year, production_condition, crank_in_up, filming_count, screen_type, "
                    "synopsis, director, actor, producer, distributor, importer, poster_url) "
                            "VALUES ( %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,"
                        " %s, %s)")
                    cursor.execute(sql, (code, title, aka, summary, rating, release_date,
                    production_year, production_condition, crank_in_up, filming_count, screen_type,
                    synopsis, director, actor, producer, distributor, importer, poster_url))
                    conn.commit()
                    print(f"결과가 MySQL 데이터베이스에 저장되었습니다.")
            except:
                print(f"결과 MySQL에 저장실패.")

    print(f"진행 상황: {i + 1} / 200")

# 크롬 브라우저 닫기
driver.quit()

print(f"결과가 {csv_filename} 파일에 저장되었습니다.")