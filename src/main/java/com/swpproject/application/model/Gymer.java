package com.swpproject.application.model;

import jakarta.persistence.*;

@Entity
public class Gymer {
    @Id
    private Integer id;
    private Double weight;
    private Double height;
    private String goal;
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="account", referencedColumnName = "Id")
    private Account account;
    public Gymer() {}

    public Gymer(Integer id, Double weight, Double height, String goal, Account account) {
        this.id = id;
        this.weight = weight;
        this.height = height;
        this.goal = goal;
        this.account = account;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }

    public Double getHeight() {
        return height;
    }

    public void setHeight(Double height) {
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

    @Override
    public String toString() {
        return "Gymer{" +
                "id=" + id +
                ", weight=" + weight +
                ", height=" + height +
                ", goal='" + goal + '\'' +
                ", account=" + account +
                '}';
    }
}
