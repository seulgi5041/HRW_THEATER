package com.cinema.hrw.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.ArrayList;

import com.cinema.hrw.dto.CinemaAddressDTO;
import com.cinema.hrw.dto.MovieDTO;
import com.cinema.hrw.entity.ScheduleEntity;
import com.cinema.hrw.repository.MovieSelectRepository;
import com.cinema.hrw.repository.ScheduleRepository;
import com.cinema.hrw.service.CinemaAddressService;
import com.cinema.hrw.service.ScheduleService;

@Controller
@RequestMapping("/cinema")
public class CinemaController {

  private final CinemaAddressService cinemaAddressService;
  //private static final Logger logger =
  //LoggerFactory.getLogger(CinemaController.class); // Logger 객체 정의

  // @GetMapping("/reservation")
  // public String showJspPage() {
  // return "/reservation/reservationFirst"; // "your-jsp-page.jsp"가 실제 JSP
  // 파일명입니다.
  // }

  // 해당 클래스의 인스턴스를 만들고 초기화하는 데 사용되는 클래스의 특수 메서드
  // 하나의 매개 변수를 사용

  public CinemaController(CinemaAddressService cinemaAddressService) {

    // cinemaAddressService=> 생성자 내에서 코드는 클래스의 인스턴스 변수를 초기화한다
    this.cinemaAddressService = cinemaAddressService;
  }

  // 엔드포인트
  @GetMapping("/getAllLocalAndCinemaNames")
  @ResponseBody // 반환 => JSON으로 변환되어 전송
  public java.util.Map<String, List<String>> getAllLocalAndCinemaNames() {
    List<String> localValues = cinemaAddressService.getAllLocalValues();
    java.util.Map<String, List<String>> result = new HashMap<>();
    // 지역 및 관련 영화지점, 코드를 저장하기 위해 호출된 빈 Map를 초기화

    // 검색된 지역 목록을 반복
    for (String targetLocal : localValues) {
      // 해당 지역과 관련된 영화관 이름(코드 포함) 목록을 검색
      List<String> namesForLocal = cinemaAddressService.getCinemaNamesByLocal(targetLocal);
      // Map에 항목을 추가
      result.put(targetLocal, namesForLocal);

      // logger.info("result: {}", namesForLocal);
    }
    // System.out.println or consol.log와 같은 역할(터미널에서 확인가능)
    // logger.info("localAndCinemaNames: {}", result);

    return result;
    // Map에 가져온 값을 반환
  }



  @GetMapping("/getCinemaNamesToMovie")
  @ResponseBody // 반환 => JSON으로 변환되어 전송
  public List<CinemaAddressDTO> getCinemaNamesToMovie(@RequestParam("movieCode") String movieCode) {
    List<CinemaAddressDTO> cinemaAddressDTOList = cinemaAddressService.getCinemaNamesToMovie(movieCode);

    return null;
  }

  // 영화선택부분
  @Autowired
  private MovieSelectRepository movieSelectRepository;

  @GetMapping("/movies")
  @ResponseBody // JSON data로 반환
  // cinemaCode라는 HTTP 요청 매개 변수를 받아 메소드를 호출할 때 사용자가 전달한 극장 코드를 나타낸다
  // 메소드는 해당 극장의 영화 정보를 검색할 때 사용
  public List<MovieDTO> showMovies(@RequestParam("cinemaCode") String cinemaCode) {
    // movieSelectRepository에서 findSchedulesMovieTitleRating 메소드를 호출하여 영화 정보를 DB로부터
    // 가져온다
    // findSchedulesMovieTitleRating 메소드: 제목과 등급을 검색하는 쿼리를 실행 =>List로 변환
    List<Object[]> movieData = movieSelectRepository.findSchedulesMovieTitleRating(cinemaCode);
    // MovieDTO 객체를 담을 빈 리스트인 movies를 생성
    List<MovieDTO> movies = new ArrayList<>();

    // movieData 리스트에 있는 각 Object[] 배열을 반복(영화의 제목, 등급을 추출)
    for (Object[] data : movieData) {
      String title = (String) data[1];
      String rating = (String) data[2];
      String movieCode = (String) data[3];

      // MovieDTO 클래스의 새로운 인스턴스를 생성(영화 정보를 저장하는 데이터 전송 객체)
      MovieDTO movie = new MovieDTO();
      movie.setTitle(title);
      movie.setRating(rating);
      movie.setMovieCode(movieCode);

      // 필요한 경우 Schedule Entity의 다른 속성을 Movie DTO에 추가할 수 있음

      movies.add(movie); // 각 MovieDTO 객체를 movies 리스트에 추가
    }

    return movies; // 영화 정보를 포함, JSON 형식으로 반환
  }


  // 상영시간표 부분
  @Autowired
  private ScheduleRepository scheduleRepository;

  private static final Logger logger =
  LoggerFactory.getLogger(CinemaController.class);

  @GetMapping("/schedule")
  @ResponseBody
  public List<String> showAvailableDates() {
      List<String> availableDates = scheduleRepository.findDistinctAvailableDates();
      logger.info("Available Dates: {}", availableDates);

      return availableDates;
  }

  @GetMapping("/schedule/{cinemaCode}/{movieCode}/{selectedDate}")
  public String showMovieSchedulesForDate(
      @PathVariable String cinemaCode,
      @PathVariable String movieCode,
      @PathVariable String selectedDate,
      Model model ) {
      // Retrieve and load movie schedules based on cinema, movie, and selected date
      List<ScheduleEntity> schedules = scheduleRepository.findSchedulesByCinemaMovieAndDate(cinemaCode, movieCode, selectedDate);
      model.addAttribute("schedules", schedules);

      // Other logic

      return "reservationFirst"; // Assuming you have a JSP file to display movie schedules
  }

}