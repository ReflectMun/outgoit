package com.example.outgoit.camp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@JsonIgnoreProperties(ignoreUnknown = true)
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class CampingAreaInfoDTO {
    private String contentId; // 캠핑장 식별 일련번호. 캠핑장 이미지 불러오는데 필요함
    private String facltNm; // 야영장명
    private String lineIntro; // 한줄소개
    private String gnrlSiteCo; // 일반 야영장 개수
    private String autoStieCo; // 자동차 야영장 개수
    private String resveUrl, resveCl; // 예약관련 무언가들 나중에 필요할 수도
    private String firstImageUrl; // 썸네일
    private String animalCmgCl; // 애완동물 출입가능 여부 ex) 불가능
    private String eqpmnLendCl; // 캠핑장비 대여가능 여부
    private String operPdCl; // 운영기간 ex) 봄,여름,가을,겨울
    private String operDecl; // 운영일 ex) 평일+주말
    private String trlerAcmpnyAt; // 개인 트레일러 동반 여부 ex) Y, N
    private String caravAcmpnyAt; // 개인 카라반 동반 여부 ex) Y, N
    private String toiletCo; // 화장실 개수 ex) 4
    private String induty; // 업종 ex) 자동차야영장
    private String posblFcltyCl; // 주변이용가능시설 ex) 산책로,낚시,어린이놀이시설
    private String manageSttus; // 운영상태, 관리상태 ex) 운영
    private String hvofBgnde; // 휴장기간 시작일 ex)
    private String hvofEnddle; // 휴장기간 종료일 ex)
    private String addr1, addr2;
    private String zipcode; // 우편번호
    private String mapX, mapY; // 위도 경도
    private String tel; // 전화번호
    private String swrmCo; // 샤워실 개수
    private String brazierCl; // 화로대 개별 지참 여부 ex) 개별
    private String sbrsEtc; // 부대시설 ex) 전기,온수,물놀이장,놀이터,운동시설
    private String siteBottomCl1; // 잔디바닥 자리 수
    private String siteBottomCl2; // 파쇄석바닥 자리 수
    private String siteBottomCl3; // 테크바닥(나무마루) 자리 수
    private String siteBottomCl4; // 자갈바닥 자리 수
    private String siteBottomCl5; // 맨흙바닥 자리 수

    private String errorMessage; // 에러 발생시 메시지

    public CampingAreaInfoDTO(String  errorMessage){
        this.errorMessage = errorMessage;
    }
}

@JsonIgnoreProperties(ignoreUnknown = true)
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
class ApiResponse {
    private ResponseData response;
}

@JsonIgnoreProperties(ignoreUnknown = true)
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
class ResponseData {
    private BodyData body;
}

@JsonIgnoreProperties(ignoreUnknown = true)
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
class BodyData {
    private ItemsData items;
}

@JsonIgnoreProperties(ignoreUnknown = true)
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
class ItemsData {
    private CampingAreaInfoDTO[] item;
}