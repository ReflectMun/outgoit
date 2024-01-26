package com.example.outgoit.review.trail;

import com.example.outgoit.encrypt.EncryptService;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
@RequiredArgsConstructor
public class TrailReviewService {
    private final TrailReviewRepositoryInterface repo;
    private final EncryptService encryptService;

    ///////////////////////////// 서비스 구현 /////////////////////////////////////
    // 해당 등산로의 리뷰 모두 불러오는 메서드
    public Page<TrailReview> loadTrailRouteReview(String trailRouteId, Pageable pageable) {
        return this.repo.findAllByTrailRouteIdAndIsDeletedFalse(trailRouteId, pageable);
    }

    // 리뷰 내용을 수정하는 메서드(만약 비밀번호가 맞으면)
    @Transactional
    public int updateReviewContent(TrailReview trailReview) {
        try {
            if(!encryptService.isPasswordMatch_Trail(
                    trailReview.getPassword(),
                    repo.findByCommentNumberAndIsDeletedFalse(trailReview.getCommentNumber()).get(0)
            )){
                System.out.printf("비밀번호가 일치하지 않아 리뷰를 수정할 수 없음, 댓글번호: %s\n", trailReview.getCommentNumber());
                return 0;
            }
        } catch (IndexOutOfBoundsException e) {
            System.out.printf("이미 삭제됐거나 존재하지 않는 리뷰의 수정을 시도함, 댓글번호: %s\n", trailReview.getCommentNumber());
            return 0;
        }

        return this.repo.updateContentByCommentNumber(
                trailReview.getContent(),
                trailReview.getCommentNumber(),
                trailReview.getRating()
        );
    }

    // 리뷰를 삭제하는 메서드(만약 비밀번호가 맞으면)
    @Transactional
    public int deleteReview(String password, Long commentNumber) {
        try {
            if(!encryptService.isPasswordMatch_Trail(
                    password,
                    repo.findByCommentNumberAndIsDeletedFalse(commentNumber).get(0)
            )){
                System.out.printf("비밀번호가 일치하지 않아 리뷰를 수정할 수 없음, 댓글번호: %s\n", commentNumber);
                return 0;
            }
        } catch (Exception e) {
            System.out.printf("이미 삭제됐거나 존재하지 않는 리뷰의 수정을 시도함, 댓글번호: %s\n", commentNumber);
            return 0;
        }

        int countOfDeletedRecord = this.repo.deleteByCommentNumber(commentNumber);
        System.out.printf("총 %d개의 리뷰가 삭제됨. 레코드 넘버: %d\n", countOfDeletedRecord, commentNumber);
        return 1;
    }

    // 리뷰 작성
    public int submitReview(
            String author,
            String password,
            String content,
            int rating,
            String trailRouteId
    ) {
        if(password == null) {
            System.out.println("비밀번호 값이 null임");
            return 0;
        }

        repo.save(new TrailReview(
                author,
                encryptService.getEncryptedPassword(password),
                content,
                rating,
                trailRouteId
        ));
        System.out.println("새로운 리뷰가 작성됨");
        return 1;
    }

    // 등산로 평점 조회
    public ArrayList<Object> getTrailRouteRating(String trailRouteId) {
        return new ArrayList<>(this.repo.findAvgRatingByTrailRouteId(trailRouteId));
    }
}
