package com.example.outgoit.trail;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
@RequestMapping("/api/trail")
public class TrailRouteApiController {
    private final TrailRouteService trailRouteService;

    public TrailRouteApiController(){
        this.trailRouteService = new TrailRouteService();
    }

    @GetMapping("/search")
    public ArrayList<FeatureData> searchTrailRoute(){
        try {
            return this.trailRouteService.getTrailRouteList(128.46532747829454, 38.11910443438176);
        }
        catch (NoSearchResultException e){
            ArrayList<FeatureData> error = new ArrayList<>();
            FeatureData errorObj = new FeatureData();
            errorObj.setErrorMessage("검색결과가 존재하지 않습니다");
            error.add(errorObj);
            return error;
        }
        catch (Exception e) {
            e.printStackTrace();
            ArrayList<FeatureData> error = new ArrayList<>();
            FeatureData errorObj = new FeatureData();
            errorObj.setErrorMessage("검색도중 오류가 발생했습니다");
            error.add(errorObj);
            return error;
        }
    }
}
