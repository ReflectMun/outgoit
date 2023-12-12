package com.example.outgoit.review.cycle;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
@RequestMapping("/api/review/cycle-route")
public class CycleRouteReviewApiController {
    //////////////////// 초기화 코드니까 말 없이 건드리지 마시오 /////////////////////////
    private final CycleRouteReviewService cycleRouteReviewService;

    public CycleRouteReviewApiController(CycleRouteReviewService cycleRouteReviewService){
        this.cycleRouteReviewService = cycleRouteReviewService;
    }
    ////////////////////////////////////////////////////////////////////////////

    @PostMapping("/submit")
    public boolean submitCycleRouteReview(){
        cycleRouteReviewService.submitReview(
                "JJ",
                "1234",
                "안녕 자전거길",
                3,
                1
        );

        return true;
    }

    @PostMapping("/rating")
    public ArrayList<Object> getCycleRouteRating(){
        return new ArrayList<>(cycleRouteReviewService.getCycleRouteRating(1));
    }

    @PostMapping("/update")
    public boolean updateReview(){
        cycleRouteReviewService.updateReviewContent(
                "전국일주 쌉가능",
                1
        );

        return true;
    }

    @PostMapping("/delete")
    public boolean deleteReview(){
        cycleRouteReviewService.deleteReview(2);
        return true;
    }

    @GetMapping("/list")
    public ArrayList<CycleRouteReview> getCycleRouteReviewList(){
        return cycleRouteReviewService.loadCycleRouteReview(1);
    }
}
