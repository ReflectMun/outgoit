package com.example.outgoit;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/outgoit")
public class MenuPageController {

//    캠핑
    @GetMapping("/camping/history")
    public String sendCampingHistory(Model model){
        model.addAttribute("campingContentPage", "Camping_About.jsp");
        return "jsp/camp/container";
    }

    @GetMapping("/camping/safety")
    public String sendCampingSafety(Model model){
        model.addAttribute("campingContentPage", "Camping_Safety.jsp");
        return "jsp/camp/container";
    }

    @GetMapping("/camping/beginner")
    public String sendCampingBeginner(Model model){
        model.addAttribute("campingContentPage", "Camping_Beginner.jsp");
        return "jsp/camp/container";
    }


//    하이킹
    @GetMapping("/hiking/history")
    public String sendHikingHistory(Model model){
        model.addAttribute("campingContentPage", "Hiking_About.jsp");
        return "jsp/hiking/container";
    }

    @GetMapping("/hiking/safety")
    public String sendHikingSafety(Model model){
        model.addAttribute("campingContentPage", "Hiking_Safety.jsp");
        return "jsp/hiking/container";
    }

    @GetMapping("/hiking/beginner")
    public String sendHikingBeginner(Model model){
        model.addAttribute("campingContentPage", "Hiking_Beginner.jsp");
        return "jsp/hiking/container";
    }

// 라이딩
    @GetMapping("/riding/history")
    public String sendRidingHistory(Model model){
        model.addAttribute("campingContentPage", "Riding_About.jsp");
        return "jsp/riding/container";
    }

    @GetMapping("/riding/safety")
    public String sendRidingSafety(Model model){
        model.addAttribute("campingContentPage", "Riding_Safety.jsp");
        return "jsp/riding/container";
    }

    @GetMapping("/riding/beginner")
    public String sendRidingBeginner(Model model){
        model.addAttribute("campingContentPage", "Riding_Beginner.jsp");
        return "jsp/riding/container";
    }


}
