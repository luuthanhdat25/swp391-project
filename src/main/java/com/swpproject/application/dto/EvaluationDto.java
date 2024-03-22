package com.swpproject.application.dto;

import com.swpproject.application.model.Gymer;
import com.swpproject.application.model.PersonalTrainer;
import lombok.*;

import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder(toBuilder = true)
public class EvaluationDto {
    private Integer id;
    private Integer starRating;
    private String commentFeedback;
    private LocalDateTime evaluationDateTime;
    private Gymer gymer;
    private GymerDto gymerDto;
    private PersonalTrainer personalTrainer;
}
