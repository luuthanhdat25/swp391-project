package com.swpproject.application.dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder(toBuilder = true)
public class SlotTrackingDto {
    private Integer id;
    private String nutritionName;
    private Float fat;
    private Float carb;
    private Float protein;
    private Float amount;
    private Float calories;
}
