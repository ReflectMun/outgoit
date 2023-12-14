package com.example.outgoit.review.camping;

import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class CampingReviewService {
    //////////////////// 초기화 코드니까 말 없이 건드리지 마시오 /////////////////////////
    private final CampingReviewRepositoryInterface repo;

    public CampingReviewService(CampingReviewRepositoryInterface repo){
        this.repo = repo;
    }
    ////////////////////////////////////////////////////////////////////////////

    ///////////////////////////// 서비스 구현 /////////////////////////////////////
    // 해당 캠핑장의 리뷰 모두 불러오는 메서드
    public ArrayList<CampingReview> loadCampingAreaReview(int campingAreaId){
        return new ArrayList<CampingReview>(repo.findByCampingAreaId(campingAreaId));
    }

    // 리뷰 수정 및 삭제를 위해 해당 작업을 할 리뷰를 불러오는 메서드
    public ArrayList<CampingReview> getCampingAreaReview(int commentId){
        return new ArrayList<CampingReview>(repo.findByCommentNumber(commentId));
    }

    // 사용자가 입력한 비밀번호가 일치하는지 확인하는 메서드
    public boolean isCorrectPassword(String password, int commentId){
        CampingReview review = this.getCampingAreaReview(commentId).get(0);
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
            int campingAreaId
    ){
        repo.save(new CampingReview(
                author,
                password,
                content,
                rating,
                campingAreaId
        ));
        System.out.println("새로운 리뷰가 작성됨");
    }

    // 캠핑장 평점 조회
    public ArrayList<Object> getCampingAreaRating(int campingAreaId){
        return new ArrayList<>(this.repo.findAvgRatingByCampingAreaId(campingAreaId));
    }
}