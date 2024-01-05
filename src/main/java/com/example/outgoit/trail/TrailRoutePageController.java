package com.example.outgoit.trail;

import com.example.outgoit.review.trail.TrailReview;
import com.example.outgoit.review.trail.TrailReviewService;
import com.example.outgoit.trail.dto.FeatureData;
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

@Controller
@RequestMapping("/hiking")
public class TrailRoutePageController {
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////// 의존성 주입 코드 ////////////////////////////////////////////////////
    private final TrailRouteService trailRouteService;
    public final TrailReviewService trailReviewService;

    public TrailRoutePageController(TrailRouteService trailRouteService, TrailReviewService trailReviewService) {

        this.trailRouteService = trailRouteService;
        this.trailReviewService = trailReviewService;
    }
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//    public TrailRoutePageController(TrailReviewService trailReviewService){
//        this.trailReviewService = trailReviewService;
//    }


    @GetMapping
    public String getTrailRoutePage() {
        return "jiho/trail";
    }

    @GetMapping("/draft1")
    public String sendDraft1() {
        return "kmh/hiking";
    }

//    @GetMapping
//    public String getTrailRoutePage() {
//        return "jiho/trail";
//    }
//
//    @GetMapping("/draft1")
//    public String sendDraft1() {
//        return "jsp/hiking/hiking";
//    }


//    @GetMapping("/draft2min")
//    public String sendDraft2(){
//        return "kmh/hiking3";
//    }

    //    @PostMapping("/detail/{lngi}/{lati}")
//    public ArrayList<TrailRouteDTO> GetDetailTrain(@PathVariable ("lngi") double lngi, @PathVariable ("lati") double lati) throws Exception {
//       trailRouteService.getTrailRouteList(lngi, lati);
//        {
//            return new ArrayList<TrailRouteDTO>();
//        }
//
//    }

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

        String ratingAvg;
        try {
            ratingAvg = trailReviewService.getTrailRouteRating(trailRouteId).get(0).toString();
        } catch (NullPointerException e) {
            ratingAvg = "아직 평균평점 정보가 없어요!";
        }

        ArrayList<FeatureData> trailRouteList = trailRouteService.getTrailRouteList(lngi, lati); // list를 반환함.

        // 한라산을 검색했을때 분류한 5개의 등산로가 배열로 담겨있음!

        // 모델에 trailRouteList를 추가
        model.addAttribute("trailRouteList", trailRouteList.get(index).getProperties());
        model.addAttribute("trailPath", trailRouteList.get(index).getGeometry().getCoordinates().get(0));
        model.addAttribute("trailRouteId", trailRouteList.get(index).getId());
        model.addAttribute("ratingAvg", ratingAvg);
        model.addAttribute("existReviews", !reviews.isEmpty());
        model.addAttribute("hikingContentPage", "hiking_information.jsp");

        return "jsp/hiking/container"; // yourViewName은 실제로 사용할 JSP 파일의 이름이어야 합니다.
    }

    @GetMapping("/detail/{TrailRouteName}")
    @ResponseBody
    public String sendError() {
        return "잘못된 접근입니다";
    }

}
