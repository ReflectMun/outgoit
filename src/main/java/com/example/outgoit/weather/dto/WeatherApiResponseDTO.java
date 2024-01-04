package com.example.outgoit.weather.dto;

import lombok.Data;

@Data
public class WeatherApiResponseDTO {
    private String temperature; // T1H, 기온
    private String skyCondition; // SKY, 하늘 상태
    private String precipitationType; // PTY, 강수 형태
    private String lightning; // LGT, 번개 상태
    private int statusCode;
    private String errorMsg;
    private String dateTime;

    public WeatherApiResponseDTO(
            String temperature,
            String skyCondition,
            String precipitationType,
            String lightning,
            String dateTime
    ){
        this.statusCode = 200;
        this.errorMsg = null;

        this.temperature = temperature;
        this.skyCondition = skyCondition;
        this.precipitationType = precipitationType;
        this.lightning = lightning;
        this.dateTime = dateTime;
    }

    public WeatherApiResponseDTO(
            int statusCode,
            String errorMsg
    ){
        this.statusCode = statusCode;
        this.errorMsg = errorMsg;
    }
}
