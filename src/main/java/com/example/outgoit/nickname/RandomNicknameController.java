package com.example.outgoit.nickname;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/nickname")
public class RandomNicknameController {
    RandomNicknameService randomNicknameService;
}
