package com.swpproject.application.model;

import com.swpproject.application.enums.Gender;
import com.swpproject.application.enums.Role;
import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import org.hibernate.annotations.ColumnDefault;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.Date;

@Entity
@Table(name = "ACCOUNT")
public class Account {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ACCOUNT_ID")
    private Integer accountId;

    @Column(name = "FULLNAME", nullable = false)
    private String fullName;

    @Column(name = "EMAIL", nullable = false, unique = true)
    private String email;

    @Column(name = "PASSWORD", nullable = false)
    private String password;

    @Column(name = "GENDER", length = 1, nullable = false, columnDefinition = "CHAR(1)")
    private Gender gender;

    @Column(name = "PHONE")
    private String phone;

    @Column(name = "COIN", columnDefinition = "INT DEFAULT 0")
    private Integer coin;

    @Column(name = "BIRTHDAY")
    private LocalDate birthday;

    @Column(name = "ADDRESS", columnDefinition = "NVARCHAR(MAX)")
    private String address;

    @Column(name = "ROLE", nullable = false, length = 5)
    private String role;

    @Column(name = "IS_BAN", columnDefinition = "BIT DEFAULT 0")
    private Boolean isBan;

    @Lob
    @Column(name = "AVATAR_IMAGE")
    private byte[] avatarImage;

    @OneToOne(mappedBy = "account", cascade = CascadeType.ALL)
    private PersonalTrainer personalTrainer;

    @OneToOne(mappedBy = "account", cascade = CascadeType.ALL)
    private Gymer gymer;

    // Getter and setter methods

    @Override
    public String toString() {
        return "Account{" +
                "accountId=" + accountId +
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", gender=" + gender +
                ", phone='" + phone + '\'' +
                ", coin=" + coin +
                ", birthday=" + birthday +
                ", address='" + address + '\'' +
                ", role='" + role + '\'' +
                ", isBan=" + isBan +
                ", avatarImage=" + Arrays.toString(avatarImage) +
                ", personalTrainer=" + personalTrainer +
                ", gymer=" + gymer +
                '}';
    }

    public Integer getAccountId() {
        return accountId;
    }

    public void setAccountId(Integer accountId) {
        this.accountId = accountId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getCoin() {
        return coin;
    }

    public void setCoin(Integer coin) {
        this.coin = coin;
    }

    public LocalDate getBirthday() {
        return birthday;
    }

    public void setBirthday(LocalDate birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Boolean getBan() {
        return isBan;
    }

    public void setBan(Boolean ban) {
        isBan = ban;
    }

    public byte[] getAvatarImage() {
        return avatarImage;
    }

    public void setAvatarImage(byte[] avatarImage) {
        this.avatarImage = avatarImage;
    }

    public PersonalTrainer getPersonalTrainer() {
        return personalTrainer;
    }

    public void setPersonalTrainer(PersonalTrainer personalTrainer) {
        this.personalTrainer = personalTrainer;
    }

    public Gymer getGymer() {
        return gymer;
    }

    public void setGymer(Gymer gymer) {
        this.gymer = gymer;
    }
}