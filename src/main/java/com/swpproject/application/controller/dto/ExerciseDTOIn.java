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
public class ExerciseDTOIn {
    private String exerciseName;
    private String levelRadio;
    private String equipment;
    private String muscle;
    private MultipartFile image;
    private String youtubeLink;
    private String exerciseDescription;
    private String isPrivate;
}
