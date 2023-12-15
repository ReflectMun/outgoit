package com.example.outgoit.camp;

import com.example.outgoit.review.camping.CampingReview;
import com.example.outgoit.review.camping.CampingReviewService;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@Controller
@RequestMapping("/camping")
public class CampingAreaSearchPageController {
    //////////////////// 의존성 주입 코드 //////////////////////
    // 허락없이 건들면 뒤집니다
    private final CampingReviewService campingReviewService;

    public CampingAreaSearchPageController(CampingReviewService campingReviewService){
        this.campingReviewService = campingReviewService;
    }
    ////////////////////////////////////////////////////////

    @GetMapping
    public String sendCampingSearchingPage(Model model){
        model.addAttribute("msg", "camping");
        return "kmh/camping";
    }

    @GetMapping("/draft1")
    public String sendDraft1(){
        return "kmh/draft/1";
    }
    @GetMapping("/draft2")
    public String sendDraft2(){
        return "kmh/draft/2";
    }

    @PostMapping("/detail/{campingAreaName}")
    public String sendDetailPage(
            @PageableDefault(size = 5, sort = "commentNumber", direction = Sort.Direction.DESC) Pageable pageable,
            CampingAreaInfoDTO data,
            Model model
    ){
        Pageable modified = PageRequest.of(0, pageable.getPageSize(), pageable.getSort());
        ArrayList<CampingReview> reviews =
                campingReviewService.loadCampingAreaReview(data.getContentId(), modified);

        model.addAttribute("thumbnail", data.getFirstImageUrl());
        model.addAttribute("campingAreaName", data.getFacltNm());
        model.addAttribute("telephoneNumber", data.getTel());
        model.addAttribute("periodOfOperation", data.getOperPdCl() + " " + data.getOperDecl());
        model.addAttribute("address", data.getAddr1() + " " + data.getAddr2());
        model.addAttribute(
                "subsidiaryFacilities",
                data.getSbrsEtc().isEmpty()
                        ? "부대시설 정보가 없습니다"
                        : data.getSbrsEtc()
        );
        model.addAttribute("etc", data.getSbrsEtc());
        model.addAttribute("campingAreaNumber", data.getContentId());

        model.addAttribute("existReviews", !reviews.isEmpty());
        model.addAttribute("reviews", reviews);

        return "hj/camp/camp_information";
    }

    @GetMapping("/detail/{campingAreaName}")
    @ResponseBody
    public String sendError(){
        return "잘못된 접근입니다";
    }
}
