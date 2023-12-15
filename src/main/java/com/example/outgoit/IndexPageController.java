package com.example.outgoit;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexPageController {
    @GetMapping("/")
    public String sendIndexPage(){
        return "kmh/camping";
    }
}
