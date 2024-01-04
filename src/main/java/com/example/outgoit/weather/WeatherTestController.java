package com.example.outgoit.weather;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/weather")
public class WeatherTestController {
    WeatherService weatherService;

    public WeatherTestController(WeatherService weatherService){
        this.weatherService = weatherService;
    }

    @GetMapping
    public String test(){
        weatherService.getWeatherData(33.50672601146483,  126.4931057713808);
        return "OK";
    }
}
