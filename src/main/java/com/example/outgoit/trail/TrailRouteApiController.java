package com.example.outgoit.trail;

import com.example.outgoit.trail.dto.FeatureData;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
@RequestMapping("/api/trail")
public class TrailRouteApiController {
    private final TrailRouteService trailRouteService;

    public TrailRouteApiController(TrailRouteService trailRouteService){
        this.trailRouteService = trailRouteService;
    }

    @GetMapping("/search")
    public ArrayList<FeatureData> searchTrailRoute(Double lati, Double lngi){
        try {
            return this.trailRouteService.getTrailRouteList(lngi, lati);
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
