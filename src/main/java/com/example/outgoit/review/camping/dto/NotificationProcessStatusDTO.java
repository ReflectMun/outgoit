package com.example.outgoit.review.camping.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class NotificationProcessStatusDTO {
    private int statusCode;
    private String errorMessage;

    public NotificationProcessStatusDTO(int statusCode) {
        this.statusCode = statusCode;
    }
}
