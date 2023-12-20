package com.example.outgoit.trail;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
@RequestMapping("/api/trail2")
public class TrailRouteApiController2 {
    private final TrailRouteService2 trailRouteService2;

    public TrailRouteApiController2(TrailRouteService2 trailRouteService2){
        this.trailRouteService2 = trailRouteService2;
    }

    @GetMapping("/search/{trailName}")
    public ArrayList<FeatureData2> getTrailRouteInfo(@PathVariable String trailName){
        System.out.printf("검색 키워드: %s\n", trailName);
        return trailRouteService2.GetSearchedTrailRouteList(trailName);
    }
}
