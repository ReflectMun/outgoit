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

    @GetMapping("/About")
    public String aboutPage(Model model){
       //return "RH/jsp/Camping/Camping_About";
         return "RH/jsp/Hiking/Hiking_About";
        //return "RH/jsp/Riding/Riding_About";

    }
    @GetMapping("/Safety")
    public String safetyPage(Model model){
      //  return "RH/jsp/Camping/Camping_Safety";
      // return "RH/jsp/Hiking/Hiking_Safety";
       return "RH/jsp/Riding/Riding_Safety";
    }
    @GetMapping("/Beginner")
    public String beginnerPage(Model model){
       // return "RH/jsp/Camping/Camping_Beginner";
       //  return "RH/jsp/Hiking/Hiking_Beginner";
        return "RH/jsp/Riding/Riding_Beginner";



    }


}
