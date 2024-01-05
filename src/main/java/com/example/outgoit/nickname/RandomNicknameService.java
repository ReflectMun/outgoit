package com.example.outgoit.nickname;


import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.File;
import java.nio.charset.Charset;
import java.util.ArrayList;

public class RandomNicknameService {
    public static void main(String[] args) {
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            String filePath = "src/main/resources/static/rh/js/nickname.json";
            RandomNicknameDTO nickname = objectMapper.readValue(new File(filePath), RandomNicknameDTO.class);
            System.out.println(nickname.getDeterminers());
            System.out.println(nickname.getAnimals());

            ArrayList<String> determinersList = determinersList.get()


        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
