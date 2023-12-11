package com.example.outgoit.trail;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TrailRouteDTO {
    @JsonProperty("0")
    private Double lngi; // 경도(x)
    @JsonProperty("1")
    private Double lati; // 위도(y)
}

@JsonIgnoreProperties(ignoreUnknown = true)
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
class PropertiesData{
    private int sec_len; // 등산로의 총 거리 단위(m)
    private int up_min; // 상행시간(산 올라가는데 걸리는 시간) 단위(분)
    private String cat_nam; // 등산로 난이도 ex) 상, 중, 하
    private String mntn_nm; // 등산로 이름 ex) 설악산 대청봉
}

@JsonIgnoreProperties(ignoreUnknown = true)
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
class GeometryData{
    private List<List<List<Double>>> coordinates;
}

@JsonIgnoreProperties(ignoreUnknown = true)
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
class TrailRouteApiResponse{
    private ResponseBody response;
}

@JsonIgnoreProperties(ignoreUnknown = true)
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
class ResponseBody{
    private String status;
    private ResultData result;
}

@JsonIgnoreProperties(ignoreUnknown = true)
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
class ResultData{
    private FeatureCollection featureCollection;
}

@JsonIgnoreProperties(ignoreUnknown = true)
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
class FeatureCollection{
    private ArrayList<FeatureData> features;
}

@JsonIgnoreProperties(ignoreUnknown = true)
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
class FeatureData{
    private GeometryData geometry;
    private PropertiesData properties;

    private String errorMessage;
}