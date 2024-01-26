package com.example.outgoit.nickname;


import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/nickname")
@RequiredArgsConstructor
public class RandomNicknameController {
    private final RandomNicknameService randomNicknameService;

    @GetMapping("/show")
    public String randomNickname(){
        String nickname = randomNicknameService.getRandomNickname();
        return nickname;
    }



}
