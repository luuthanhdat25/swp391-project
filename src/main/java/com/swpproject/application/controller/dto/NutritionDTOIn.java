package com.swpproject.application.controller.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class NutritionDTOIn {
    private String nutritionName;
    private Float calories;
    private Float protein;
    private Float fat;
    private Float carb;
    private MultipartFile image;
    private String isPrivate;
}