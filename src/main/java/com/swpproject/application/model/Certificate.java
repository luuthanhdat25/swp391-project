package com.swpproject.application.model;

import jakarta.persistence.*;

import java.util.Arrays;
import org.springframework.data.relational.core.mapping.Table;
@Entity
@Table(name = "certificate")
public class Certificate {
    @Id
    private Integer id;
    private String title;
    private String organizer;
    @Lob // use to store varbinary in db
    private byte[] image;

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "personal_trainer_id", nullable = false)
    private PersonalTrainer personalTrainer;

    public Certificate() {}

    public Certificate(Integer id, String title, String organizer, byte[] image, PersonalTrainer personalTrainer) {
        this.id = id;
        this.title = title;
        this.organizer = organizer;
        this.image = image;
        this.personalTrainer = personalTrainer;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getOrganizer() {
        return organizer;
    }

    public void setOrganizer(String organizer) {
        this.organizer = organizer;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public PersonalTrainer getPersonalTrainer() {
        return personalTrainer;
    }

    public void setPersonalTrainer(PersonalTrainer personalTrainer) {
        this.personalTrainer = personalTrainer;
    }

    @Override
    public String toString() {
        return "Certificate{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", organizer='" + organizer + '\'' +
                ", image=" + Arrays.toString(image) +
                ", personalTrainer=" + personalTrainer +
                '}';
    }
}
