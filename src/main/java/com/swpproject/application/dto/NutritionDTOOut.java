package com.swpproject.application.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class NutritionDTOOut {
    private int nutritionId;
    private String name;
    private Float caloIn;
    private Float protein;
    private Float fat;
    private Float carb;
    private byte[] imageDescription;
    private String isPrivate;
    private int personalTrainerId;
    private byte[] personalTrainerImage;
}
