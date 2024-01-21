package com.swpproject.application.model;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

public class Exercise {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String type;
    private String description;
    private String level;
    private String videoDescription;
    private String imageDescription;
    private int caloriesOutput;
    private Long personalTrainerId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getVideoDescription() {
        return videoDescription;
    }

    public void setVideoDescription(String videoDescription) {
        this.videoDescription = videoDescription;
    }

    public String getImageDescription() {
        return imageDescription;
    }

    public void setImageDescription(String imageDescription) {
        this.imageDescription = imageDescription;
    }

    public int getCaloriesOutput() {
        return caloriesOutput;
    }

    public void setCaloriesOutput(int caloriesOutput) {
        this.caloriesOutput = caloriesOutput;
    }

    public Long getPersonalTrainerId() {
        return personalTrainerId;
    }

    public void setPersonalTrainerId(Long personalTrainerId) {
        this.personalTrainerId = personalTrainerId;
    }

    public Exercise() {
    }

    // Parameterized constructor
    public Exercise(String name, String type, String description, String level,
                    String videoDescription, String imageDescription, int caloriesOutput, Long personalTrainerId) {
        this.name = name;
        this.type = type;
        this.description = description;
        this.level = level;
        this.videoDescription = videoDescription;
        this.imageDescription = imageDescription;
        this.caloriesOutput = caloriesOutput;
        this.personalTrainerId = personalTrainerId;
    }
}
