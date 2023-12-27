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
// 1.
//    @PostMapping("/update")
//    public boolean updateReview(@RequestParam String content,@RequestParam Integer commentNumber){
////        System.out.println(content);
//        System.out.println(commentNumber);
//        trailReviewService.updateReviewContent(content, commentNumber);
//        return true;
//
//    }

// 2.
//    @PostMapping("/update/{content}/{commentNumber}")
//    public boolean updateReview(@PathVariable String content,@PathVariable Integer commentNumber){
//        System.out.println(content);
//        System.out.println(commentNumber);
//        trailReviewService.updateReviewContent(content, commentNumber);
//        return true;
//
//    }

    // 3.
    @PostMapping("/update")
    public int updateReview(@RequestBody TrailReview trailReview){
        System.out.println(trailReview.getContent());
        System.out.println(trailReview.getCommentNumber());
//        trailReviewService.updateReviewContent(trailReview.getContent(), Math.toIntExact(trailReview.getCommentNumber()));
     return    trailReviewService.updateReviewContent(trailReview);


    }

    @PostMapping("/delete")
    public int deleteReview(@RequestBody TrailReview trailReview){
      return   trailReviewService.deleteReview(Math.toIntExact(trailReview.getCommentNumber()));

    }

    @GetMapping("/list")
    public ArrayList<TrailReview> getTrailRouteReviewList(@PageableDefault(size = 5, sort = "commentNumber",direction = Sort.Direction.DESC) Pageable pageable,
                                                          String trailRouteId, Integer pageNumber){
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
//    @GetMapping("/paging")
//    public ArrayList<TrailReview> getAllTrailRouteReview(@PageableDefault(size = 5, sort = "commentNumber",direction = Sort.Direction.DESC) Pageable pageable){
//        List<TrailReview> trailReviewList = trailReviewService.findTrailRouteByPageRequest("1",pageable).getContent();
//        ArrayList<TrailReview> trailReview = new ArrayList<>(trailReviewList);
//        return trailReview;
////        return  trailReviewService.findTrailRouteByPageRequest("1",pageable);
//    }

}
