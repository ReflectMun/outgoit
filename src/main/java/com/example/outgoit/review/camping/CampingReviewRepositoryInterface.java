package com.example.outgoit.review.camping;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CampingReviewRepositoryInterface extends JpaRepository<CampingReview, Long> {
    // SELECT AVG(Rating) FROM (Table) WHERE Camping_Area_Id := camping_area_id AND is_deleted = false
    // 특정 캠핑장의 평균평점을 불러오는 쿼리문
    @Query("SELECT AVG(rating) FROM camping_review WHERE campingAreaId = :campingAreaId AND isDeleted = false")
    List<Object> findAvgRatingByCampingAreaIdAndIsDeletedFalse(@Param("campingAreaId") int campingAreaId);

    // SELECT * FROM (Table) WHERE Camping_Area_Id := camping_area_id AND is_deleted = false
    // 해당 캠핑장의 리뷰를 모두 불러오는 쿼리문
    Page<CampingReview> findByCampingAreaIdAndIsDeletedFalse(int campingAreaId, Pageable pageable);

    // SELECT * FROM (Table) WHERE Comment_Number := comment_number
    // 수정 및 삭제를 위한 특정 리뷰 하나만을 불러오기 위한 쿼리문
    List<CampingReview> findByCommentNumberAndIsDeletedFalse(Long commentNumber);

    // UPDATE (Table) SET Content := content WHERE Comment_Number := comment_number
    // 특정 리뷰 내용을 수정하는 쿼리문
    @Modifying
    @Query("UPDATE camping_review SET content = :content, rating = :rating WHERE commentNumber = :commentNumber AND isDeleted = false")
    int updateContentByCommentNumber(
            @Param("content") String content,
            @Param("commentNumber") Long commentNumber,
            @Param("rating") Long rating
    );

    // DELETE FROM (Table) WHERE Comment_Number := comment_number
    // 특정 리뷰를 삭제하는 쿼리문
    @Modifying
    @Query("UPDATE camping_review SET isDeleted = true WHERE commentNumber = :commentNumber AND isDeleted = false")
    int deleteByCommentNumber(
            @Param("commentNumber") Long commentNumber
    );
}

