package com.example.outgoit.review.camping.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class CampingReviewModifyingDTO {
    private Long commentNumber;
    private String password;
    private String content;
}
