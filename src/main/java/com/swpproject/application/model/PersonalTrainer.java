package com.swpproject.application.model;

import jakarta.persistence.*;
import org.hibernate.annotations.ColumnDefault;

import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

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
    @JoinColumn(name="account_id", referencedColumnName = "Id")
    private Account account;

    @OneToMany(mappedBy = "personalTrainer")
    private List<Certificate> certificateList;

    public PersonalTrainer() {}

    public PersonalTrainer(Integer id, String bankName, String bankNumber, Double weight, Double height, Double price, Double balance, Boolean is_active, String description, Account account, List<Certificate> certificateList) {
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
        this.certificateList = certificateList;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Boolean getIs_active() {
        return is_active;
    }

    public void setIs_active(Boolean is_active) {
        this.is_active = is_active;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public List<Certificate> getCertificateList() {
        return certificateList;
    }

    public void setCertificateList(List<Certificate> certificateList) {
        this.certificateList = certificateList;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof PersonalTrainer that)) return false;
        return Objects.equals(getId(), that.getId()) && Objects.equals(getBankName(), that.getBankName()) && Objects.equals(getBankNumber(), that.getBankNumber()) && Objects.equals(getWeight(), that.getWeight()) && Objects.equals(getHeight(), that.getHeight()) && Objects.equals(getPrice(), that.getPrice()) && Objects.equals(getBalance(), that.getBalance()) && Objects.equals(getIs_active(), that.getIs_active()) && Objects.equals(getDescription(), that.getDescription()) && Objects.equals(getAccount(), that.getAccount()) && Objects.equals(getCertificateList(), that.getCertificateList());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getId(), getBankName(), getBankNumber(), getWeight(), getHeight(), getPrice(), getBalance(), getIs_active(), getDescription(), getAccount(), getCertificateList());
    }

    @Override
    public String toString() {
        return "PersonalTrainer{" +
                "id=" + id +
                ", bankName='" + bankName + '\'' +
                ", bankNumber='" + bankNumber + '\'' +
                ", weight=" + weight +
                ", height=" + height +
                ", price=" + price +
                ", balance=" + balance +
                ", is_active=" + is_active +
                ", description='" + description + '\'' +
                '}';
    }
}