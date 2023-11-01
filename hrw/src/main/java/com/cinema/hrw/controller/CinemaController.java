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

  public CinemaController(CinemaAddressService cinemaAddressService) {
    this.cinemaAddressService = cinemaAddressService;
  }

  @GetMapping("/getAllLocalAndCinemaNames")
  @ResponseBody
  public java.util.Map<String, List<String>> getAllLocalAndCinemaNames() {
    List<String> localValues = cinemaAddressService.getAllLocalValues();
    java.util.Map<String, List<String>> result = new HashMap<>();

    for (String targetLocal : localValues) {
      List<String> namesForLocal = cinemaAddressService.getCinemaNamesByLocal(targetLocal);
      result.put(targetLocal, namesForLocal);
    }

    logger.info("localAndCinemaNames: {}", result);

    return result;
  }
}
