package com.example.outgoit.trail;

import com.example.outgoit.camp.CampingAreaInfoDTO;
import com.example.outgoit.review.camping.CampingReview;
import com.example.outgoit.review.trail.TrailReview;
import com.example.outgoit.review.trail.TrailReviewService;
import com.example.outgoit.trail.dto.FeatureData;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@Controller
@RequestMapping("/hiking")
public class TrailRoutePageController {
    private final TrailRouteService trailRouteService;
    public final TrailReviewService trailReviewService;

    public TrailRoutePageController(TrailRouteService trailRouteService, TrailReviewService trailReviewService) {
        this.trailRouteService = trailRouteService;
        this.trailReviewService = trailReviewService;
    }

//    public TrailRoutePageController(TrailReviewService trailReviewService){
//        this.trailReviewService = trailReviewService;
//    }

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
                                 @PathVariable ("index") int index,
                                 @PathVariable("trailRouteId") String trailRouteId,
                                 Model model) throws Exception
    {


            Pageable modified = PageRequest.of(0, pageable.getPageSize(), pageable.getSort());
            ArrayList<TrailReview> reviews =
                    new ArrayList<>(trailReviewService.loadTrailRouteReview(trailRouteId, modified).getContent());

            String ratingAvg;
            try {
                ratingAvg = trailReviewService.getTrailRouteRating(trailRouteId).get(0).toString();
            }
            catch (NullPointerException e){
                ratingAvg = "아직 평균평점 정보가 없어요!";
            }

    ArrayList<com.example.outgoit.trail.dto.FeatureData> trailRouteList = trailRouteService.getTrailRouteList(lngi, lati); // list를 반환함.
        System.out.println(index);

    // 한라산을 검색했을때 분류한 5개의 등산로가 배열로 담겨있음!
        System.out.println(trailRouteList.get(index).getProperties());

    // 모델에 trailRouteList를 추가
    model.addAttribute("trailRouteList", trailRouteList.get(index).getProperties());
    model.addAttribute("trailRouteId", trailRouteList.get(index).getId());
    model.addAttribute("ratingAvg", ratingAvg);
    model.addAttribute("existReviews", !reviews.isEmpty());
    model.addAttribute("hikingContentPage", "hiking_information.jsp");



        // 모델에 trailRouteList를 추가
//    model.addAttribute("trailRouteList", trailRouteList);


//    // 다른 TrailRouteDTO 속성들을 얻어와서 모델에 추가
//    // ...
//
        return "jsp/hiking/container"; // yourViewName은 실제로 사용할 JSP 파일의 이름이어야 합니다.
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
    public String sendError() {
        return "잘못된 접근입니다";
    }

}
