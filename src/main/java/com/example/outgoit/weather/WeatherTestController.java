package com.example.outgoit.weather;

import com.example.outgoit.weather.dto.WeatherApiResponseDTO;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

@RestController
@RequestMapping("/api/weather")
public class WeatherTestController {
    WeatherService weatherService;

    public WeatherTestController(WeatherService weatherService){
        this.weatherService = weatherService;
    }

    @GetMapping("/coord")
    public WeatherApiResponseDTO getWeatherDataByCoord(Double lati, Double lngi){
        return weatherService.getWeatherDataByCoordinate(lati, lngi);
    }
}
