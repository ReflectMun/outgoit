package com.example.outgoit.review.camping.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class CampingReviewSubmitBodyDTO {
    private String author;
    private String password;
    private String content;
//    private Integer rating;
    private Integer campingAreaId;
}
