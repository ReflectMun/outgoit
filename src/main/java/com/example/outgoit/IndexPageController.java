package com.example.outgoit;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/outgoit")
public class IndexPageController {
    @GetMapping("/index")
    public String sendIndexPage() {
        return "kmh/index";
    }

    @GetMapping("/camping")
    public String sendCampingPage(Model model){
        model.addAttribute("campingContentPage", "campingMain.jsp");
        return "jsp/camp/container";
    }

    @GetMapping("/hiking")
    public String sendHikingMainPage(Model model) {
        model.addAttribute("hikingContentPage", "hikingMain.jsp");
        return "jsp/hiking/container";
    }

    @GetMapping("/riding")
    public String sendRidingMainPage(Model model) {
        model.addAttribute("ridingContentPage", "ridingMain.jsp");
        return "jsp/riding/container";
    }

    @GetMapping("/design")
    public String sendDesignPage() {
        return "jsp/etc/design";
    }

}

