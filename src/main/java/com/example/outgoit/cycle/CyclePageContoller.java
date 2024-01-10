package com.example.outgoit.cycle;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@Controller
@RequestMapping("/cycle")
public class CyclePageContoller {
    CycleRouteSearchService cycleRouteSearchService;

    public CyclePageContoller(CycleRouteSearchService cycleRouteSearchService){
        this.cycleRouteSearchService = cycleRouteSearchService;
    }

//    기능 구현을 위해 테스트용
//    @GetMapping
//    public String sendCyclePage(Model model){
//        return "ms/cycle_test";
//    }
//    @GetMapping("/riding")
//    public String sendRidingPage(Model model){
//        return "jsp/riding/ridingMain";
//    }
//
//    @GetMapping("/pdf")
//    public String pdfTest(Model model) throws IOException {
//
//        return "ms/pdf_test";
//    }

}
