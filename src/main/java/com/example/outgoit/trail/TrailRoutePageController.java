package com.example.outgoit.trail;

import com.example.outgoit.review.camping.CampingReview;
import com.example.outgoit.review.camping.CampingReviewService;
import com.example.outgoit.review.trail.TrailReview;
import com.example.outgoit.review.trail.TrailReviewService;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.ArrayList;

@Controller
@RequestMapping("/trail")
public class TrailRoutePageController {
    //private final TrailReviewService trailReviewService;
    private final TrailRouteService trailRouteService;

    public TrailRoutePageController(TrailRouteService trailRouteService){
        this.trailRouteService = trailRouteService;
    }

//    public TrailRoutePageController(TrailReviewService trailReviewService){
//        this.trailReviewService = trailReviewService;
//    }

    @GetMapping
    public String getTrailRoutePage(){
        return "jiho/trail";
    }
    @GetMapping("/draft1")
    public String sendDraft1(){
        return "kmh/hiking";
    }

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
@PostMapping("/detail/{lngi}/{lati}")
public String GetDetailTrain(@PathVariable("lngi") double lngi, @PathVariable("lati") double lati, Model model) throws Exception {
    System.out.println(lngi); //위도
    System.out.println(lati); // 경도
    System.out.println("111111");

    ArrayList<FeatureData> trailRouteList = trailRouteService.getTrailRouteList(lngi, lati); // list를 반환함.

    // 한라산을 검색했을때 분류한 5개의 등산로가 배열로 담겨있음!
    for (FeatureData f : trailRouteList){
        System.out.println();
    }

    // 모델에 trailRouteList를 추가
    model.addAttribute("trailRouteList", trailRouteList);
//    // 다른 TrailRouteDTO 속성들을 얻어와서 모델에 추가
//    // ...
//
    return "hj/camp/trail_information"; // yourViewName은 실제로 사용할 JSP 파일의 이름이어야 합니다.
}



//            @PageableDefault(size = 5, sort = "commentNumber", direction = Sort.Direction.DESC) Pageable pageable,
//            @PathVariable("TrailRouteName") String trailRouteName,



//            TrailRouteDTO data
//            Model model
//
//    {  TrailRouteService(lngi, lati);
//        System.out.printf(String.valueOf(data));
 //       Pageable modified = PageRequest.of(0, pageable.getPageSize(), pageable.getSort());
//       ArrayList<TrailReview> reviews =
//               new ArrayList<>(trailReviewService.loadTrailRouteReview(data.getId()));
////        model.addAttribute("trailAreaName", data.getProperties().getMntn_nm());
//        model.addAttribute("trailKm", data.getProperties().getSec_len());
//        model.addAttribute("trailHour", data.getProperties().getUp_min());
//        model.addAttribute("trailLevel", data.getProperties().getCat_nam());
//
//
//        model.addAttribute("existReviews", !reviews.isEmpty());
//        model.addAttribute("reviews", reviews);

//        return "hj/camp/trail_information";
//    }
    @GetMapping("/detail/{TrailRouteName}")
    @ResponseBody
    public String sendError(){
        return "잘못된 접근입니다";
    }

}
