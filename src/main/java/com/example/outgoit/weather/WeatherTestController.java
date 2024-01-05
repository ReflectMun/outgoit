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

    @GetMapping("/list")
    public HashMap<String, WeatherApiResponseDTO> getWeatherDataList(){
        HashMap<String, WeatherApiResponseDTO> result = new HashMap();

        result.put("서울", weatherService.getWeatherDataByGrid(60, 127));
        result.put("부산", weatherService.getWeatherDataByGrid(98, 76));
        result.put("대구", weatherService.getWeatherDataByGrid(89, 90));
        result.put("인천", weatherService.getWeatherDataByGrid(55, 124));
        result.put("광주", weatherService.getWeatherDataByGrid(58, 74));
        result.put("대전", weatherService.getWeatherDataByGrid(67, 100));
        result.put("울산", weatherService.getWeatherDataByGrid(102, 84));
        result.put("세종", weatherService.getWeatherDataByGrid(66, 103));
        result.put("수원", weatherService.getWeatherDataByGrid(60, 121));
        result.put("춘천", weatherService.getWeatherDataByGrid(73, 134));
        result.put("강릉", weatherService.getWeatherDataByGrid(92, 131));
        result.put("청주", weatherService.getWeatherDataByGrid(69, 106));
        result.put("전주", weatherService.getWeatherDataByGrid(63, 89));
        result.put("목포", weatherService.getWeatherDataByGrid(50, 67));
        result.put("안동", weatherService.getWeatherDataByGrid(91, 106));
        result.put("진주", weatherService.getWeatherDataByGrid(81, 75));
        result.put("제주", weatherService.getWeatherDataByGrid(52, 38));



        return result;
    }
}
