package com.swpproject.application.model;
import lombok.*;
import org.springframework.data.relational.core.mapping.Table;
import jakarta.persistence.*;

import java.util.Arrays;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Data
@Entity
@Table(name = "nutrition")
public class Nutrition {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer nutritionId;

    private String name;

    private Float protein;

    private Float fat;

    private Float carb;

    private Float caloIn;
    @Lob
    private byte[] imageDescription;

    private int isPrivate;

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "personal_trainer_id")
    private PersonalTrainer personalTrainer;

    @Override
    public String toString() {
        boolean isImageNull = imageDescription == null;
        return "Nutrition{" +
                "nutritionId=" + nutritionId +
                ", name='" + name + '\'' +
                ", protein=" + protein +
                ", fat=" + fat +
                ", carb=" + carb +
                ", caloIn=" + caloIn +
                ", imageDescription= is null " + isImageNull +
                ", isPrivate=" + isPrivate +
                ", personalTrainerId=" + personalTrainer.getId() +
                '}';
    }
}

