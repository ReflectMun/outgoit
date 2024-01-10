package com.example.outgoit.review.camping;

import com.example.outgoit.review.camping.dto.NotificationProcessStatusDTO;
import jakarta.transaction.Transactional;
import org.springframework.dao.OptimisticLockingFailureException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
    // 해당 캠핑장의 리뷰를 페이지별로 지정해서 불러오는 메서드
    public Page<CampingReview> loadCampingAreaReview(int campingAreaId, Pageable pageable){
        return repo.findByCampingAreaIdAndIsDeletedFalse(campingAreaId, pageable);
    }

    // 리뷰 수정 및 삭제를 위해 해당 작업을 할 리뷰를 불러오는 메서드
    public ArrayList<CampingReview> getCampingAreaReview(Long commentId){
        return new ArrayList<CampingReview>(repo.findByCommentNumberAndIsDeletedFalse(commentId));
    }

    // 사용자가 입력한 비밀번호가 일치하는지 확인하는 메서드
    public Boolean isPasswordMatch(String password, Long commentId){
        CampingReview review = this.getCampingAreaReview(commentId).get(0);
        return review.getPassword().equals(password);
    }

    // 리뷰 내용을 수정하는 메서드(만약 비밀번호가 맞으면)
    @Transactional
    public NotificationProcessStatusDTO updateReviewContent(String password, Long commentId, String content, Long rating){
        if(password == null){
            System.out.println("비밀번호 검증 중 오류 발생");
            return new NotificationProcessStatusDTO(5202, "비밀번호가 일치하는지 확인하는 중에 오류가 발생했습니다");
        }

        try {
            if(!isPasswordMatch(password, commentId)){
                System.out.println("비밀번호가 일치하지 않아 리뷰를 수정할 수 없음");
                return new NotificationProcessStatusDTO(5201, "비밀번호가 일치하지 않습니다!");
            }
        } catch (IndexOutOfBoundsException e) {
            System.out.println("DB 내부에 해당하는 리뷰가 없음");
            return new NotificationProcessStatusDTO(5203, "존재하지 않거나 이미 삭제된 리뷰의 수정을 시도했습니다");
        }

        Integer countOfUpdatedRecord = this.repo.updateContentByCommentNumber(content, commentId, rating);
        System.out.printf("총 %d개의 리뷰가 수정됨. 레코드 넘버: %d\n", countOfUpdatedRecord, commentId);
        return new NotificationProcessStatusDTO(200);
    }

    // 리뷰를 삭제하는 메서드(만약 비밀번호가 맞으면)
    @Transactional
    public NotificationProcessStatusDTO deleteReview(Long commentId, String password){
        if(password == null){
            System.out.println("비밀번호 검증 중 오류 발생");
            return new NotificationProcessStatusDTO(5102, "비밀번호가 일치하는지 확인하는 중에 오류가 발생했습니다");
        }

        try {
            if(!isPasswordMatch(password, commentId)){
                System.out.println("입력된 비밀번호가 일치하지 않음");
                return new NotificationProcessStatusDTO(5101, "입력된 비밀번호가 일치하지 않습니다!");
            }
        } catch (IndexOutOfBoundsException e) {
            System.out.println("DB 내부에 해당하는 리뷰가 없음");
            return new NotificationProcessStatusDTO(5103, "존재하지 않거나 이미 삭제된 리뷰의 삭제를 시도했습니다");
        }

        int countOfDeletedRecord = repo.deleteByCommentNumber(commentId);
        System.out.printf("총 %d개의 리뷰가 삭제됨. 레코드 넘버: %d\n", countOfDeletedRecord, commentId);
        return new NotificationProcessStatusDTO(200);
    }

    // 리뷰 작성
    public Integer submitReview(
            String author,
            String password,
            String content,
            int rating,
            int campingAreaId
    ){
        try {
            repo.save(new CampingReview(
                    author,
                    password,
                    content,
                    rating,
                    campingAreaId
            ));
            System.out.println("새로운 리뷰가 작성됨");
            return 200;
        } catch (IllegalArgumentException e) {
            return 701;
        } catch (OptimisticLockingFailureException e){
            return 702;
        }
    }

    // 캠핑장 평점 조회
    public ArrayList<Object> getCampingAreaRating(int campingAreaId){
        return new ArrayList<>(this.repo.findAvgRatingByCampingAreaIdAndIsDeletedFalse(campingAreaId));
    }
}