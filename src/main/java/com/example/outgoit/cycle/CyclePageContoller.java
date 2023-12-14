package com.example.outgoit.cycle;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/cycle")
public class CyclePageContoller {
    @GetMapping
    public String sendCyclePage(Model model){
        model.addAttribute("name", "jiho");
        return "jh/camp";
    }
}
