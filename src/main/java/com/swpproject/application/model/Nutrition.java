package com.swpproject.application.model;
import org.springframework.data.relational.core.mapping.Table;
import jakarta.persistence.*;

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

    private byte[] imageDescription;

    private Boolean isPrivate;

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "personal_trainer_id")
    private PersonalTrainer personalTrainer;

    public Integer getNutritionId() {
        return nutritionId;
    }

    public void setNutritionId(Integer nutritionId) {
        this.nutritionId = nutritionId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Float getProtein() {
        return protein;
    }

    public void setProtein(Float protein) {
        this.protein = protein;
    }

    public Float getFat() {
        return fat;
    }

    public void setFat(Float fat) {
        this.fat = fat;
    }

    public Float getCarb() {
        return carb;
    }

    public void setCarb(Float carb) {
        this.carb = carb;
    }

    public Float getCaloIn() {
        return caloIn;
    }

    public void setCaloIn(Float caloIn) {
        this.caloIn = caloIn;
    }

    public byte[] getImageDescription() {
        return imageDescription;
    }

    public void setImageDescription(byte[] imageDescription) {
        this.imageDescription = imageDescription;
    }

    public Boolean getPrivate() {
        return isPrivate;
    }

    public void setPrivate(Boolean aPrivate) {
        isPrivate = aPrivate;
    }

    public PersonalTrainer getPersonalTrainer() {
        return personalTrainer;
    }

    public void setPersonalTrainer(PersonalTrainer personalTrainer) {
        this.personalTrainer = personalTrainer;
    }

    public Nutrition() {
    }
}

