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
    private String id;
    private String errorMessage;
}
