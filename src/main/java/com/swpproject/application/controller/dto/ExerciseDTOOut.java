package com.swpproject.application.controller.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ExerciseDTOOut {
    private Integer id;
    private String name;
    private String type;
    private String description;
    private String level;
    private String equipment;
    private String videoDescription;
    private byte[] imageDescription;
    private int personalTrainer_id;
    private byte[] personalTrainer_image;
}
