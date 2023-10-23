import os
import requests
import time
from selenium import webdriver
from bs4 import BeautifulSoup
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
url = "https://www.kobis.or.kr/kobis/business/stat/boxs/findRealTicketList.do"
driver.get(url)

# 팝업 창을 여는 함수 정의
def open_popup(title_element):
    script = title_element['onclick']
    movie_code = script.split("('movie','")[1].split("');")[0]
    driver.execute_script(script)
    print(movie_code)
    return movie_code

# 디렉토리 생성 및 이미지 저장 경로 설정
image_dir = r"C:\FileIO\movies\moviePoster"
os.makedirs(image_dir, exist_ok=True)

def is_movie_exists(cursor, code):
    sql = "SELECT COUNT(*) FROM movietbl WHERE code = %s"
    cursor.execute(sql, (code,))
    result = cursor.fetchone()
    return result[0] > 0



# 웹 페이지가 로드될 때까지 대기
time.sleep(10)  # 필요에 따라 대기 시간 조정

# 웹 페이지의 HTML 가져오기
main_HTML = driver.page_source
main_HTML_soup = BeautifulSoup(main_HTML, 'html.parser')

# 팝업 창을 클릭하고 정보 수집
target_tr_tags = main_HTML_soup.find_all('tr', id="tr_")
idx = 1
for tr_tag in target_tr_tags:
    title_element = tr_tag.select_one('td.tal a')
    td_elements = tr_tag.find_all('td', class_='tar')
    if title_element:
        title = title_element.get_text(strip=True)
        print("%d. %s" % (idx, title))
    if len(td_elements) >= 1:
        Advance_reservation_rate = td_elements[0].get_text(strip=True)
        Cumulative_number_of_audience = td_elements[4].get_text(strip=True)
        Advance_reservation_rate=float(Advance_reservation_rate.strip('%'))

        # 팝업 창 열기
        movie_code = open_popup(title_element)

        # 팝업 창의 HTML 코드 가져오기
        time.sleep(2)  # 팝업 창이 로드될 때까지 대기 (필요에 따라 대기 시간 조정)
        popup_html = driver.page_source
        popup_soup = BeautifulSoup(popup_html, 'html.parser')

        # 포스터 이미지 URL 가져오기
        poster_link = popup_soup.find('a', class_='thumb')['href']

        # 포스터 이미지 다운로드 및 저장
        poster_url = f"https://www.kobis.or.kr{poster_link}"
        response = requests.get(poster_url)
        if response.status_code == 200 and poster_link != "#":
            poster_bynary = response.content

            poster_filename = os.path.join(image_dir, f"{movie_code}.jpg")
            with open(poster_filename, 'wb') as f:
                f.write(response.content)
                print(f"Poster saved: {poster_filename}")
            # 필요한 정보 추출
            code = popup_soup.find('dt', string='코드').find_next('dd').get_text(strip=True)
            aka = popup_soup.find('dt', string='A.K.A.').find_next('dd').get_text(strip=True)
            summary = popup_soup.find('dt', string='요약정보').find_next('dd').get_text(strip=True)
            summary=summary.split("|")
            summary = ', '.join(info.strip() for info in summary if info.strip())
            rating_tag = popup_soup.find('dt', string='등급분류').find_next('img')
            src = rating_tag['src']
            rating = src.split("/")[-1] #등급분류이미지
            rating = rating.replace("rating","gr" )
            rating = rating.replace("jpg", "")
            release_date = popup_soup.find('dt', string='개봉일').find_next('dd').get_text(strip=True)
            production_year = popup_soup.find('dt', string='제작연도').find_next('dd').get_text(strip=True)
            production_condition = popup_soup.find('dt', string='제작상태').find_next('dd').get_text(strip=True)
            crank_in_up = popup_soup.find('dt', string='크랭크인/업').find_next('dd').get_text(strip=True)
            filming_count = popup_soup.find('dt', string='촬영회차').find_next('dd').get_text(strip=True)
            screen_type_tag = popup_soup.find('dt', string='상영타입').find_next('dd')
            screen_type=""
            for strong in screen_type_tag.find_all('strong'):
                current_strong = strong.text.strip()
                next_text = strong.find_next_sibling(string=True).strip()
                data_list = next_text.split(',')
                data_string = ', '.join(map(str.strip, data_list))
                screen_type += f"{current_strong} : {data_string}<br>"
            synopsis_tag=popup_soup.find('strong', string='시놉시스')
            synopsis="정보없음"
            if synopsis_tag:
                synopsis = synopsis_tag.find_next('p')
                synopsis = str(synopsis)
                synopsis = synopsis.replace('<p class="desc_info">', '')
                synopsis = synopsis.replace('</p>', '')
            director_element = popup_soup.find('dt', string='감독')
            director = director_element.find_next('a').get_text(strip=True) if director_element else "정보 없음"

            actor_element = popup_soup.find('dt', string='배우')
            actor='정보없음'
            if actor_element:
                actor_info_trs  = actor_element.find_next('dd').find_all('tr')
                for tr in actor_info_trs:
                    actor_links = tr.find_all('td')
                    actor = ' | '.join(actor.get_text() for actor in actor_links)
                    actor += ' <br>'

            producer_element = popup_soup.find('dt', string='제작사')
            producer = producer_element.find_next(
                'dd').get_text(strip=True) if producer_element else "정보 없음"
            distributor_element = popup_soup.find('dt', string='배급사')
            distributor = producer_element.find_next(
                'dd').get_text(strip=True) if producer_element else "정보 없음"
            importer_element = popup_soup.find('dt', string='수입사')
            importer = producer_element.find_next(
                'dd').get_text(strip=True) if producer_element else "정보 없음"



            # MySQL 데이터베이스에 정보 저장
            conn=pymysql.connect(host='localhost', user='root', password='1234',
                                db='moviepjt', charset='utf8')
            try:
                with conn.cursor() as cursor:
                    if is_movie_exists(cursor,code)==0:
                        sql = ("INSERT INTO movietbl (code, actor, advance_reservation_rate, "
                            "aka, crank_in_up, cumulative_number_of_audience, director, "
                            "distributor, filming_count, importer, poster_url, producer,  production_condition, "
                            "production_year, rating, release_date, screen_type, summary, synopsis, title) "
                            "VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,  %s, %s, %s, %s, %s,"
                            " %s)")
                        cursor.execute(sql, (code,actor,Advance_reservation_rate,aka,crank_in_up,
                        Cumulative_number_of_audience, director, distributor,filming_count, importer, poster_url,
                        producer, production_condition, production_year, rating, release_date, screen_type,
                        summary,synopsis,title))
                        conn.commit()
                        print(f"결과가 MySQL 데이터베이스에 저장되었습니다.")
                    else:
                        sql =("UPDATE movietbl SET advance_reservation_rate = %s, cumulative_number_of_audience"
                            " = %s  WHERE code= %s ;") #증감률, 누적관객수 업데이트
                        cursor.execute(sql, (Advance_reservation_rate, Cumulative_number_of_audience,code))
                        conn.commit()
                        print(f"증감률과 관객수 데이터베이스에 업데이트됨")

            finally:
                conn.close()

            idx += 1
        # 팝업 창 닫기
        try:
            driver.execute_script("dtlRmAll();")
        except:
            print("닫기 버튼을 실행할 수 없습니다.")
        if idx > 30:
            break
    if idx > 30:
        break

# 크롬 브라우저 닫기
driver.quit()


'''import csv
import time
import os
import requests
from selenium import webdriver
from selenium.common import NoSuchElementException
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from bs4 import BeautifulSoup
from urllib3.filepost import writer

# 크롬 드라이버 경로 설정
driver_path = r"C:\FileIO\chromedriver.exe"

# 크롬 드라이버 옵션 설정
chrome_options = webdriver.ChromeOptions()
chrome_options.add_argument("--disable-gpu")
chrome_options.add_argument("--headless")

# 크롬 드라이버 초기화 및 웹 브라우저 열기
driver = webdriver.Chrome(options=chrome_options)

# 웹 페이지 열기
url = "https://www.kobis.or.kr/kobis/business/stat/boxs/findRealTicketList.do"
driver.get(url)

# 팝업 창을 여는 함수 정의
def open_popup(title_element):
    script = title_element['onclick']
    movie_code = script.split("('movie','")[1].split("');")[0]
    driver.execute_script(script)
    print(movie_code)
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
csv_header = ["Title", "Code",  "A.K.A.", "Summary", "Rating", "Image Path"]

# 결과를 CSV 파일에 저장
idx=1;
with open(csv_filename, mode='w', newline='', encoding='UTF-8') as csv_file:
    writer = csv.writer(csv_file)

    # 헤더를 CSV 파일에 쓰기
    writer.writerow(csv_header)

    # 팝업 창을 클릭하고 정보 수집
    target_tr_tags = main_HTML_soup.find_all('tr', id="tr_")
    for tr_tag in target_tr_tags:
        title_element = tr_tag.select_one('td.tal a')  # 변경한 부분
        if title_element:
            title = title_element.get_text(strip=True)
            print(f"{idx}. {title}")

            # 팝업 창 열기
            movie_code = open_popup(title_element)

            # 팝업 창의 HTML 코드 가져오기
            time.sleep(2)  # 팝업 창이 로드될 때까지 대기 (필요에 따라 대기 시간 조정)
            popup_html = driver.page_source
            popup_soup = BeautifulSoup(popup_html, 'html.parser')

            # 포스터 이미지 URL 가져오기
            poster_link = popup_soup.find('a', class_='thumb')['href']

            # 포스터 이미지 다운로드 및 저장
            poster_url = f"https://www.kobis.or.kr{poster_link}"
            response = requests.get(poster_url)
            if response.status_code == 200 and poster_link!="#" :
                poster_filename = os.path.join(image_dir, f"{movie_code}.jpg")
                with open(poster_filename, 'wb') as f:
                    f.write(response.content)
                    print(f"Poster saved: {poster_filename}")

                # 필요한 정보 추출
                code = popup_soup.find('dt', string='코드').find_next('dd').get_text(strip=True)
                aka = popup_soup.find('dt', string='A.K.A.').find_next('dd').get_text(strip=True)
                summary = popup_soup.find('dt', string='요약정보').find_next('dd').get_text(strip=True)
                rating = popup_soup.find('dt', string='등급분류').find_next('dd').get_text(strip=True)

                print(f"Code: {code}")
                print(f"A.K.A.: {aka}")
                print(f"Summary: {summary}")
                print(f"Rating: {rating}")
            else:
                print(f"Failed to download poster: {poster_url}")

            # 팝업 창 닫기
            try:
                driver.execute_script("dtlRmAll();")
            except:
                print("닫기 버튼을 실행할 수 없습니다.")

            # 이미지 파일 경로
            image_path = os.path.join(image_dir, f"{movie_code}.jpg")

            # 각 정보를 CSV 파일에 쓰기
            writer.writerow([title, code, aka, summary, rating, image_path])

        print(f"진행 상황: {idx} / 100")
        idx=idx+1

# 크롬 브라우저 닫기
driver.quit()

print(f"결과가 {csv_filename} 파일에 저장되었습니다.")'''

