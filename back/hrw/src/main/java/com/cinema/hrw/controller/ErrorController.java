package com.cinema.hrw.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ErrorController {

    @ExceptionHandler(Exception.class)
    public String handleException(Exception ex, Model model) {
        // 여기에서 에러 처리 로직을 수행하고 사용자에게 에러 페이지를 표시
        model.addAttribute("exception", ex.getClass().getName());
        model.addAttribute("message", ex.getMessage());
        model.addAttribute("trace", ex.getStackTrace());
        return "error";
    }
}