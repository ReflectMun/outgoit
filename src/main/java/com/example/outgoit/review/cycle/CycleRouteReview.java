package com.example.outgoit.review.cycle;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.ZoneId;

@Entity(name = "cycle_route_review")
@Getter
@NoArgsConstructor
public class CycleRouteReview { // 이 DTO는 캠핑장 리뷰에 관한 데이터를 담을 DTO임
    @Column(name = "comment_number", nullable = false, unique = true)
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long commentNumber; // 리뷰 고유번호

    @Column(nullable = false)
    private String author; // 작성자 닉네임

    @Column(nullable = false)
    private String password; // 작성 시 입력한 비밀번호

    @Column(nullable = false)
    private String content; // 리뷰 내용

    @Column(nullable = false)
    private Integer rating; // 평점(별점)

    @Column(name = "cycle_route_id", nullable = false)
    private Integer cycleRouteId;

    @Column(name = "commented_date", nullable = false)
    private LocalDate commentedDate; // 리뷰를 작성한 날짜

    @PrePersist
    public void prePersist(){
        this.commentedDate = LocalDate.now(ZoneId.of("Asia/Seoul"));
    }

    public CycleRouteReview(
            String author,
            String password,
            String content,
            int rating,
            int cycleRouteId
    ){
        this.author = author;
        this.password = password;
        this.content = content;
        this.rating = rating;
        this.cycleRouteId = cycleRouteId;
    }
}
