package com.example.outgoit.cycle;

import com.example.outgoit.camp.CampingSearchService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/cycle")
public class CycleRouteApiController {
    private final CycleRouteSearchService cycleRouteSearchService;

    public CycleRouteApiController(CycleRouteSearchService cycleRouteSearchService){
        this.cycleRouteSearchService = cycleRouteSearchService;
    }

    @GetMapping("/search/{fileNo}")
    public CycleRouteInfoDTO getCycleRouteInfo(@PathVariable Integer fileNo){
        System.out.printf("검색한 파일 번호 %d번\n", fileNo);
        return cycleRouteSearchService.getSearchCycleRouteInfo(fileNo);
    }
}
