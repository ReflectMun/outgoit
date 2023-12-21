package com.example.outgoit.trail;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@JsonIgnoreProperties(ignoreUnknown = true)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class TrailRouteDTO2 {
    @JsonProperty("0")
    private Double lngi; // 경도(x)
    @JsonProperty("1")
    private Double lati; // 위도(y)

}




