package com.example.outgoit.review.trail;

import jakarta.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class TrailReviewService {

    //////////////////// 초기화 코드니까 말 없이 건드리지 마시오 /////////////////////////
    private final TrailReviewRepositoryInterface repo;

    public TrailReviewService(TrailReviewRepositoryInterface repo) { this.repo = repo; }
    ////////////////////////////////////////////////////////////////////////////

    ///////////////////////////// 서비스 구현 /////////////////////////////////////
    // 해당 등산로의 리뷰 모두 불러오는 메서드
    public Page<TrailReview> loadTrailRouteReview(String trailRouteId, Pageable pageable){


        return this.repo.findAllByTrailRouteIdAndIsDeletedFalse(trailRouteId ,pageable);
    }

    // 리뷰 수정 및 삭제를 위해 해당 작업을 할 리뷰를 불러오는 메서드
//    public ArrayList<TrailReview> getTrailRouteReview(int commentId){
//        return  new ArrayList<TrailReview>(repo.findByCommentNumber(commentId));
//    }

    // 리뷰 내용을 수정하는 메서드(만약 비밀번호가 맞으면)

    @Transactional
    public int updateReviewContent(TrailReview trailReview){
        return this.repo.updateContentByCommentNumber(trailReview.getContent(), (long) Math.toIntExact(trailReview.getCommentNumber()),trailReview.getRating());
//        System.out.printf("총 %d개의 리뷰가 수정됨. 레코드 넘버: %d\n", countOfUpdatedRecord, commentNumber);
    }
    // 리뷰를 삭제하는 메서드(만약 비밀번호가 맞으면)
    @Transactional
    public int deleteReview(Long commentNumber){
        int countOfDeletedRecord = this.repo.deleteByCommentNumber(commentNumber);
        System.out.printf("총 %d개의 리뷰가 삭제됨. 레코드 넘버: %d\n", countOfDeletedRecord, commentNumber);
        return 1;
    }

    // 리뷰 작성
    public int  submitReview(
            String author,
            String password,
            String content,
            int rating,
            String trailRouteId
    ){
      repo.save(new TrailReview(
                author,
                password,
                content,
                rating,
                trailRouteId
        ));
        System.out.println(trailRouteId);
        System.out.println("새로운 리뷰가 작성됨");
        return 1;
    }

    // 등산로 평점 조회
    public  ArrayList<Object> getTrailRouteRating(String trailRouteId){
        return  new ArrayList<>(this.repo.findAvgRatingByTrailRouteId(trailRouteId));
    }

}
