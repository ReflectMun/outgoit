package com.example.outgoit.review.trail;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TrailReviewRepositoryInterface extends JpaRepository<TrailReview, Long> {
    @Query("select avg(rating) from trail_review where trailRouteId = :trailRouteId")
    List<Object> findAvgRatingByTrailRouteId(@Param("trailRouteId") String trailRouteId);

    List<TrailReview> findByTrailRouteId(String trailRouteId);

    List<TrailReview> findByCommentNumber(int commentNumber);

    @Modifying
    @Query("update trail_review set content = :content where commentNumber = :commentNumber")
    int updateContentByCommentNumber(
            @Param("content") String content,
            @Param("commentNumber") int commentNumber
    );

    int deleteByCommentNumber(int commentNumber);

    Page<TrailReview> findAllByTrailRouteId(String trailRouteId,Pageable pageable);
}
