package com.example.outgoit.review.camping;

import com.example.outgoit.nickname.RandomNicknameService;
import com.example.outgoit.review.camping.dto.CampingReviewDeleteDTO;
import com.example.outgoit.review.camping.dto.CampingReviewModifyingDTO;
import com.example.outgoit.review.camping.dto.CampingReviewSubmitBodyDTO;
import com.example.outgoit.review.camping.dto.NotificationProcessStatusDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;

@RestController
@RequestMapping("/api/review/camping")
public class CampingReviewApiController {
    //////////////////// 초기화 코드니까 말 없이 건드리지 마시오 /////////////////////////
    private final CampingReviewService campingReviewService;
    private final RandomNicknameService randomNicknameService;
    public CampingReviewApiController(CampingReviewService campingReviewService, RandomNicknameService randomNicknameService){
        this.campingReviewService = campingReviewService;
        this.randomNicknameService = randomNicknameService;
    }
    ////////////////////////////////////////////////////////////////////////////

    @PostMapping("/submit")
    public NotificationProcessStatusDTO submitCampingAreaReview(@RequestBody CampingReviewSubmitBodyDTO body) {
        Integer resultCode = null;
        try {
            if (body.getAuthor().isEmpty() || body.getPassword().isEmpty() ||
                    body.getContent().isEmpty() || body.getCampingAreaId() == null) {
                resultCode = 703;
                throw new Exception("올바르지 않은 데이터가 전달되었습니다");
            }

            MessageDigest hashing = MessageDigest.getInstance("SHA-512");
            hashing.reset();
            hashing.update(body.getPassword().getBytes("utf8"));
            String password = String.format("%0128x", new BigInteger(1, hashing.digest()));

            resultCode = campingReviewService.submitReview(
//                    randomNicknameService.getRandomNickname(),
                    body.getAuthor(),
                    password,
                    body.getContent(),
                    body.getRating(),
                    body.getCampingAreaId()
            );

            if (resultCode != 200)
                throw new Exception("리뷰 작성 중 문제가 발생하였습니다");

            return new NotificationProcessStatusDTO(resultCode, null);
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
        String password = null;

        try {
            MessageDigest hashing = MessageDigest.getInstance("SHA-512");
            hashing.reset();
            hashing.update(body.getPassword().getBytes("utf8"));
            password = String.format("%0128x", new BigInteger(1, hashing.digest()));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return campingReviewService.updateReviewContent(
                password,
                body.getCommentNumber(),
                body.getContent(),
                body.getRating()
        );
    }

    @PostMapping("/delete")
    public NotificationProcessStatusDTO deleteReview(@RequestBody CampingReviewDeleteDTO body) {
        String password = null;

        try {
            MessageDigest hashing = MessageDigest.getInstance("SHA-512");
            hashing.reset();
            hashing.update(body.getPassword().getBytes("utf8"));
            password = String.format("%0128x", new BigInteger(1, hashing.digest()));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return campingReviewService.deleteReview(body.getCommentNumber(), password);
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