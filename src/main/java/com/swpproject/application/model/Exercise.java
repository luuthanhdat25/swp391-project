package com.swpproject.application.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Exercise {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;
    private String type;
    private String description;
    private String level;
    private String equipment;
    private String videoDescription;
    private String imageDescription;
    private int personalTrainerId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
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

    public int getPersonalTrainerId() {
        return personalTrainerId;
    }

    public void setPersonalTrainerId(int personalTrainerId) {
        this.personalTrainerId = personalTrainerId;
    }

    public String getEquipment() {
        return equipment;
    }

    public void setEquipment(String equipment) {
        this.equipment = equipment;
    }

    public Exercise() {
    }

    public Exercise(String name, String type, String description, String level, String equipment, String videoDescription, String imageDescription, int personalTrainerId) {
        this.name = name;
        this.type = type;
        this.description = description;
        this.level = level;
        this.equipment = equipment;
        this.videoDescription = videoDescription;
        this.imageDescription = imageDescription;
        this.personalTrainerId = personalTrainerId;
    }

    public Exercise(int id, String name, String type, String description, String level, String equipment, String videoDescription, String imageDescription, int personalTrainerId) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.description = description;
        this.level = level;
        this.equipment = equipment;
        this.videoDescription = videoDescription;
        this.imageDescription = imageDescription;
        this.personalTrainerId = personalTrainerId;
    }
}
