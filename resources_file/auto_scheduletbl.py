import pymysql
import random
import requests
from datetime import datetime, timedelta


def get_movie_code():
  conn, cur = None, None
  movie_codes = []  # 빈 리스트를 생성
  conn = pymysql.connect(host='localhost', user='root', password='1234', db='moviepjt', charset='utf8')
  cur = conn.cursor()
  cur.execute("SELECT code, release_date FROM movietbl WHERE update_date = CURDATE();")
  for row in cur.fetchall():
    movie_code = row[0]
    release_date = row[1]
    movie_codes.append((movie_code, release_date))  # 각 행의 code와 release_date를 튜플로 묶어서 리스트에 추가
  conn.commit()
  cur.close()
  conn.close()
  return movie_codes


def get_cinema_code():
  conn, cur = None, None
  cinema_codes = []
  conn = pymysql.connect(host='localhost', user='root', password='1234', db='moviepjt', charset='utf8')
  cur = conn.cursor()
  cur.execute("SELECT cinema_code from cinema_addresstbl ")
  for row in cur.fetchall():
    cinema_codes.append(row[0])
  conn.commit()
  cur.close()
  conn.close()
  return cinema_codes

def get_take_date():
  today = datetime.today()
  # 7일 후까지의 날짜를 저장할 배열
  date_list = []
  # 오늘로부터 7일간의 날짜 생성 및 배열에 추가
  for i in range(8):
    date_list.append((today + timedelta(days=i)).strftime('%Y-%m-%d'))

  return date_list


def get_after_take_date(schedule_code):
  conn, cur = None, None

  try:
    conn = pymysql.connect(host='localhost', user='root', password='1234', db='moviepjt', charset='utf8')
    cur = conn.cursor()

    sql = "SELECT  COUNT(schedule_code) FROM scheduletbl WHERE schedule_code = %s"
    cur.execute(sql, (schedule_code))
    result = cur.fetchone()
    print(result)
  except pymysql.Error as e:
    print(f"Error: {e}")
  finally:
    if cur:
      cur.close()
    if conn:
      conn.close()

  return result[0]

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


def get_movie_ditail (movie_codes):
  movie_details = []

  for movie_code in movie_codes:
    movie_info = get_movie_API(movie_code[0])
    if movie_info:
      show_type_tag = movie_info['showTypes']
      screen_types=["2D : 디지털"]
      if show_type_tag:
        screen_types = [f"{show['showTypeGroupNm']} : {show['showTypeNm']}" for show in show_type_tag]
      running_time = movie_info['showTm']
      movie_details.append([movie_code[0], screen_types, running_time])

  return movie_details

def get_select_movie_info(movie_ditails,movie_code):
  for movie_detail in movie_ditails:
    if movie_detail[0] == movie_code:
      # movie_code가 일치하는 정보를 찾았을 때 처리할 내용
      print("찾은 정보:", movie_detail)
      return movie_detail
      break
  else:
    print(f"movie_code {movie_code}를 찾을 수 없습니다.")



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
movie_ditail=get_movie_ditail (movie_codes)
idx=0


for cinema_code in cinema_codes:
  theater_count = random.randint(5, 8);
  for theater in range(1, theater_count + 1):
    auditorium=str(theater)+" 관"
    for take_date in take_dates:

      for start_time in start_times:
        if idx%len(movie_codes)==0:
          random.shuffle(movie_codes)
        movie_release_date = movie_codes[idx % len(movie_codes)][1]
        movie_release_date = movie_release_date.replace(" 개봉예정", "")
        movie_release_date_day = datetime.strptime(movie_release_date, "%Y-%m-%d")
        take_date_day = datetime.strptime(take_date, "%Y-%m-%d")

        if movie_release_date_day>=take_date_day:
          while movie_release_date_day >= take_date_day:
            idx += 1
            movie_release_date = movie_codes[idx % len(movie_codes)][1]
            movie_release_date = movie_release_date.replace(" 개봉예정", "")
            movie_release_date_day = datetime.strptime(movie_release_date, "%Y-%m-%d")

        movie_code = movie_codes[idx%len(movie_codes)][0]
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
        if (get_after_take_date(schedule_code) != 0):
          print("이미 저장되어 넘어감")
          continue
        insert_schedule(schedule_code, cinema_code, auditorium,
                    take_date, start_time, movie_code, end_time, screen_type, teenager_price,
                    adult_price, disabled_price)
        print(f"{idx} DB에 저장")
        idx+=1