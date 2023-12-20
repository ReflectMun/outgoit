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
public class TrailRouteDTO2 {

    private Double lngi; // 경도(x)

    private Double lati; // 위도(y)
}

@JsonIgnoreProperties(ignoreUnknown = true)
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
class PropertiesData2{
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
class GeometryData2{
    private List<List<List<Double>>> coordinates2;
}

@JsonIgnoreProperties(ignoreUnknown = true)
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
class TrailRouteApiResponse2{
    private ResponseBody2 response2;
}

@JsonIgnoreProperties(ignoreUnknown = true)
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
class ResponseBody2{
    private ResultData2 result2;
}

@JsonIgnoreProperties(ignoreUnknown = true)
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
class ResultData2{
    private FeatureCollection2 featureCollection2;
}

@JsonIgnoreProperties(ignoreUnknown = true)
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
class FeatureCollection2{
    private ArrayList<FeatureData2> features2;
}

@JsonIgnoreProperties(ignoreUnknown = true)
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
class FeatureData2{
    private GeometryData2 geometry2;
    private PropertiesData2 properties2;
    private String id; // 이거 테스트 해봐야됨 등산로 ID (아직 안해봄)
//    private String errorMessage;
//    private int sec_len; // 등산로의 총 거리 단위(m)
//    private int up_min; // 상행시간(산 올라가는데 걸리는 시간) 단위(분)
//    private String cat_nam; // 등산로 난이도 ex) 상, 중, 하
//    private String mntn_nm; // 등산로 이름 ex) 설악산 대청봉
}