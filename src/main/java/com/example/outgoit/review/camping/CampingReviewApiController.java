package com.example.outgoit.review.camping;

import com.example.outgoit.review.camping.dto.CampingReviewSubmitBodyDTO;
import com.example.outgoit.review.camping.dto.NotificationProcessStatusDTO;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController
@RequestMapping("/api/review/camping")
public class CampingReviewApiController {
    //////////////////// 초기화 코드니까 말 없이 건드리지 마시오 /////////////////////////
    private final CampingReviewService campingReviewService;

    public CampingReviewApiController(CampingReviewService campingReviewService){
        this.campingReviewService = campingReviewService;
    }
    ////////////////////////////////////////////////////////////////////////////

    @PostMapping("/submit")
    public NotificationProcessStatusDTO submitCampingAreaReview(@RequestBody CampingReviewSubmitBodyDTO body){
        Integer resultCode = null;
        try {
            if(body.getAuthor().isEmpty() || body.getPassword().isEmpty() ||
               body.getContent().isEmpty() || body.getCampingAreaId() == null){
                resultCode = 703;
                throw new Exception("올바르지 않은 값이 전달되었습니다");
            }

            resultCode = campingReviewService.submitReview(
                    body.getAuthor(),
                    body.getPassword(),
                    body.getContent(),
                    3,
                    body.getCampingAreaId()
            );

            if(resultCode != 200)
                throw new Exception("리뷰 작성 중 문제가 발생하였습니다");

            return new NotificationProcessStatusDTO(resultCode, null);
        } catch (Exception e) {
            e.printStackTrace();

            if(resultCode == null)
                resultCode = 700;

            return new NotificationProcessStatusDTO(resultCode, e.getMessage());
        }
    }

    @PostMapping("/rating")
    public ArrayList<Object> getCampingAreaRating(){
        return new ArrayList<>(campingReviewService.getCampingAreaRating(1));
    }

    @PostMapping("/update")
    public boolean updateReview(){
        Integer updatedRow = campingReviewService.updateReviewContent(
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
    public ArrayList<CampingReview> getCampingAreaReviewList(
            @PageableDefault(size = 5, sort = "commentNumber", direction = Sort.Direction.DESC) Pageable pageable,
            Integer campingAreaId,
            Integer pageNumber
    ){
        Pageable modified = PageRequest.of(pageNumber, pageable.getPageSize(), pageable.getSort());
        return campingReviewService.loadCampingAreaReview(campingAreaId, modified);
    }
}