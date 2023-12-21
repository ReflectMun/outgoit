package com.example.outgoit.trail;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@JsonIgnoreProperties(ignoreUnknown = true)
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class FeatureData {
    private GeometryData geometry;
    private PropertiesData properties;
    private String id; // 이거 테스트 해봐야됨 등산로 ID (아직 안해봄)
    private String errorMessage;
}
