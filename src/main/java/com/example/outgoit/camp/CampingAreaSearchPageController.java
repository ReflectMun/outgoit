package com.example.outgoit.camp;

import com.example.outgoit.IndexPageController;
import com.example.outgoit.nickname.RandomNicknameService;
import com.example.outgoit.review.camping.CampingReview;
import com.example.outgoit.review.camping.CampingReviewService;
import com.example.outgoit.weather.WeatherService;
import com.example.outgoit.weather.dto.WeatherApiResponseDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;

@RequiredArgsConstructor
@Controller
@RequestMapping("/camping")
public class CampingAreaSearchPageController {
    //////////////////// 의존성 주입 코드 //////////////////////
    private final CampingReviewService campingReviewService;
    private final CampingSearchService campingSearchService;
    private final WeatherService weatherService;
    private final RandomNicknameService randomNicknameService;
    ////////////////////////////////////////////////////////
    @GetMapping
    public String sendCampingPage(Model model) {
        model.addAttribute("campingContentPage", "campingMain.jsp");

        HashMap<String, WeatherApiResponseDTO> weatherList = weatherService.getWeatherDataList();
        ArrayList<IndexPageController.WeatherData> weatherDataList = new ArrayList<IndexPageController.WeatherData>();
        ArrayList<String> areaNames = new ArrayList<>(weatherList.keySet());

        String weatherIcon = null;
        for (String area : areaNames) {
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

        return "jsp/camp/container";
    }

    @PostMapping("/detail/{campingAreaName}")
    public String sendDetailPage(
            @PageableDefault(size = 5, sort = "commentNumber", direction = Sort.Direction.DESC) Pageable pageable,
            CampingAreaInfoDTO data,
            Model model
    ) {
        Pageable modified = PageRequest.of(0, pageable.getPageSize(), pageable.getSort());
        ArrayList<CampingReview> reviews =
                new ArrayList<>(campingReviewService.loadCampingAreaReview(data.getContentId(), modified).getContent());

        WeatherApiResponseDTO weather = weatherService.getWeatherDataByCoordinate(
                Double.parseDouble(data.getMapY()),
                Double.parseDouble(data.getMapX())
        );

        model.addAttribute("weatherIcon", weatherService.getWeatherIcon(weather));
        model.addAttribute("temperature", weather.getTemperature());

        String ratingAvg;
        try {
            ratingAvg = campingReviewService.getCampingAreaRating(data.getContentId()).get(0).toString();
        } catch (NullPointerException e) {
            ratingAvg = "아직 평균평점 정보가 없어요!";
        }

        ArrayList<CampingAreaInfoDTO> images = campingSearchService.GetImgSearchedCampingAreaList(data.getContentId());

        model.addAttribute("images", images);
        model.addAttribute("campingAreaName", data.getFacltNm());
        model.addAttribute("telephoneNumber", data.getTel());
        model.addAttribute("periodOfOperation", data.getOperPdCl() + " " + data.getOperDecl());
        model.addAttribute("address", data.getAddr1() + " " + data.getAddr2());
        model.addAttribute(
                "subsidiaryFacilities",
                data.getSbrsEtc().isEmpty()
                        ? "캠핑장에서 등록한 부대시설 정보가 없어요!"
                        : data.getSbrsEtc()
        );

//      model.addAttribute("etc", data.getSbrsEtc());
        model.addAttribute("ratingAvg", ratingAvg);
        model.addAttribute("campingAreaNumber", data.getContentId());
        model.addAttribute("existReviews", !reviews.isEmpty());
        model.addAttribute("lineIntro",
                data.getLineIntro().isEmpty() ?
                        "캠핑장에서 등록한 한 줄 소개가 없어요!" :
                        data.getLineIntro()
        );
        model.addAttribute("generalSite", data.getGnrlSiteCo());
        model.addAttribute("autoSite", data.getAutoSiteCo());
        model.addAttribute("animalComingControl",
                data.getAnimalCmgCl().isEmpty() ?
                        "캠핑장에 문의해야해요!" :
                        data.getAnimalCmgCl()
        );
        model.addAttribute("equipmentRental",
                data.getEqpmnLendCl().isEmpty() ?
                        "캠핑장에 문의해야해요!" :
                        data.getEqpmnLendCl()
        );
        model.addAttribute("trailerAccompanyAt", data.getTrlerAcmpnyAt());
        model.addAttribute("caravanAccompanyAt", data.getCaravAcmpnyAt());
        model.addAttribute("toiletCount", data.getToiletCo());
        model.addAttribute("availableFacilities",
                data.getPosblFcltyCl().isEmpty() ?
                        "이용가능한 주변 시설 정보가 없어요" :
                        data.getPosblFcltyCl()
        );
        model.addAttribute("managementStatement", data.getManageSttus());
        model.addAttribute("holidaySeasonStart",
                data.getHvofBgnde().isEmpty() ?
                        "연중무휴예요!" :
                        data.getHvofBgnde()
        );
        model.addAttribute("holidaySeasonEnd",
                data.getHvofEnddle().isEmpty() ?
                        "연중무휴예요!" :
                        data.getHvofEnddle()
        );
        model.addAttribute("showerRoomCount", data.getSwrmCo());
        model.addAttribute("brazierControl", data.getBrazierCl());
        model.addAttribute("siteGrass", data.getSiteBottomCl1());
        model.addAttribute("siteCrushedStone", data.getSiteBottomCl2());
        model.addAttribute("siteDeck", data.getSiteBottomCl3());
        model.addAttribute("siteGravel", data.getSiteBottomCl4());
        model.addAttribute("siteSoil", data.getSiteBottomCl5());
        model.addAttribute("campingContentPage", "camp_information.jsp");
        model.addAttribute("nickname", randomNicknameService.getRandomNickname());
        return "jsp/camp/container";
    }

    @GetMapping("/detail/{campingAreaName}")
    @ResponseBody
    public String sendError() {
        return "잘못된 접근입니다";
    }


}
