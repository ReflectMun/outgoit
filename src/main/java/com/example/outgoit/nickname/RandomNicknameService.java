package com.example.outgoit.nickname;


import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.File;

public class RandomNicknameService {
    public static void main(String[] args) {
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            String filePath = "src/main/resources/static/rh/js/nickname.json";
            RandomNicknameDTO nickname = objectMapper.readValue(new File(filePath), RandomNicknameDTO.class);
            System.out.println(nickname.getDeterminers());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
