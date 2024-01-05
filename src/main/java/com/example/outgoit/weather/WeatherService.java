package com.example.outgoit.weather;

import com.example.outgoit.weather.dto.WeatherApiResponseDTO;
import com.example.outgoit.weather.dto.api_response.ApiResponse;
import com.example.outgoit.weather.dto.api_response.Item;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Service;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URL;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;

@Service
public class WeatherService {
    private final String key = "s7uOVVVt02w8vbG4QdP35gAmWK%2F9GkwQ0GIX7lLHcQ6wXeuPyOF1LJia95iYlnTpaA2IJk6uYQekBwKXpqDspw%3D%3D";

    public HashMap<String, WeatherApiResponseDTO> getWeatherDataList(){
        HashMap<String, WeatherApiResponseDTO> result = new HashMap();

        result.put("서울", getWeatherDataByGrid(60, 127));
        result.put("부산", getWeatherDataByGrid(98, 76));
        result.put("대구", getWeatherDataByGrid(89, 90));
        result.put("인천", getWeatherDataByGrid(55, 124));
        result.put("광주", getWeatherDataByGrid(58, 74));
        result.put("대전", getWeatherDataByGrid(67, 100));
        result.put("울산", getWeatherDataByGrid(102, 84));
        result.put("세종", getWeatherDataByGrid(66, 103));
        result.put("수원", getWeatherDataByGrid(60, 121));
        result.put("춘천", getWeatherDataByGrid(73, 134));
        result.put("강릉", getWeatherDataByGrid(92, 131));
        result.put("청주", getWeatherDataByGrid(69, 106));
        result.put("전주", getWeatherDataByGrid(63, 89));
        result.put("목포", getWeatherDataByGrid(50, 67));
        result.put("안동", getWeatherDataByGrid(91, 106));
        result.put("진주", getWeatherDataByGrid(81, 75));
        result.put("제주", getWeatherDataByGrid(52, 38));

        System.out.println("지역별 날씨정보 불러오기 완료");

        return result;
    }

    public WeatherApiResponseDTO getWeatherDataByCoordinate(Double lati, Double lngi){
        GridCoordinate coord = toGridCoordinate(lati, lngi);

        // 현재 날짜와 현재 시간을 파싱하는 코드
        // 분 단위 시간은 0분 or 30분으로 파싱하도록 설정
        LocalDateTime current = LocalDateTime.now();

        int curMi = current.getMinute();
        int adjMi = curMi - (curMi % 30);
        current = current.withMinute(adjMi);

        // 30분마다 데이터를 불러오는 기상청 시간에 맞추기 위한 코드
        if(current.getMinute() != 30){
            if(current.getHour() == 0){
                current = current.minusDays(1);
                current = current.withHour(23);
                current = current.withMinute(30);
            }
            else{
                current = current.minusHours(1);
                current = current.withMinute(30);
            }
        }

        // 기상청에서 쓰일 데이터로 문자열 변환
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyyMMdd");
        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HHmm");

        String date = current.format(dateFormatter);
        String hourM = current.format(timeFormatter);

        WeatherApiResponseDTO result = null;

        try{
            UriComponents uri = UriComponentsBuilder.newInstance()
                    .scheme("https")
                    .host("apis.data.go.kr")
                    .path("/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst")
                    .queryParam("serviceKey", key)
                    .queryParam("pageNo", "1")
                    .queryParam("numOfRows", "1000")
                    .queryParam("dataType", "JSON")
                    .queryParam("base_date",  date)
                    .queryParam("base_time", hourM)
                    .queryParam("nx", coord.X)
                    .queryParam("ny", coord.Y)
                    .build(true);

            ObjectMapper mapper = new ObjectMapper();
            URL url = new URL(uri.toUriString());
            ApiResponse res = mapper.readValue(url, ApiResponse.class);

            String resultCode = res.getResponse().getHeader().getResultCode();

            if(!resultCode.equals("00")){
                throw new NationalWeatherServiceError(res.getResponse().getHeader().getResultMsg());
            }

            ArrayList<Item> item = res.getResponse().getBody().getItems().getItem();

            result = new WeatherApiResponseDTO(
                    item.get(24).getFcstValue(),
                    item.get(18).getFcstValue(),
                    item.get(6).getFcstValue(),
                    item.get(0).getFcstValue(),
                    item.get(0).getFcstDate() + " " + item.get(0).getFcstTime()
            );
        }
        catch (NationalWeatherServiceError e){
            e.printStackTrace();
            System.out.printf("기상청 오류: %s\n", e.getMessage());
            result = new WeatherApiResponseDTO(3000, "기상청에서 데이터를 받아오는 과정에서 문제가 생겼습니다");
        }
        catch (Exception e){
            e.printStackTrace();
            System.out.println("에러 발생");
            result = new WeatherApiResponseDTO(5000, "서버에서 알 수 없는 오류가 발생했습니다");
        }

        return result;
    }

    public WeatherApiResponseDTO getWeatherDataByGrid(Integer X, Integer Y){
        // 현재 날짜와 현재 시간을 파싱하는 코드
        // 분 단위 시간은 0분 or 30분으로 파싱하도록 설정
        LocalDateTime current = LocalDateTime.now();

        int curMi = current.getMinute();
        int adjMi = curMi - (curMi % 30);
        current = current.withMinute(adjMi);

        // 30분마다 데이터를 불러오는 기상청 시간에 맞추기 위한 코드
        if(current.getMinute() != 30){
            if(current.getHour() == 0){
                current = current.minusDays(1);
                current = current.withHour(23);
                current = current.withMinute(30);
            }
            else{
                current = current.minusHours(1);
                current = current.withMinute(30);
            }
        }

        // 기상청에서 쓰일 데이터로 문자열 변환
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyyMMdd");
        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HHmm");

        String date = current.format(dateFormatter);
        String hourM = current.format(timeFormatter);

        WeatherApiResponseDTO result = null;

        try{
            UriComponents uri = UriComponentsBuilder.newInstance()
                    .scheme("https")
                    .host("apis.data.go.kr")
                    .path("/1360000/VilageFcstInfoService_2.0/getUltraSrtFcst")
                    .queryParam("serviceKey", key)
                    .queryParam("pageNo", "1")
                    .queryParam("numOfRows", "1000")
                    .queryParam("dataType", "JSON")
                    .queryParam("base_date",  date)
                    .queryParam("base_time", hourM)
                    .queryParam("nx", X)
                    .queryParam("ny", Y)
                    .build(true);

            ObjectMapper mapper = new ObjectMapper();
            URL url = new URL(uri.toUriString());
            ApiResponse res = mapper.readValue(url, ApiResponse.class);

            String resultCode = res.getResponse().getHeader().getResultCode();

            if(!resultCode.equals("00")){
                throw new NationalWeatherServiceError(res.getResponse().getHeader().getResultMsg());
            }

            ArrayList<Item> item = res.getResponse().getBody().getItems().getItem();

            result = new WeatherApiResponseDTO(
                    item.get(24).getFcstValue(),
                    item.get(18).getFcstValue(),
                    item.get(6).getFcstValue(),
                    item.get(0).getFcstValue(),
                    item.get(0).getFcstDate() + " " + item.get(0).getFcstTime()
            );
        }
        catch (NationalWeatherServiceError e){
            e.printStackTrace();
            System.out.printf("기상청 오류: %s\n", e.getMessage());
            result = new WeatherApiResponseDTO(3000, "기상청에서 데이터를 받아오는 과정에서 문제가 생겼습니다");
        }
        catch (Exception e){
            e.printStackTrace();
            System.out.println("에러 발생");
            result = new WeatherApiResponseDTO(5000, "서버에서 알 수 없는 오류가 발생했습니다");
        }

        return result;
    }

    private GridCoordinate toGridCoordinate(Double lati, Double lngi){
        Double RE = 6371.00877; // 지구 반경
        Double GRID = 5.0; // 격자 간격
        Double sLati1 = 30.0; // 투명 위도(1)
        Double sLati2 = 60.0; // 투명 위도(2)
        Double oLngi = 126.0; // 기준점 경도
        Double oLati = 38.0; // 기준점 위도
        Double x0 = 210 / GRID; // 기준점 X좌표
        Double y0 = 675 / GRID; // 기준점 Y좌표

        Double DEGRAD = Math.PI / 180.0;

        Double re = RE / GRID;
        Double slat1 = sLati1 * DEGRAD;
        Double slat2 = sLati2 * DEGRAD;
        Double olngi = oLngi * DEGRAD;
        Double olati = oLati * DEGRAD;

        Double sn = Math.tan(Math.PI * 0.25 + slat2 * 0.5) / Math.tan(Math.PI * 0.25 + slat1 * 0.5);
        sn = Math.log(Math.cos(slat1) / Math.cos(slat2)) / Math.log(sn);
        Double sf = Math.tan(Math.PI * 0.25 + slat1 * 0.5);
        sf = Math.pow(sf, sn) * Math.cos(slat1) / sn;
        Double ro = Math.tan(Math.PI * 0.25 + olati * 0.5);
        ro = re * sf / Math.pow(ro, sn);

        Double ra = Math.tan(Math.PI * 0.25 + (lati) * DEGRAD * 0.5);
        ra = re * sf / Math.pow(ra, sn);
        Double theta  = lngi * DEGRAD - olngi;
        if(theta > Math.PI)
            theta -= 2.0 * Math.PI;
        if(theta < -Math.PI)
            theta += 2.0 * Math.PI;
        theta *= sn;

        Integer finalX = (int)Math.floor(ra * Math.sin(theta) + x0 + 0.5);
        Integer finalY = (int)Math.floor(ro - ra * Math.cos(theta) + y0 + 0.5);

        return new GridCoordinate(finalX + 1, finalY + 1);
    }

    private class GridCoordinate{
        public Integer X, Y;

        public GridCoordinate(Integer X, Integer Y){
            this.X = X;
            this.Y = Y;
        }
    }
}

class NationalWeatherServiceError extends Exception {
    public NationalWeatherServiceError(String message){
        super(message);
    }
}
