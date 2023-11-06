import schedule
import os
import requests
import time
from selenium import webdriver
from bs4 import BeautifulSoup
import pymysql
import pandas as pd
from sqlalchemy import create_engine
import re

# 크롬 드라이버 경로 설정
driver_path = r"C:\FileIO\chromedriver.exe"

# 크롬 드라이버 옵션 설정
chrome_options = webdriver.ChromeOptions()
chrome_options.add_argument("--disable-gpu")
chrome_options.add_argument("--headless")

# 크롬 드라이버 초기화 및 웹 브라우저 열기
driver = webdriver.Chrome(options=chrome_options)



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

#코드중복여부체크
def is_movie_exists(cursor, code):
    sql = "SELECT COUNT(*) FROM movietbl WHERE code = %s"
    cursor.execute(sql, (code))
    result = cursor.fetchone()
    return result[0] > 0


def no_update_movie_delete():
    try:
        conn = pymysql.connect(host='localhost', user='root', password='1234', db='moviepjt', charset='utf8')
        with conn.cursor() as cursor:
            sql = ("UPDATE movietbl set advance_reservation_rate = -1000, increase_decrease_status = 4, "
                   "advance_reservation_rate_rank = 1000 WHERE update_date != CURDATE();")
            cursor.execute(sql)
        conn.commit()
        print("업데이트누적분 삭제")
    except pymysql.Error as e:
        print(f"업데이트누적분 삭제에러: {e}")
    finally:
        conn.close()


# advance_reservation_rate_rank 에 순위지정
def advance_reservation_rate_rank_update():
    try:
        # 데이터베이스 연결
        connection = pymysql.connect(
            host='localhost',
            user='root',
            password='1234',
            db='moviepjt',
            charset='utf8'
        )

        no_update_movie_delete()  # 랭킹 업데이트 전 누적 분 삭제

        with connection.cursor() as cursor:
            # 데이터베이스에서 영화 정보를 가져옴
            sql_query = "SELECT code FROM movietbl WHERE update_date = CURDATE() ORDER BY advance_reservation_rate DESC LIMIT 30;"
            cursor.execute(sql_query)
            result = cursor.fetchall()
            rank = 1

            # advance_reservation_rate를 기준으로 순위를 매기고 업데이트
            for row in result:
                code = row['code']
                update_query = f"UPDATE movietbl SET advance_reservation_rate_rank = {rank} WHERE code = {code}"
                cursor.execute(update_query)
                rank += 1

        # 변경사항 커밋
        connection.commit()
        print('랭크 정보 변경 완료')
    except Exception as e:
        print('오류 발생:', str(e))
    finally:
        # 연결 닫기
        connection.close()


#순위증감률 변경

def update_movie_info(movie_code, new_rank, old_rank):
    conn = pymysql.connect(host='localhost', user='root', password='1234', db='moviepjt', charset='utf8')
    try:
        with conn.cursor() as cursor:
            # 영화 정보 가져오기

            if new_rank < old_rank:
                # 순위가 오른 경우
                increase_decrease_status = 1
                increase_decrease_rate =  old_rank - new_rank
            elif new_rank > old_rank:
                # 순위가 내려간 경우
                increase_decrease_status = 2
                increase_decrease_rate =   new_rank - old_rank
            else:
                # 순위가 그대로인 경우
                increase_decrease_status = 3
                increase_decrease_rate = 0
                # 업데이트 SQL 실행
            sql = "UPDATE movietbl SET increase_decrease_status = %s, increase_decrease_rate = %s WHERE code = %s"
            cursor.execute(sql, (increase_decrease_status, increase_decrease_rate, movie_code))
            conn.commit()
            print(f"영화 코드 {movie_code} 정보 업데이트 완료")
    finally:
        conn.close()



def job():

    # 웹 페이지가 로드될 때까지 대기

    # 웹 페이지 열기
    url = "https://www.kobis.or.kr/kobis/business/stat/boxs/findRealTicketList.do"  # 실시간 예매율페이지
    driver.get(url)

    time.sleep(10)  # 필요에 따라 대기 시간 조정

    # 웹 페이지의 HTML 가져오기
    main_HTML = driver.page_source
    main_HTML_soup = BeautifulSoup(main_HTML, 'html.parser')

    # 수정전 테이블정보 저장
    engine = create_engine('mysql+pymysql://root:1234@localhost/moviepjt?charset=utf8')
    sql_query = "SELECT code, advance_reservation_rate_rank FROM movietbl ORDER BY advance_reservation_rate_rank ASC LIMIT 30;"
    movies_before_update = pd.read_sql(sql_query, engine)

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
            Advance_reservation_rate = float(Advance_reservation_rate.strip('%'))

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
                aka = re.sub(r'\s+', ' ', aka)
                summary = popup_soup.find('dt', string='요약정보').find_next('dd').get_text(strip=True)
                summary = re.sub(r'\s+', '', summary)
                rating_tag = popup_soup.find('dt', string='등급분류').find_next('img')
                src = rating_tag['src']
                rating = src.split("/")[-1]  # 등급분류이미지
                rating = rating.replace("rating", "gr")
                rating = rating.replace(".jpg", "")
                release_date_element = popup_soup.find('dt', string='개봉일')
                if release_date_element:
                    release_date = release_date_element.find_next('dd').get_text(strip=True)
                else:
                    release_date_element = popup_soup.find('dt', string='개봉(예정)일')
                    release_date = release_date_element.find_next('dd').get_text(strip=True)
                    release_date = release_date + " 개봉예정"
                production_year = popup_soup.find('dt', string='제작연도').find_next('dd').get_text(strip=True)
                production_condition = popup_soup.find('dt', string='제작상태').find_next('dd').get_text(strip=True)
                crank_in_up = popup_soup.find('dt', string='크랭크인/업').find_next('dd').get_text(strip=True)
                filming_count = popup_soup.find('dt', string='촬영회차').find_next('dd').get_text(strip=True)
                screen_type_tag = popup_soup.find('dt', string='상영타입').find_next('dd')
                screen_type = ""
                for strong in screen_type_tag.find_all('strong'):
                    current_strong = strong.text.strip()
                    next_text = strong.find_next_sibling(string=True).strip()
                    next_text = re.sub(r'\s', '', next_text)
                    screen_type += f"{current_strong} : {next_text}<br>"
                synopsis_tag = popup_soup.find('strong', string='시놉시스')
                synopsis = "정보없음"
                if synopsis_tag:
                    synopsis = synopsis_tag.find_next('p')
                    synopsis = str(synopsis)
                    synopsis = re.sub(r'\s+', ' ', synopsis)
                    synopsis = synopsis.replace('<p class="desc_info">', '')
                    synopsis = synopsis.replace('</p>', '')

                director_element = popup_soup.find('dt', string='감독')
                director = "정보없음"
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
                        actor_type = table.find_next('td').find_next('strong').get_text(strip=True)
                        actor_names = table.find_next('td').find_all("a")
                        actor_names_str = ' | '.join(actors.get_text(strip=True) for actors in actor_names)
                        actor += f"{actor_type} {actor_names_str}<br>"
                else:
                    actor = '정보없음'

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

                # MySQL 데이터베이스에 정보 저장
                conn = pymysql.connect(host='localhost', user='root', password='1234',
                    db='moviepjt', charset='utf8')
                try:
                    with conn.cursor() as cursor:
                        if is_movie_exists(cursor, code) == 0:
                            sql = ("INSERT INTO movietbl (code, actor, advance_reservation_rate, "
                        "aka, crank_in_up, cumulative_number_of_audience, director, "
                                "distributor, filming_count, importer, poster_url, producer,  production_condition, "
                                "production_year, rating, release_date, screen_type, summary, synopsis, title, update_date) "
                                "VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,  %s, %s, %s, %s, %s,"
                                " %s, curdate())")
                            cursor.execute(sql, (code, actor, Advance_reservation_rate, aka, crank_in_up,
                                                Cumulative_number_of_audience, director, distributor, filming_count,
                                                importer, poster_url,
                                                producer, production_condition, production_year, rating, release_date,
                                                screen_type,
                                                summary, synopsis, title))
                            conn.commit()
                            print(f"결과가 MySQL 데이터베이스에 저장되었습니다.")
                        else:
                            sql = ("UPDATE movietbl SET advance_reservation_rate = %s, cumulative_number_of_audience"
                                " = %s, update_date= curdate() WHERE code= %s ;")  # 증감률, 누적관객수 업데이트
                            cursor.execute(sql, (Advance_reservation_rate, Cumulative_number_of_audience, code))
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

    advance_reservation_rate_rank_update()

    # 수정완료후 테이블 가져와서 수정전과 비교
    engine = create_engine('mysql+pymysql://root:1234@localhost/moviepjt?charset=utf8')
    sql_query = "SELECT code, advance_reservation_rate_rank FROM movietbl ORDER BY advance_reservation_rate_rank ASC LIMIT 30;"
    movies_after_update = pd.read_sql(sql_query, engine)

    # 수정전후 비교
    for index, row in movies_after_update.iterrows():
        movie_code = row['code']
        new_rank = row['advance_reservation_rate_rank']
        try:
            old_rank = \
            movies_before_update[movies_before_update['code'] == movie_code]['advance_reservation_rate_rank'].values[0]
        except IndexError:
            continue
        update_movie_info(movie_code, new_rank, old_rank)

    # 크롬 브라우저 닫기
    driver.quit()

job()
schedule.every().day.at("09:54").do(job)
count = 0
while True:
    schedule.run_pending()
    time.sleep(1)