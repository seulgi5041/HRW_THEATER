package com.cinema.hrw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.hrw.entity.ScheduleEntity;
import com.cinema.hrw.repository.ScheduleRepository;
import java.util.List;

@Service
public class ScheduleService {
    @Autowired
    private ScheduleRepository scheduleRepository;

    public List<String> findAvailableDatesByMovieCode(String movieCode) {
        return scheduleRepository.findDistinctAvailableDates();
    }

    public List<ScheduleEntity> findSchedulesByCinemaMovieAndDate(String cinemaCode, String movieCode, String selectedDate) {
        return scheduleRepository.findSchedulesByCinemaMovieAndDate(cinemaCode, movieCode, selectedDate);
    }
}