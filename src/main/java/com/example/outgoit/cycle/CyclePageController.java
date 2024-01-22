package com.example.outgoit.cycle;

import com.example.outgoit.IndexPageController;
import com.example.outgoit.weather.WeatherService;
import com.example.outgoit.weather.dto.WeatherApiResponseDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;

@Controller
@RequestMapping("/riding")
@RequiredArgsConstructor
public class CyclePageController {
    WeatherService weatherService;

    @GetMapping
    public String sendRidingMainPage(Model model) {
        model.addAttribute("ridingContentPage", "ridingMain.jsp");

        HashMap<String, WeatherApiResponseDTO> weatherList = weatherService.getWeatherDataList();
        ArrayList<IndexPageController.WeatherData> weatherDataList = new ArrayList<IndexPageController.WeatherData>();
        ArrayList<String> areaNames = new ArrayList<>(weatherList.keySet());

        String weatherIcon = null;
        for(String area : areaNames){
            try {
                weatherIcon = weatherService.getWeatherIcon(weatherList.get(area));
                weatherDataList.add(new IndexPageController.WeatherData(
                        area,
                        weatherIcon,
                        weatherList.get(area).getTemperature()
                ));
            } catch (Exception e) {
                weatherIcon = "error";
                weatherDataList.add(new IndexPageController.WeatherData(
                        area,
                        weatherIcon,
                        weatherList.get(area).getTemperature()
                ));
            }
        }

        model.addAttribute("weathers", weatherDataList);

        return "jsp/riding/container";
    }

}
