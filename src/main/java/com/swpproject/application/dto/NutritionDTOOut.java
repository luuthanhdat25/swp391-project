package com.swpproject.application.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class NutritionDTOOut {
    private int nutritionId;
    private String name;
    private Float caloIn;
    private Float protein;
    private Float fat;
    private Float carb;
    private byte[] imageDescription;
    private int isPrivate;
    private int personalTrainerId;
    private byte[] personalTrainerImage;
}
