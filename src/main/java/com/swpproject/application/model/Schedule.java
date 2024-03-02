package com.swpproject.application.model;

import jakarta.persistence.*;

@Entity
public class Schedule {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @OneToOne
    @JoinColumn(name = "gymer_id")
    private Gymer gymer;

    @OneToOne
    @JoinColumn(name = "personal_trainer_id")
    private PersonalTrainer personalTrainer;

    public Schedule(){}

    public Schedule(Integer id, Gymer gymer) {
        this.id = id;
        this.gymer = gymer;
    }

    public Schedule(Integer id, Gymer gymer, PersonalTrainer personalTrainer) {
        this.id = id;
        this.gymer = gymer;
        this.personalTrainer = personalTrainer;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Gymer getGymer() {
        return gymer;
    }

    public void setGymer(Gymer gymer) {
        this.gymer = gymer;
    }

    public PersonalTrainer getPersonalTrainer() {
        return personalTrainer;
    }

    public void setPersonalTrainer(PersonalTrainer personalTrainer) {
        this.personalTrainer = personalTrainer;
    }

    @Override
    public String toString() {
        return "Schedule{" +
                "id=" + id +
                ", gymer=" + gymer +
                ", personalTrainer=" + personalTrainer +
                '}';
    }
}


