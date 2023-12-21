package com.example.outgoit.cycle;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class CycleRouteInfoDTO {

    private String region; // 지역이름 ex) 서울
    private Integer no; // 자전거길 고유 번호 ex) 1, 2,3...
    private String name; // 자전거길 이름 ex) 서울숲 자전거길
    private ArrayList<Coordinate> path; // 좌표정보 담을 곳
}
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
class Coordinate {
    private Double lngi;
    private Double lati;
}