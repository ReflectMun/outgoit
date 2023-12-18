package com.example.outgoit.trail;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;

@Service
public class TrailRouteService {
    private final String key = "F9C68EFA-3050-383C-8CC5-191419985184";
    private final String serviceUrl = "www.outgoit.kro.kr";
    private final String crs = "EPSG:4326";
    private final String format = "json";

    private final double lngiPerKm = 0.0113;
    private final double latiPerKm = 0.0091;
    private final int sqr_km = 5;

    public ArrayList<FeatureData> getTrailRouteList(double lngi, double lati) throws Exception {
        double lngiA = lngi - (sqr_km * lngiPerKm);
        double latiA = lati - (sqr_km * latiPerKm);

        double lngiB = lngi + (sqr_km * lngiPerKm);
        double latiB = lati + (sqr_km * latiPerKm);

        String coordinateBox = String.format(
                "BOX(%f,%f,%f,%f)",
                lngiA,
                latiA,
                lngiB,
                latiB
        );

        UriComponents uri = UriComponentsBuilder.newInstance()
                .scheme("https")
                .host("api.vworld.kr")
                .path("/req/data")
                .queryParam("format", format)
                .queryParam("errorFormat", format)
                .queryParam("request", "GetFeature")
                .queryParam("data", "LT_L_FRSTCLIMB")
                .queryParam("geomFilter", URLEncoder.encode(coordinateBox))
                .queryParam("size", "300")
                .queryParam("domain", serviceUrl)
                .queryParam("crs", crs)
                .queryParam("key", key)
                .build(true);

        ObjectMapper mapper = new ObjectMapper();
        URL url = new URL(uri.toUriString());
        TrailRouteApiResponse res = mapper.readValue(url, TrailRouteApiResponse.class);
      //  System.out.printf(res.toString());
        if(res.getResponse().getStatus().equals("OK") == false)
            throw new NoSearchResultException();

        ArrayList<FeatureData> list =
                res.getResponse().getResult().getFeatureCollection().getFeatures();

        System.out.printf("총 %d개의 등산로 정보 검색결과가 반환됨\n", list.size());
        return list;
    }
}

class NoSearchResultException extends Exception{}