package com.example.outgoit.trail;

import com.example.outgoit.IndexPageController;
import com.example.outgoit.nickname.RandomNicknameService;
import com.example.outgoit.review.trail.TrailReview;
import com.example.outgoit.review.trail.TrailReviewService;
import com.example.outgoit.trail.dto.FeatureData;
import com.example.outgoit.weather.WeatherService;
import com.example.outgoit.weather.dto.WeatherApiResponseDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;


import java.util.ArrayList;
import java.util.HashMap;

@RequiredArgsConstructor
@Controller
@RequestMapping("/hiking")
public class TrailRoutePageController {
    ////////////////////////////////////////////// 의존성 주입 코드 ////////////////////////////////////////////////////
    private final TrailRouteService trailRouteService;
    private final TrailReviewService trailReviewService;
    private final WeatherService weatherService;
    private final RandomNicknameService randomNicknameService;
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    @GetMapping
    public String sendHikingMainPage(Model model) {
        model.addAttribute("hikingContentPage", "hikingMain.jsp");

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

        return "jsp/hiking/container";
    }

    // 상세페이지로 가는 맵핑
    @PostMapping("/detail/{lngi}/{lati}/{index}/{trailRouteId}")
    public String GetDetailTrain(
            @PageableDefault(size = 5, sort = "commentNumber", direction = Sort.Direction.DESC) Pageable pageable,
            @PathVariable("lngi") double lngi,
            @PathVariable("lati") double lati,
            @PathVariable("index") int index,
            @PathVariable("trailRouteId") String trailRouteId,
            Model model) throws Exception
    {
        Pageable modified = PageRequest.of(0, pageable.getPageSize(), pageable.getSort());
        ArrayList<TrailReview> reviews =
                new ArrayList<>(trailReviewService.loadTrailRouteReview(trailRouteId, modified).getContent());

        WeatherApiResponseDTO weather = weatherService.getWeatherDataByCoordinate(lati, lngi);

        model.addAttribute("weatherIcon", weatherService.getWeatherIcon(weather));
        model.addAttribute("temperature", weather.getTemperature());

        String ratingAvg;
        try {
            ratingAvg = trailReviewService.getTrailRouteRating(trailRouteId).get(0).toString();
        } catch (NullPointerException e) {
            ratingAvg = "아직 평균평점 정보가 없어요!";
        }

        ArrayList<FeatureData> trailRouteList = trailRouteService.getTrailRouteList(lngi, lati);


        model.addAttribute("trailRouteList", trailRouteList.get(index).getProperties());
        model.addAttribute("trailPath", trailRouteList.get(index).getGeometry().getCoordinates().get(0));
        model.addAttribute("trailRouteId", trailRouteList.get(index).getId());
        model.addAttribute("ratingAvg", ratingAvg);
        model.addAttribute("existReviews", !reviews.isEmpty());
        model.addAttribute("hikingContentPage", "hiking_information.jsp");
        model.addAttribute("nickname",randomNicknameService.getRandomNickname());

        return "jsp/hiking/container";
    }

    @GetMapping("/detail/{TrailRouteName}")
    @ResponseBody
    public String sendError() {
        return "잘못된 접근입니다";
    }

}
