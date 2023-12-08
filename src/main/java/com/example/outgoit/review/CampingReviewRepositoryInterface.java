package com.example.outgoit.review;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CampingReviewRepositoryInterface extends JpaRepository<CampingReview, Long> {
    // SELECT AVG(Rating) FROM (Table) WHERE Camping_Area_Id := camping_area_id
    @Query("SELECT AVG(rating) FROM camping_review WHERE campingAreaId = :campingAreaId")
    List<Object> findAvgRatingByCampingAreaId(@Param("campingAreaId") int campingAreaId);

    // SELECT * FROM (Table) WHERE Camping_Area_Id := camping_area_id
    List<CampingReview> findByCampingAreaId(int campingAreaId);

    // SELECT * FROM (Table) WHERE Comment_Number := comment_number
    List<CampingReview> findByCommentNumber(int commentNumber);

    @Modifying
    @Query("UPDATE camping_review SET content = :content WHERE commentNumber = :commentNumber")
    // UPDATE (Table) SET Content := content WHERE Comment_Number := comment_number
    int updateContentByCommentNumber(
            @Param("content") String Content,
            @Param("commentNumber") int commentNumber
    );

    // DELETE FROM (Table) WHERE Comment_Number := comment_number
    int deleteByCommentNumber(int commentNumber);
}
