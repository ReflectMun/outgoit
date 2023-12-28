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
    private final CampingSearchService campingSearchService;

    public CampingAreaSearchPageController(
            CampingReviewService campingReviewService,
            CampingSearchService campingSearchService
    ){
        this.campingReviewService = campingReviewService;
        this.campingSearchService = campingSearchService;
    }
    ////////////////////////////////////////////////////////

    @GetMapping("/About")
    public String aboutPage(Model model){
        return "RH/jsp/Camping/Camping_About";
        // return "RH/jsp/Hiking/Hiking_About";
        // return "RH/jsp/Riding/Riding_About";
    }
    @GetMapping("/Safety")
    public String safetyPage(Model model){
        return "RH/jsp/Camping/Camping_Safety";
    }
    @GetMapping("/Beginner")
    public String beginnerPage(Model model){
        return "RH/jsp/Camping/Camping_Beginner";
    }

    @PostMapping("/detail/{campingAreaName}")
    public String sendDetailPage(
            @PageableDefault(size = 5, sort = "commentNumber", direction = Sort.Direction.DESC) Pageable pageable,
            CampingAreaInfoDTO data,
            Model model
    ){
        Pageable modified = PageRequest.of(0, pageable.getPageSize(), pageable.getSort());
        ArrayList<CampingReview> reviews =
                new ArrayList<>(campingReviewService.loadCampingAreaReview(data.getContentId(), modified).getContent());

        String ratingAvg;
        try {
            ratingAvg = campingReviewService.getCampingAreaRating(data.getContentId()).get(0).toString();
        }
        catch (NullPointerException e){
            ratingAvg = "아직 평균평점 정보가 없어요!";
        }

        ArrayList<CampingAreaInfoDTO> images = campingSearchService.GetImgSearchedCampingAreaList(data.getContentId());

        model.addAttribute("images", images);
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
//        model.addAttribute("etc", data.getSbrsEtc());
        model.addAttribute("ratingAvg", ratingAvg);
        model.addAttribute("campingAreaNumber", data.getContentId());
        model.addAttribute("existReviews", !reviews.isEmpty());
        model.addAttribute("lineIntro", data.getLineIntro());
        model.addAttribute("generalSite", data.getGnrlSiteCo());
        model.addAttribute("autoSite", data.getAutoStieCo());
        model.addAttribute("animalComingControl", data.getAnimalCmgCl());
        model.addAttribute("equipmentRental", data.getEqpmnLendCl());
        model.addAttribute("trailerAccompanyAt", data.getTrlerAcmpnyAt());
        model.addAttribute("caravanAccompanyAt", data.getCaravAcmpnyAt());
        model.addAttribute("toiletCount", data.getToiletCo());
        model.addAttribute("availableFacilities", data.getPosblFcltyCl());
        model.addAttribute("managementStatement", data.getManageSttus());
        model.addAttribute("holidaySeasonStart", data.getHvofBgnde());
        model.addAttribute("holidaySeasonEnd", data.getHvofEnddle());
        model.addAttribute("showerRoomCount", data.getSwrmCo());
        model.addAttribute("brazierControl", data.getBrazierCl());
        model.addAttribute("siteGrass", data.getSiteBottomCl1());
        model.addAttribute("siteCrushedStone", data.getSiteBottomCl2());
        model.addAttribute("siteDeck", data.getSiteBottomCl3());
        model.addAttribute("siteGravel", data.getSiteBottomCl4());
        model.addAttribute("siteSoil", data.getSiteBottomCl5());
        model.addAttribute("campingContentPage","camp_information.jsp");
        return "jsp/camp/container";
    }

    @GetMapping("/detail/{campingAreaName}")
    @ResponseBody
    public String sendError(){
        return "잘못된 접근입니다";
    }

}
