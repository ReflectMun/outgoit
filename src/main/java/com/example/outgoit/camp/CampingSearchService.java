package com.example.outgoit.camp;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.exc.InvalidFormatException;
import org.springframework.stereotype.Service;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;

@Service
public class CampingSearchService {
    //    고캠핑  API 주소 => "https://apis.data.go.kr/B551011/GoCamping/searchList"
    private final String key = "s7uOVVVt02w8vbG4QdP35gAmWK%2F9GkwQ0GIX7lLHcQ6wXeuPyOF1LJia95iYlnTpaA2IJk6uYQekBwKXpqDspw%3D%3D";

    // 캠핑장에 대한 기본 정보를 담는 일
    public ArrayList<CampingAreaInfoDTO> GetSearchedCampingAreaList(String campName) {
        ArrayList<CampingAreaInfoDTO> result = null;
        try {
            UriComponents uriComponents = UriComponentsBuilder.newInstance()
                .scheme("https")
                .host("apis.data.go.kr")
                .path("/B551011/GoCamping/searchList")
                .queryParam("MobileOS", "etc")
                .queryParam("MobileApp", "outgoit")
                .queryParam("_type", "json")
                .queryParam("serviceKey", key)
                .queryParam("keyword", URLEncoder.encode(campName))
                .build(true);

            ObjectMapper mapper = new ObjectMapper();
            URL url = new URL(uriComponents.toUriString());
            ApiResponse res = mapper.readValue(url, ApiResponse.class);
            result = new ArrayList<>(Arrays.asList(res.getResponse().getBody().getItems().getItem()));

            System.out.printf("%s 키워드로 총 %d개의 캠핑장이 검색됨\n", campName, result.size());
        } catch (InvalidFormatException e) {
            System.out.println("캠핑장 검색결과가 없습니다");

            result = new ArrayList();
            result.add(new CampingAreaInfoDTO("캠핑장 검색결과가 없습니다"));
        } catch (Exception e){
            System.out.println("에러 발생");
            e.printStackTrace();

            result = new ArrayList();
            result.add(new CampingAreaInfoDTO("원인을 알 수 없는 오류가 발생했습니다"));
        }

        return result;
    }

    // 불러온 캠핑장에 대한 이미지를 담는 일
    public ArrayList<CampingAreaInfoDTO> GetImgSearchedCampingAreaList(Integer contentId) {
        ArrayList<CampingAreaInfoDTO> result = null;
        try {
            UriComponents uriComponents = UriComponentsBuilder.newInstance()
                    .scheme("https")
                    .host("apis.data.go.kr")
                    .path("/B551011/GoCamping/imageList")
                    .queryParam("MobileOS", "etc")
                    .queryParam("MobileApp", "outgoit")
                    .queryParam("_type", "json")
                    .queryParam("serviceKey", key)
                    .queryParam("contentId", contentId)
                    .build(true);

            ObjectMapper mapper = new ObjectMapper();
            URL url = new URL(uriComponents.toUriString());
            ApiResponse res = mapper.readValue(url, ApiResponse.class);
            result = new ArrayList<>(Arrays.asList(res.getResponse().getBody().getItems().getItem()));

            System.out.printf("콘텐트 아이디 %s 에 대한 총 %d개의 캠핑장의 이미지 검색됨\n", contentId, result.size());
        } catch (InvalidFormatException e) {
            System.out.println("캠핑장 이미지 검색결과가 없습니다");

            result = new ArrayList();
            result.add(new CampingAreaInfoDTO("캠핑장 이미지 검색결과가 없습니다"));
        } catch (Exception e){
            System.out.println("에러 발생");
            e.printStackTrace();

            result = new ArrayList();
            result.add(new CampingAreaInfoDTO("원인을 알 수 없는 오류가 발생했습니다"));
        }

        return result;
    }
}
