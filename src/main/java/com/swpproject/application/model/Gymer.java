package com.swpproject.application.model;

import jakarta.persistence.*;
import org.springframework.data.relational.core.mapping.Table;

@Entity
@Table(name = "GYMER")
public class Gymer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "GYMER_ID")
    private Integer gymerId;

    @Column(name = "[WEIGHT]")
    private Float weight;

    @Column(name = "HEIGHT")
    private Float height;

    @Column(name = "GOAL", columnDefinition = "NVARCHAR(MAX)")
    private String goal;

    @OneToOne
    @JoinColumn(name = "ACCOUNT_ID", nullable = false)
    private Account account;

    public Integer getGymerId() {
        return gymerId;
    }

    public void setGymerId(Integer gymerId) {
        this.gymerId = gymerId;
    }

    public Float getWeight() {
        return weight;
    }

    public void setWeight(Float weight) {
        this.weight = weight;
    }

    public Float getHeight() {
        return height;
    }

    public void setHeight(Float height) {
        this.height = height;
    }

    public String getGoal() {
        return goal;
    }

    public void setGoal(String goal) {
        this.goal = goal;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }
}