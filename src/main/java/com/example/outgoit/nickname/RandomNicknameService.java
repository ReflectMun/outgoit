package com.example.outgoit.nickname;


import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.Reader;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Random;

@Service
public class RandomNicknameService {
    public String getRandomNickname() {
        String randomNickname = null;
        try {
            String filePath = "src/main/resources/static/rh/js/nickname.json";
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode rootNode = objectMapper.readTree(new File(filePath));
            JsonNode determiners = rootNode.get("determiners");
            JsonNode animals = rootNode.get("animals");

            String randomDeterminers = getRandomValue(determiners);
            String randomAnimal = getRandomValue(animals);
            String randomNum = String.format("%04d", getRandomNum());

            randomNickname = randomDeterminers + " " + randomAnimal + " " + randomNum;
            System.out.println(randomNickname);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return randomNickname;
    }

    private static String getRandomValue(JsonNode node) {
        int randomIndex = new Random().nextInt(node.size());
        return node.get(randomIndex).asText();
    }

    private static int getRandomNum() {
        Random randomNo = new Random();
        return randomNo.nextInt(10000) + 1;
    }
}
