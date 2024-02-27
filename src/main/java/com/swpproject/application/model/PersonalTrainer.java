package com.swpproject.application.model;

import jakarta.persistence.*;
import org.hibernate.annotations.ColumnDefault;

import java.time.LocalDate;
// View PT, detail - Trình
@Entity
@Table(name = "PERSONAL_TRAINER")
public class PersonalTrainer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "PT_ID")
    private Integer ptId;

    @Column(name = "BANK_NAME")
    private String bankName;

    @Column(name = "BANK_NUMBER")
    private String bankNumber;

    @Column(name = "[DESC]")
    private String description;

    @Column(name = "IS_ACTIVE", columnDefinition = "BIT DEFAULT 0")
    private Boolean isActive;

    @Column(name = "PRICE")
    private Integer price;

    @OneToOne
    @JoinColumn(name = "ACCOUNT_ID", nullable = false)
    private Account account;

    @OneToOne(mappedBy = "personalTrainer", cascade = CascadeType.ALL)
    private Certificate certificate;

    public Integer getPtId() {
        return ptId;
    }

    public void setPtId(Integer ptId) {
        this.ptId = ptId;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getActive() {
        return isActive;
    }

    public void setActive(Boolean active) {
        isActive = active;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }

    public Certificate getCertificate() {
        return certificate;
    }

    public void setCertificate(Certificate certificate) {
        this.certificate = certificate;
    }
}