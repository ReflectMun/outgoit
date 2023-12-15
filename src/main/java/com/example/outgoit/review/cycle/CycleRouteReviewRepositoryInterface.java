package com.example.outgoit.review.cycle;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CycleRouteReviewRepositoryInterface extends JpaRepository<CycleRouteReview, Long> {
    // 특정 자전거길의 평균평점을 불러오는 쿼리문
    @Query("SELECT AVG(rating) FROM cycle_route_review WHERE cycleRouteId = :cycleRouteId")
    List<Object> findAvgRatingByCycleRouteId(@Param("cycleRouteId") int cycleRouteId);

    // 해당 자전거길의 리뷰를 모두 불러오는 쿼리문
    List<CycleRouteReview> findByCycleRouteId(int cycleRouteId);

    // 수정 및 삭제를 위한 특정 리뷰 하나만을 불러오기 위한 쿼리문
    List<CycleRouteReview> findByCommentNumber(int commentNumber);

    @Modifying
    @Query("UPDATE cycle_route_review SET content = :content WHERE commentNumber = :commentNumber")
    // 특정 리뷰 내용을 수정하는 쿼리문
    int updateContentByCommentNumber(
            @Param("content") String content,
            @Param("commentNumber") int commentNumber
    );

    // 특정 리뷰를 삭제하는 쿼리문
    int deleteByCommentNumber(int commentNumber);
}
