package com.example.outgoit.review.trail;

import org.hibernate.annotations.Parameter;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.Param;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/review/trail")
public class TrailReviewApiController {
    //////////////////// 초기화 코드니까 말 없이 건드리지 마시오 /////////////////////////

    public final TrailReviewService trailReviewService;

    public TrailReviewApiController(TrailReviewService trailReviewService){
        this.trailReviewService = trailReviewService;
    }
    ////////////////////////////////////////////////////////////////////////////

//    @PostMapping("/submit")
//    public boolean submitTrailRouteReview(String author, String password, String content, Integer rating, String trailRouteId){
//        trailReviewService.submitReview( author, password, content, rating, trailRouteId);
//        return true;
//    }

    @PostMapping("/submit")
    public boolean submitTrailRouteReview(@RequestBody TrailReview trailReview){
        trailReviewService.submitReview(
                trailReview.getAuthor(),
                trailReview.getPassword(),
                trailReview.getContent(),
                trailReview.getRating(),
                trailReview.getTrailRouteId()
        );
        return true;
    }

    @PostMapping("/rating")
    public ArrayList<Object> getTrailRouteReview(String trailRouteId){
        return new  ArrayList<> (trailReviewService.getTrailRouteRating(trailRouteId));
    }
    @PostMapping("/update")
    public boolean updateReview(String content, Integer commentId){
        trailReviewService.updateReviewContent(content, commentId);
        return true;

    }

    @PostMapping("/delete")
    public boolean deleteReview(Integer commentId){
        trailReviewService.deleteReview(commentId);
        return true;
    }

    @GetMapping("/list")
    public ArrayList<TrailReview> getTrailRouteReviewList(@PageableDefault(size = 5, sort = "commentNumber",direction = Sort.Direction.DESC) Pageable pageable,
                                                          String trailRouteId, Integer pageNumber){
        Pageable modified = PageRequest.of(pageNumber -1, pageable.getPageSize(), pageable.getSort());
        return new ArrayList<>(trailReviewService.loadTrailRouteReview(trailRouteId , modified).getContent());
    }
//    @GetMapping("/paging")
//    public ArrayList<TrailReview> getAllTrailRouteReview(@PageableDefault(size = 5, sort = "commentNumber",direction = Sort.Direction.DESC) Pageable pageable){
//        List<TrailReview> trailReviewList = trailReviewService.findTrailRouteByPageRequest("1",pageable).getContent();
//        ArrayList<TrailReview> trailReview = new ArrayList<>(trailReviewList);
//        return trailReview;
////        return  trailReviewService.findTrailRouteByPageRequest("1",pageable);
//    }

}
