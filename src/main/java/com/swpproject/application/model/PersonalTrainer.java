package com.swpproject.application.model;
import org.springframework.data.relational.core.mapping.Table;
import jakarta.persistence.*;
import org.hibernate.annotations.ColumnDefault;

import java.time.LocalDate;
// View PT, detail - Trình
@Entity
@Table(name = "personalTrainer")
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
    @Column(columnDefinition = "TEXT")
    private String description;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="account_id")
    private Account account;

    public PersonalTrainer() {
    }

    public PersonalTrainer(Integer id, String bankName, String bankNumber, Double weight, Double height, Double price, Double balance, Boolean is_active, String description, Account account) {
        this.id = id;
        this.bankName = bankName;
        this.bankNumber = bankNumber;
        this.weight = weight;
        this.height = height;
        this.price = price;
        this.balance = balance;
        this.is_active = is_active;
        this.description = description;
        this.account = account;
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