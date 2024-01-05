package com.example.outgoit.nickname;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/nickname")
public class RandomNicknameController {
    private final RandomNicknameService randomNicknameService;

    public RandomNicknameController(RandomNicknameService randomNicknameService){
        this.randomNicknameService = randomNicknameService;
    }

    @GetMapping("/show")
    public String randomNickname(){
        String nickname = randomNicknameService.getRandomNickname();
        return nickname;
    }



}
