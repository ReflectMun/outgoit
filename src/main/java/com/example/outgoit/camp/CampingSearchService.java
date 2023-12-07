package com.example.outgoit.camp;

import com.fasterxml.jackson.databind.ObjectMapper;
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

//        uriComponents.toUriString();
        ObjectMapper mapper = new ObjectMapper();
        try {
            URL url = new URL(uriComponents.toUriString());
            ApiResponse res = mapper.readValue(url, ApiResponse.class);
            ArrayList<CampingAreaInfoDTO> list =
                    new ArrayList<>(Arrays.asList(res.getResponse().getBody().getItems().getItem()));
            System.out.println(list.get(0).getMapY() + ", " + list.get(0).getMapX());
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("캠핑장 검색 에러");
            return null;
        }
    }
}
