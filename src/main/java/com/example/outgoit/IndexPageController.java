package com.example.outgoit;

import com.example.outgoit.weather.WeatherService;
import com.example.outgoit.weather.dto.WeatherApiResponseDTO;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.HashMap;

@Controller
@RequestMapping
public class IndexPageController {
    WeatherService weatherService;

    public IndexPageController(WeatherService weatherService){
        this.weatherService = weatherService;
    }

    @GetMapping("/index")
    public String sendIndexPage() {
        return "jsp/etc/index";
    }

    @GetMapping("/design")
    public String sendDesignPage() {
        return "jsp/etc/design";
    }

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class WeatherData{
        private String area;
        private String weatherIcon;
        private String temperature;
    }
}

