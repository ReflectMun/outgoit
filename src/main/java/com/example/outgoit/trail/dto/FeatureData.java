package com.example.outgoit.trail.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;

@JsonIgnoreProperties(ignoreUnknown = true)
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class FeatureData{
    private GeometryData geometry;
    private PropertiesData properties;
    private String id; // 이거 테스트 해봐야됨 등산로 ID (아직 안해봄)
    private String errorMessage;
}
