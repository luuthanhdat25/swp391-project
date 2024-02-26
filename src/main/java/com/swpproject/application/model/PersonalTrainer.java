package com.swpproject.application.model;

import jakarta.persistence.*;
import org.hibernate.annotations.ColumnDefault;

import java.time.LocalDate;
// View PT, detail - Trình
@Entity
public class PersonalTrainer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String bankName;
    private String bankNumber;
    private Double weight;
    private Double height;
    private Double price;
    private Double balance;
    private Boolean is_active;
    private String description;
    @OneToOne
    @JoinColumn(name="id", nullable = false)
    private Account account;

    public PersonalTrainer() {
    }

    public PersonalTrainer(Integer id, Account account, String bankName, String bankNumber, Double weight, Double height, Double price, String description) {
        this.id = id;
        this.account = account;
        this.bankName = bankName;
        this.bankNumber = bankNumber;
        this.weight = weight;
        this.height = height;
        this.price = price;
        this.description = description;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getBankNumber() {
        return bankNumber;
    }

    public void setBankNumber(String bankNumber) {
        this.bankNumber = bankNumber;
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

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getBalance() {
        return balance;
    }

    public void setBalance(Double balance) {
        this.balance = balance;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "PersonalTrainer{" +
                "id=" + id +
                ", account=" + account +
                ", bankName='" + bankName + '\'' +
                ", bankNumber='" + bankNumber + '\'' +
                ", weight=" + weight +
                ", height=" + height +
                ", price=" + price +
                ", description='" + description + '\'' +
                '}';
    }
}