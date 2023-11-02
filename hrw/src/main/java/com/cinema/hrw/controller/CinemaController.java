package com.cinema.hrw.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;

import com.cinema.hrw.service.CinemaAddressService;

@Controller
@RequestMapping("/cinema")
public class CinemaController {

  private final CinemaAddressService cinemaAddressService;
  private static final Logger logger = LoggerFactory.getLogger(CinemaController.class); // Logger 객체 정의

  @GetMapping("/reservation")
  public String showJspPage() {
    return "/reservation/reservationFirst"; // "your-jsp-page.jsp"가 실제 JSP 파일명입니다.
  }

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
}