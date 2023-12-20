package com.example.outgoit.trail;
import java.net.URLEncoder;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URL;

import java.util.ArrayList;
import java.util.Arrays;

@Service
public class TrailRouteService2 {
    private static final String key = "F9C68EFA-3050-383C-8CC5-191419985184";
    private final String serviceUrl = "www.outgoit.kro.kr";
    private final String crs = "EPSG:4326";
    private final String format = "json";

    public ArrayList<FeatureData2> GetSearchedTrailRouteList(String trailName) {
        ArrayList<FeatureData2> result = null;
        try {


            UriComponents uri = UriComponentsBuilder.newInstance()
                    .scheme("https")
                    .host("api.vworld.kr")
                    .path("/req/data")
                    .queryParam("format", format)
                    .queryParam("errorFormat", format)
                    .queryParam("request", "GetFeature")
                    .queryParam("data", "LT_L_FRSTCLIMB")
                    .queryParam("geomFilter", URLEncoder.encode(trailName))
                    .queryParam("size", "300")
                    .queryParam("domain", serviceUrl)
                    .queryParam("crs", crs)
                    .queryParam("key", key)
                    .build(true);

            ObjectMapper mapper = new ObjectMapper();
            URL url = new URL(uri.toUriString());
            TrailRouteApiResponse2 res = mapper.readValue(url, TrailRouteApiResponse2.class);
//            ApiResponse2 res = mapper.readValue(url, ApiResponse2.class);
//            result = new ArrayList<>(Arrays.asList(res.getResponse2().getBody2().getItems2().getItem2()));
            ArrayList<FeatureData2> list =
                    res.getResponse2().getResult2().getFeatureCollection2().getFeatures2();
            System.out.printf("%s 키워드로 총 %d개의 등산로가 검색됨\n", trailName, result.size());


        } catch (Exception e){
            System.out.println("에러 발생");
            e.printStackTrace();

            result = new ArrayList();

        }
        for (FeatureData2 s: result){
            System.out.printf(String.valueOf(s));
        }
        return result;
    }

}




