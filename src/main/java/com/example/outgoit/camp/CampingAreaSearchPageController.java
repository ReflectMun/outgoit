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






}
