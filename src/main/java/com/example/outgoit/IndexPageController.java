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
<<<<<<< HEAD

    @GetMapping("/camping")
    public String sendCampingPage(Model model){
        model.addAttribute("campingContentPage", "Camping_About.jsp");
        return "jsp/camp/container";
    }

    @GetMapping("/hiking")
    public String sendHikingMainPage() {
        return "kmh/hiking";
    }

    @GetMapping("/riding")
    public String sendRidingMainPage() {
        return "kmh/riding";
    }
=======
    @GetMapping("/camping")
    public String sendCampingPage(Model model){
        model.addAttribute("campingContentPage", "Camping_About.jsp");
        return "hj/camp/container";
    }

>>>>>>> 74081d467bd8c943873d986cca4c846a3296344b
}

