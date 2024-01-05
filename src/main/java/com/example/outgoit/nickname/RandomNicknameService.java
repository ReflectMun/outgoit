package com.example.outgoit.nickname;


import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.File;
import java.io.Reader;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Random;

public class RandomNicknameService {
    public static void main(String[] args) {
//        ObjectMapper objectMapper = new ObjectMapper();
        try {
            String filePath = "src/main/resources/static/rh/js/nickname.json";
//            RandomNicknameDTO nickname = objectMapper.readValue(new File(filePath), RandomNicknameDTO.class);
//            System.out.println(nickname.getDeterminers());
//            System.out.println(nickname.getAnimals());
//            Random random = new Random();
            String nickname = new String(Files.readAllBytes(Paths.get(filePath).getFileName()))


        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
