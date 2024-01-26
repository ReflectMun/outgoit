package com.example.outgoit;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class IndexPageController {
    @GetMapping
    public String redirectToIndexPage(){
        return "redirect:/index";
    }

    @GetMapping("/index")
    public String sendIndexPage() {
        return "jsp/etc/index";
    }

    @GetMapping("/design")
    public String sendDesignPage() {
        return "jsp/etc/design";
    }

    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    public static class WeatherData{
        private String area;
        private String weatherIcon;
        private String temperature;
    }
}

