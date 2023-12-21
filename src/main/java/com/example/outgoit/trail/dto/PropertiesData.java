package com.example.outgoit.trail.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@JsonIgnoreProperties(ignoreUnknown = true)
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class PropertiesData{
    private int sec_len; // 등산로의 총 거리 단위(m)
    private int up_min; // 상행시간(산 올라가는데 걸리는 시간) 단위(분)
    private String cat_nam; // 등산로 난이도 ex) 상, 중, 하
    private String mntn_nm; // 등산로 이름 ex) 설악산 대청봉
}