package com.example.outgoit.review;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.time.ZoneId;

@Entity(name = "camping_review")
@Getter
@Setter
@NoArgsConstructor
public class CampingReviewDTO { // 이 DTO는 캠핑장 리뷰에 관한 데이터를 담을 DTO임
    @Column(name = "comment_number", nullable = false, unique = true)
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Long commentNumber; // 리뷰 고유번호

    @Column(nullable = false)
    private String nickname; // 작성자 닉네임

    @Column(nullable = false)
    private String password; // 작성 시 입력한 비밀번호

    @Column(name = "review_content", nullable = false)
    private String reviewContent; // 리뷰 내용

    @Column(nullable = false)
    private Integer rating; // 평점(별점)

    @Column(name = "commented_date", nullable = false)
    private LocalDate commentedDate; // 리뷰를 작성한 날짜

    @PrePersist
    public void prePersist(){
        this.commentedDate = LocalDate.now(ZoneId.of("Asia/Seoul"));
    }

    public CampingReviewDTO(
            String nickname,
            String password,
            String reviewContent,
            Integer rating
    ){
        this.nickname = nickname;
        this.password = password;
        this.reviewContent = reviewContent;
        this.rating = rating;
    }
}
