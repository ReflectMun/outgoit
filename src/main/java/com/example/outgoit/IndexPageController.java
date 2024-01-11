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
@RequestMapping("/outgoit")
public class IndexPageController {
    WeatherService weatherService;

    public IndexPageController(WeatherService weatherService){
        this.weatherService = weatherService;
    }

    @GetMapping("/index")
    public String sendIndexPage() {
        return "jsp/etc/index";
    }

    @GetMapping("/camping")
    public String sendCampingPage(Model model){
        model.addAttribute("campingContentPage", "campingMain.jsp");

        HashMap<String, WeatherApiResponseDTO> weatherList = weatherService.getWeatherDataList();
        ArrayList<WeatherData> weatherDataList = new ArrayList<WeatherData>();
        ArrayList<String> areaNames = new ArrayList<>(weatherList.keySet());

        String weatherIcon = null;
        for(String area : areaNames){
            try {
                weatherIcon = weatherService.getWeatherIcon(weatherList.get(area));
                weatherDataList.add(new WeatherData(
                        area,
                        weatherIcon,
                        weatherList.get(area).getTemperature()
                ));
            } catch (Exception e) {
                weatherIcon = "error";
                weatherDataList.add(new WeatherData(
                        area,
                        weatherIcon,
                        weatherList.get(area).getTemperature()
                ));
            }
        }

        model.addAttribute("weathers", weatherDataList);

        return "jsp/camp/container";
    }

    @GetMapping("/hiking")
    public String sendHikingMainPage(Model model) {
        model.addAttribute("hikingContentPage", "hikingMain.jsp");

        HashMap<String, WeatherApiResponseDTO> weatherList = weatherService.getWeatherDataList();
        ArrayList<WeatherData> weatherDataList = new ArrayList<WeatherData>();
        ArrayList<String> areaNames = new ArrayList<>(weatherList.keySet());

        String weatherIcon = null;
        for(String area : areaNames){
            try {
                weatherIcon = weatherService.getWeatherIcon(weatherList.get(area));
                weatherDataList.add(new WeatherData(
                        area,
                        weatherIcon,
                        weatherList.get(area).getTemperature()
                ));
            } catch (Exception e) {
                weatherIcon = "error";
                weatherDataList.add(new WeatherData(
                        area,
                        weatherIcon,
                        weatherList.get(area).getTemperature()
                ));
            }
        }

        model.addAttribute("weathers", weatherDataList);

        return "jsp/hiking/container";
    }

    @GetMapping("/riding")
    public String sendRidingMainPage(Model model) {
        model.addAttribute("ridingContentPage", "ridingMain.jsp");

        HashMap<String, WeatherApiResponseDTO> weatherList = weatherService.getWeatherDataList();
        ArrayList<WeatherData> weatherDataList = new ArrayList<WeatherData>();
        ArrayList<String> areaNames = new ArrayList<>(weatherList.keySet());

        String weatherIcon = null;
        for(String area : areaNames){
            try {
                weatherIcon = weatherService.getWeatherIcon(weatherList.get(area));
                weatherDataList.add(new WeatherData(
                        area,
                        weatherIcon,
                        weatherList.get(area).getTemperature()
                ));
            } catch (Exception e) {
                weatherIcon = "error";
                weatherDataList.add(new WeatherData(
                        area,
                        weatherIcon,
                        weatherList.get(area).getTemperature()
                ));
            }
        }

        model.addAttribute("weathers", weatherDataList);

        return "jsp/riding/container";
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

