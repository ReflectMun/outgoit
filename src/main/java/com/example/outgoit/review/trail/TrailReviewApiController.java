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
    @PostMapping("/submit")
    public int submitTrailRouteReview(@RequestBody TrailReview trailReview){
       return trailReviewService.submitReview(
                trailReview.getAuthor(),
                trailReview.getPassword(),
                trailReview.getContent(),
                trailReview.getRating(),
                trailReview.getTrailRouteId()
        );
    }

    @PostMapping("/rating")
    public ArrayList<Object> getTrailRouteReview(@RequestBody TrailReview trailReview){
        return new  ArrayList<> (trailReviewService.getTrailRouteRating(trailReview.getTrailRouteId()));
    }

    @PostMapping("/update")
    public int updateReview(@RequestBody TrailReview trailReview){
     return    trailReviewService.updateReviewContent(trailReview);
    }

    @PostMapping("/delete")
    public int deleteReview(@RequestBody TrailReview trailReview){
      return   trailReviewService.deleteReview((long) Math.toIntExact(trailReview.getCommentNumber()));
    }

    @GetMapping("/list")
    public ArrayList<TrailReview> getTrailRouteReviewList(
            @PageableDefault(size = 5, sort = "commentNumber",direction = Sort.Direction.DESC) Pageable pageable,
            String trailRouteId,
            Integer pageNumber
    ){
        if (pageNumber == 0){
            return  new ArrayList<>();
        }
        Pageable modified = PageRequest.of(pageNumber -1, pageable.getPageSize(), pageable.getSort());
        Page<TrailReview> result = trailReviewService.loadTrailRouteReview(trailRouteId , modified);
        if (pageNumber > result.getTotalPages()){
            return new ArrayList<>();
        }
        return new ArrayList<TrailReview>(result.getContent());
    }
}
