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

    public ArrayList<CampingAreaInfoDTO> GetSearchedCampingAreaList(String campName) {

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
            ArrayList<CampingAreaInfoDTO> list =
                    new ArrayList<>(Arrays.asList(res.getResponse().getBody().getItems().getItem()));

            System.out.printf("%s 키워드로 총 %d개의 캠핑장이 검색됨\n", campName, list.size());

            return list;
        } catch (InvalidFormatException e) {
            System.out.println("캠핑장 검색결과가 없습니다");

            ArrayList<CampingAreaInfoDTO> error = new ArrayList();
            error.add(new CampingAreaInfoDTO("캠핑장 검색결과가 없습니다"));

            return error;
        } catch (Exception e){
            System.out.println("에러 발생");
            e.printStackTrace();

            ArrayList<CampingAreaInfoDTO> error = new ArrayList();
            error.add(new CampingAreaInfoDTO("원인을 알 수 없는 오류가 발생했습니다"));

            return error;
        }
    }
}
