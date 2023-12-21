package com.example.outgoit.trail;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;

@Controller
@RequestMapping("/trail")
public class TrailRoutePageController {
    private final TrailRouteService trailRouteService;

    public TrailRoutePageController(TrailRouteService trailRouteService){
        this.trailRouteService = trailRouteService;
    }
    @GetMapping
    public String getTrailRoutePage(){
        return "jiho/trail";
    }
    @GetMapping("/draft1")
    public String sendDraft1(){
        return "kmh/hiking";
    }


}
