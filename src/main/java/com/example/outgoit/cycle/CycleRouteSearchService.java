package com.example.outgoit.cycle;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

@Service
public class CycleRouteSearchService {
    public CycleRouteInfoDTO getSearchCycleRouteInfo(Integer fileNo){
        Scanner scanner = null;
        CycleRouteInfoDTO dto = null;
        try {
            File file = new File("src/main/resources/static/cycle_paths/"+ fileNo + ".json");
            scanner = new Scanner(file);
            StringBuilder stringBuilder = new StringBuilder();
            while (scanner.hasNextLine()){
                stringBuilder.append(scanner.nextLine());
            }
            String json = stringBuilder.toString();
            ObjectMapper mapper = new ObjectMapper();
            dto = mapper.readValue(json, CycleRouteInfoDTO.class);
            System.out.println("JSON 데이터 검색 성공");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("자전거길 파일 검색 오류");
        } finally {
            if(scanner != null)
                scanner.close();
        }
        return dto;
    }
}
