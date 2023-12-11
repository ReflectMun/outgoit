package com.example.outgoit.review.trail;

import jakarta.transaction.Transactional;
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
    public ArrayList<TrailReview> loadTrailRouteReview(String trailRouteId){
        return  new ArrayList<TrailReview>(repo.findByTrailRouteId(trailRouteId));
    }

    // 리뷰 수정 및 삭제를 위해 해당 작업을 할 리뷰를 불러오는 메서드
    public ArrayList<TrailReview> getTrailRouteReview(int commentId){
        return  new ArrayList<TrailReview>(repo.findByCommentNumber(commentId));
    }

    // 리뷰 내용을 수정하는 메서드(만약 비밀번호가 맞으면)
    @Transactional
    public void updateReviewContent(String content, int commentId){
        int countOfUpdatedRecord = this.repo.updateContentByCommentNumber(content, commentId);
        System.out.printf("총 %d개의 리뷰가 수정됨. 레코드 넘버: %d\n", countOfUpdatedRecord, commentId);
    }
    // 리뷰를 삭제하는 메서드(만약 비밀번호가 맞으면)
    @Transactional
    public void deleteReview(int commentId){
        int countOfDeletedRecord = this.repo.deleteByCommentNumber(commentId);
        System.out.printf("총 %d개의 리뷰가 삭제됨. 레코드 넘버: %d\n", countOfDeletedRecord, commentId);
    }

    // 리뷰 작성
    public  void submitReview(
            String author,
            String password,
            String content,
            int rating,
            String TrailRouteId
    ){
        repo.save(new TrailReview(
                author,
                password,
                content,
                rating,
                TrailRouteId
        ));
        System.out.println("새로운 리뷰가 작성됨");
    }

    // 등산로 평점 조회
    public  ArrayList<Object> getTrailRouteRating(String trailRouteId){
        return  new ArrayList<>(this.repo.findAvgRatingByTrailRouteId(trailRouteId));
    }

}
