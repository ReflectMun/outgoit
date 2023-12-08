package com.example.outgoit.review;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
@RequestMapping("/api/review/camping")
public class CampingReviewApiController {
    private final CampingReviewService campingReviewService;

    public CampingReviewApiController(CampingReviewService campingReviewService){
        this.campingReviewService = campingReviewService;
    }

    @PostMapping("/submit")
    public boolean submitCampingAreaReview(){
        campingReviewService.submitReview(
                "jh",
                "1234",
                "안녕 리뷰",
                5,
                1
        );

        return true;
    }

    @PostMapping("/rating")
    public ArrayList<Object> getCampingAreaRating(){
        return new ArrayList<>(campingReviewService.getCampingAreaRating(1));
    }

    @PostMapping("/update")
    public boolean updateReview(){
        campingReviewService.updateReviewContent(
                "하하하하하",
                1
        );

        return true;
    }

    @PostMapping("/delete")
    public boolean deleteReview(){
        campingReviewService.deleteReview(2);
        return true;
    }

    @GetMapping("/list")
    public ArrayList<CampingReview> getCampingAreaList(){
        return campingReviewService.loadCampingAreaReview(1);
    }
}
