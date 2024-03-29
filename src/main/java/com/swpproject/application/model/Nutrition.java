package com.swpproject.application.model;
import com.swpproject.application.dto.NutritionDTOOut;
import lombok.*;
import org.springframework.data.relational.core.mapping.Table;
import jakarta.persistence.*;

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


    public NutritionDTOOut getNutritionDTOOut(){
        NutritionDTOOut nutritionDTOOut = new NutritionDTOOut();
        nutritionDTOOut.setNutritionId(getNutritionId());
        nutritionDTOOut.setName(getName());
        nutritionDTOOut.setCaloIn(getCaloIn());
        nutritionDTOOut.setProtein(getProtein());
        nutritionDTOOut.setFat(getFat());
        nutritionDTOOut.setCarb(getCarb());
        nutritionDTOOut.setImageDescription(getImageDescription());
        nutritionDTOOut.setIsPrivate(getIsPrivate());
        if(personalTrainer != null){
            nutritionDTOOut.setPersonalTrainerId(getPersonalTrainer().getId());
            nutritionDTOOut.setPersonalTrainerImage(getPersonalTrainer().getAccount().getAvatarImage());
        }
        return nutritionDTOOut;
    }
}

