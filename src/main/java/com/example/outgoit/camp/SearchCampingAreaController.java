package com.example.outgoit.camp;

import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/camping")
public class SearchCampingAreaController {
    private final CampingSearchService campingSearchService;

    SearchCampingAreaController(CampingSearchService campingSearchService){
        this.campingSearchService = campingSearchService;
    }
    @GetMapping("/search/{campName}")
    public List<CampingAreaInfoDTO> getChampingAreaInfo(@PathVariable String campName){
        return campingSearchService.GetSearchedCampingAreaList(campName);
    }
}
