package com.swpproject.application.dto;

import com.swpproject.application.model.Exercise;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class SlotExerciseDetailDTO {
    private Integer id;
    private List<Exercise> exerciseList;
    private int exerciseId;
    private int setExe;
    private int rep;
    private String description;
    private String check;
}