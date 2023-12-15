package com.example.outgoit.review.cycle;

import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class CycleRouteReviewService {
    //////////////////// 초기화 코드니까 말 없이 건드리지 마시오 /////////////////////////
    private final CycleRouteReviewRepositoryInterface repo;

    public CycleRouteReviewService(CycleRouteReviewRepositoryInterface repo){
        this.repo = repo;
    }
    ////////////////////////////////////////////////////////////////////////////

    ///////////////////////////// 서비스 구현 /////////////////////////////////////
    // 해당 자전거길의 리뷰 모두 불러오는 메서드
    public ArrayList<CycleRouteReview> loadCycleRouteReview(int CycleRouteId){
        return new ArrayList<CycleRouteReview>(repo.findByCycleRouteId(CycleRouteId));
    }

    // 리뷰 수정 및 삭제를 위해 해당 작업을 할 리뷰를 불러오는 메서드
    public ArrayList<CycleRouteReview> getCycleRouteReview(int commentId){
        return new ArrayList<CycleRouteReview>(repo.findByCommentNumber(commentId));
    }

    // 사용자가 입력한 비밀번호가 일치하는지 확인하는 메서드
    public boolean isCorrectPassword(String password, int commentId){
        CycleRouteReview review = this.getCycleRouteReview(commentId).get(0);
        return review.getPassword().equals(password);
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
    public void submitReview(
            String author,
            String password,
            String content,
            int rating,
            int cycleRouteId
    ){
        repo.save(new CycleRouteReview(
                author,
                password,
                content,
                rating,
                cycleRouteId
        ));
        System.out.println("새로운 리뷰가 작성됨");
    }

    // 캠핑장 평점 조회
    public ArrayList<Object> getCycleRouteRating(int cycleRouteId){
        return new ArrayList<>(this.repo.findAvgRatingByCycleRouteId(cycleRouteId));
    }
}