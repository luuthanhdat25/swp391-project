package com.swpproject.application.model;

import jakarta.persistence.*;
import org.hibernate.annotations.ColumnDefault;

import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

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