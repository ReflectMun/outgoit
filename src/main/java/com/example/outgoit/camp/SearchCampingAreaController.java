package com.example.outgoit.camp;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/camping")
public class SearchCampingAreaController {
    @GetMapping("/search")
    public CampingAreaInfoDTO getChampingAreaInfo(){
        return new CampingAreaInfoDTO();
    }
}
