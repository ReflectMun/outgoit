package com.example.outgoit.camp;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/camping")
public class CampingAreaSearchPageController {
    @GetMapping("/camp")
    public String sendCampingSearchingPage(Model model){
        model.addAttribute("msg", "camping");
        return "jh/camp";
    }

    @GetMapping("/index")
    public String indexPage(Model model) {
        return "kmh/index";
    }

    @GetMapping("/camping")
    public String campingPage(Model model) {
        return "kmh/camping";
    }

}
