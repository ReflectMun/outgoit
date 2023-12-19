package com.example.outgoit.trail;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/trail")
public class TrailRoutePageController {
    @GetMapping
    public String getTrailRoutePage(){
        return "jiho/trail";
    }
    @GetMapping("/draft1")
    public String sendDraft1(){
        return "kmh/hiking2";
    }
}
