package com.example.outgoit.review.trail;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TrailReviewRepositoryInterface extends JpaRepository<TrailReview, Long> {
    @Query("select AVG(rating) from trail_review where trailRouteId = :trailRouteId AND isDeleted = false")
    List<Object> findAvgRatingByTrailRouteId(@Param("trailRouteId") String trailRouteId);

    Page<TrailReview> findAllByTrailRouteIdAndIsDeletedFalse(String trailRouteId, Pageable pageable);

    List<TrailReview> findByCommentNumberAndIsDeletedFalse(Long commentNumber);

    @Modifying
    @Query("update trail_review set content = :content, rating = :rating where commentNumber = :commentNumber AND isDeleted = false")
    int updateContentByCommentNumber(
            @Param("content") String content,
            @Param("commentNumber") Long commentNumber,
            @Param("rating") Integer rating

    );


    @Modifying
    @Query("UPDATE trail_review SET isDeleted = true WHERE commentNumber = :commentNumber AND isDeleted = false")
    int deleteByCommentNumber(
            @Param("commentNumber") Long commentNumber
    );

}


