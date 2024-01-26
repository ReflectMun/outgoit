package com.example.outgoit.review.camping;

import com.example.outgoit.review.camping.dto.CampingReviewDeleteDTO;
import com.example.outgoit.review.camping.dto.CampingReviewModifyingDTO;
import com.example.outgoit.review.camping.dto.CampingReviewSubmitBodyDTO;
import com.example.outgoit.review.camping.dto.NotificationProcessStatusDTO;
import com.example.outgoit.review.camping.exception_object.ErrorByDuringTransactionWithDB;
import com.example.outgoit.review.camping.exception_object.TakenValueIsNull;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController
@RequestMapping("/api/review/camping")
@RequiredArgsConstructor
public class CampingReviewApiController {
    //////////////////// 초기화 코드니까 말 없이 건드리지 마시오 /////////////////////////
    private final CampingReviewService campingReviewService;
    ////////////////////////////////////////////////////////////////////////////

    @PostMapping("/submit")
    public NotificationProcessStatusDTO submitCampingAreaReview(@RequestBody CampingReviewSubmitBodyDTO body) {
        Integer resultCode = null;
        try {
            if (body.getAuthor().isEmpty() ||
                    body.getPassword().isEmpty() ||
                    body.getContent().isEmpty() ||
                    body.getRating() == null ||
                    body.getCampingAreaId() == null) {
                throw new TakenValueIsNull("리뷰 작성에 필요한 값들 중 일부가 누락되어 전달되었습니다");
            }

            resultCode = campingReviewService.submitReview(
                    body.getAuthor(),
                    body.getPassword(),
                    body.getContent(),
                    body.getRating(),
                    body.getCampingAreaId()
            );

            if (resultCode != 200){
                throw new ErrorByDuringTransactionWithDB();
            }

            return new NotificationProcessStatusDTO(resultCode, null);
        } catch (TakenValueIsNull e) {
            resultCode = 703;
            return new NotificationProcessStatusDTO(resultCode, e.getMessage());

        } catch (ErrorByDuringTransactionWithDB e) {
            return new NotificationProcessStatusDTO(resultCode, e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();

            if (resultCode == null)
                resultCode = 700;

            return new NotificationProcessStatusDTO(resultCode, e.getMessage());
        }
    }

    @GetMapping("/rating")
    public ArrayList<Object> getCampingAreaRating(Integer campingAreaId) {
        return new ArrayList<>(campingReviewService.getCampingAreaRating(campingAreaId));
    }

    @PostMapping("/update")
    public NotificationProcessStatusDTO updateReview(@RequestBody CampingReviewModifyingDTO body) {
        return campingReviewService.updateReviewContent(
                body.getPassword(),
                body.getCommentNumber(),
                body.getContent(),
                body.getRating()
        );
    }

    @PostMapping("/delete")
    public NotificationProcessStatusDTO deleteReview(@RequestBody CampingReviewDeleteDTO body) {
        return campingReviewService.deleteReview(
                body.getCommentNumber(),
                body.getPassword()
        );
    }

    @GetMapping("/list")
    public ArrayList<CampingReview> getCampingAreaReviewList(
            @PageableDefault(size = 6, sort = "commentNumber", direction = Sort.Direction.DESC) Pageable pageable,
            Integer campingAreaId,
            Integer pageNumber
    ) {
        if (pageNumber == 0) {
            return new ArrayList<>();
        }

        Pageable modified = PageRequest.of(pageNumber - 1, pageable.getPageSize(), pageable.getSort());
        Page<CampingReview> result = campingReviewService.loadCampingAreaReview(campingAreaId, modified);

        if (pageNumber > result.getTotalPages()) {
            return new ArrayList<>();
        }

        return new ArrayList<CampingReview>(result.getContent());
    }
}