package com.example.outgoit.camp;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/camping")
public class CampingAreaSearchApiController {
    private final CampingSearchService campingSearchService;

    @GetMapping("/search/{campName}")
    public List<CampingAreaInfoDTO> getCampingAreaInfo(@PathVariable String campName){
        System.out.printf("검색 키워드: %s\n", campName);
        return campingSearchService.GetSearchedCampingAreaList(campName);
    }

    @GetMapping("/imgSearch/{contentId}")
    public List<CampingAreaInfoDTO> getCampingAreaImgUrl(@PathVariable Integer contentId){
        System.out.printf("캠핑장 콘텐츠 ID: %d\n ", contentId);
        return campingSearchService.GetImgSearchedCampingAreaList(contentId);
    }

}
