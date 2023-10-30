import pymysql
import random
import requests
from datetime import datetime, timedelta

def get_movie_code():
  conn, cur = None, None
  movie_codes = []
  conn = pymysql.connect(host='localhost', user='root', password='1234', db='moviepjt', charset='utf8')
  cur = conn.cursor()
  cur.execute("SELECT code from movietbl")
  for row in cur.fetchall():
    movie_codes.append(row[0])
  conn.commit()
  cur.close()
  conn.close()
  return movie_codes


def get_cinema_code():
  conn, cur = None, None
  cinema_codes = []
  conn = pymysql.connect(host='localhost', user='root', password='1234', db='moviepjt', charset='utf8')
  cur = conn.cursor()
  cur.execute("SELECT cinema_code from cinema_addresstbl")
  for row in cur.fetchall():
    cinema_codes.append(row[0])
  conn.commit()
  cur.close()
  conn.close()
  return cinema_codes

def get_take_date():
  today = datetime.today()
  # 5일 후까지의 날짜를 저장할 배열
  date_list = []
  # 오늘로부터 5일간의 날짜 생성 및 배열에 추가
  for i in range(8):
    date_list.append((today + timedelta(days=i)).strftime('%Y-%m-%d'))

  return date_list

def get_movie_API(movie_code):
  api_key = "c5df5d07dd8a15b2f5d00f6c21e37cc1"
  # API 엔드포인트 URL
  url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json"
  params = {
    "key": api_key,
    "movieCd": movie_code
  }
  # API 호출
  response = requests.get(url, params=params)
  if response.status_code == 200:
    data = response.json()
    movie_info = data.get("movieInfoResult", {}).get("movieInfo", {})
    return movie_info
    # 상영시간, 상영타입
  else:
    print("API 호출에 실패했습니다.")


def get_movie_ditail ():
  movie_codes = get_movie_code()
  movie_details = []

  for movie_code in movie_codes:
    movie_info = get_movie_API(movie_code)
    if movie_info:
      show_type_tag = movie_info['showTypes']
      screen_types=["2D : 디지털"]
      if show_type_tag:
        screen_types = [f"{show['showTypeGroupNm']} : {show['showTypeNm']}" for show in show_type_tag]
      running_time = movie_info['showTm']
      movie_details.append([movie_code, screen_types, running_time])

  return movie_details

def get_select_movie_info(movie_ditails, movie_code):
  for movie_detail in movie_ditails:
    if movie_detail[0] == movie_code:
      return movie_detail



def insert_schedule(schedule_code, cinema_code, auditorium,
    take_date, start_time, movie_code, end_time, screen_type, teenager_price,
                    adult_price, disabled_price):
  conn, cur = None, None
  conn = pymysql.connect(host='localhost', user='root', password='1234', db='moviepjt', charset='utf8')
  cur = conn.cursor()

  cur.execute("insert into scheduletbl (schedule_code, cinema_code, "
              "auditorium, take_date, start_time, movie_code, end_time, "
              "screen_type, teenager_price, adult_price, disabled_price, all_seat_count) VALUES(%s, %s, "
              "%s, %s, %s, %s, %s, %s, %s, %s, %s, 91)", (schedule_code, cinema_code, auditorium,
              take_date, start_time, movie_code, end_time,screen_type, teenager_price,adult_price,disabled_price))

  conn.commit()
  cur.close()
  conn.close()



cinema_codes = get_cinema_code()

start_times=['06:00','09:00','12:00','15:00','18:00','21:00','00:00']
take_dates = get_take_date()
movie_codes= get_movie_code()
movie_ditail=get_movie_ditail ()
idx=0


for cinema_code in cinema_codes:
  theater_count = random.randint(5, 8);
  for theater in range(1, theater_count + 1):
    auditorium=str(theater)+" 관"
    for take_date in take_dates:
      for start_time in start_times:
        if idx%30==0:
          random.shuffle(movie_codes)
        movie_code = movie_codes[idx%30]
        movie_info= get_select_movie_info(movie_ditail,movie_code)
        show_type_tag = movie_info[1]
        screen_type = random.choice(show_type_tag)
        show_time = int(movie_info[2]) if movie_info[2] else 130
        show_time = timedelta(minutes=show_time)
        start_time = datetime.strptime(start_time, '%H:%M')
        end_time = start_time + show_time
        end_time = end_time.strftime('%H:%M')
        start_time = start_time.strftime('%H:%M')
        teenager_price, adult_price, disabled_price=None, None, None
        if screen_type.startswith('3D') or screen_type.startswith('ScreenX'):
          teenager_price = 12000
          adult_price = 15000
          disabled_price = 8000
        elif screen_type.startswith('4D') or screen_type.startswith('VR'):
          teenager_price = 13000
          adult_price = 18000
          disabled_price = 9000
        elif screen_type.startswith('IMAX'):
          teenager_price = 16000
          adult_price = 20000
          disabled_price = 11000
        elif screen_type.startswith('DOLBY'):
          teenager_price = 15000
          adult_price = 17000
          disabled_price = 8000
        else:
          teenager_price = 10000
          adult_price = 13000
          disabled_price = 5000
        schedule_code = f'{cinema_code}{theater:02d}{take_date.replace("-","")}{start_time.split(":")[0]}'
        insert_schedule(schedule_code, cinema_code, auditorium,
                    take_date, start_time, movie_code, end_time, screen_type, teenager_price,
                    adult_price, disabled_price)
        print(f"{idx} DB에 저장")
        idx+=1


'''import pymysql
import csv

# MySQL 데이터베이스에 연결
conn = pymysql.connect(host='localhost', user='root', password='1234', db='moviepjt', charset='utf8')
cursor = conn.cursor()

# CSV 파일의 경로
csv_file_path = 'D:/teamHRW/resources_file/theater_address/address.csv'

# CSV 파일 열기
with open(csv_file_path, 'r', encoding='utf-8') as csv_file:
    csv_reader = csv.DictReader(csv_file)

    # 각 행을 반복하며 데이터 읽기
    for row in csv_reader:
        query = ("INSERT INTO cinema_addresstbl (cinema_code, address, cinema_name, tell, x_axis, y_axis) "
                "VALUES (%s, %s, %s, %s, %s, %s)")
        values = (row['cinema_code'], row['address'], row['cinema_name'],
                  row['tell'], row['x_axis'], row['y_axis'])
        cursor.execute(query, values)

# 변경사항 저장
conn.commit()

# 연결 닫기
cursor.close()
conn.close()'''


