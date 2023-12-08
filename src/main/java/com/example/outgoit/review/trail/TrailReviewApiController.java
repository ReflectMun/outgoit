package com.example.outgoit.review.trail;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
@RequestMapping("/api/review/trail")
public class TrailReviewApiController {
    //////////////////// 초기화 코드니까 말 없이 건드리지 마시오 /////////////////////////

    public final TrailReviewService trailReviewService;

    public TrailReviewApiController(TrailReviewService trailReviewService){
        this.trailReviewService = trailReviewService;
    }
    ////////////////////////////////////////////////////////////////////////////

    @PostMapping("/submit")
    public boolean submitTrailRouteReview(){
        trailReviewService.submitReview(
                "ms",
                "0518",
                "안녕 등산로 리뷰",
                4,
                "1"
        );
        return true;
    }

    @PostMapping("/rating")
    public ArrayList<Object> getTrailRouteReview(){
        return new  ArrayList<> (trailReviewService.getTrailRouteRating("1"));
    }
    @PostMapping("/update")
    public boolean updateReview(){
        trailReviewService.updateReviewContent(
                "싫다 등산",
                1
        );
        return true;

    }

    @PostMapping("/delete")
    public boolean deleteReview(){
        trailReviewService.deleteReview(2);
        return true;
    }

    @GetMapping("/list")
    public ArrayList<TrailReview> getTrailRouteReviewList(){
        return trailReviewService.loadTrailRouteReview("1");
    }




}
