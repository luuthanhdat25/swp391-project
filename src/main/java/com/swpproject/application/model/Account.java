package com.swpproject.application.model;

import com.swpproject.application.enums.Gender;
import com.swpproject.application.enums.Role;
import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import org.hibernate.annotations.ColumnDefault;

import java.time.LocalDate;

@Entity
@Table(name="Account")
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer Id;
    private String fullName;
    private String email;
    private String password;

    @Enumerated(EnumType.STRING)
    @Column(columnDefinition = "char(1)")
    private Gender gender;
    private String phone;
    private LocalDate birthday;
    private String address;
    @Enumerated(EnumType.STRING)
    @Column(columnDefinition = "varchar(5)")
    private Role role;
    private Boolean isBan;
    private String image;
    @OneToOne
    @JoinColumn(name="personal_trainer_id", nullable = false)
    private PersonalTrainer personalTrainer;
    @OneToOne
    @JoinColumn(name="gymer_id",nullable = false)
    private Gymer gymer;

    public Account() {}

    public Account(Integer id, String fullName, String email, String password, Gender gender, String phone, LocalDate birthday, String address, Role role, Boolean isBan, String image) {
        Id = id;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.phone = phone;
        this.birthday = birthday;
        this.address = address;
        this.role = role;
        this.isBan = isBan;
        this.image = image;
    }

    public Integer getId() {
        return Id;
    }

    public void setId(Integer id) {
        Id = id;
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

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Boolean getBan() {
        return isBan;
    }

    public void setBan(Boolean ban) {
        isBan = ban;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Account{" +
                "Id=" + Id +
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", gender=" + gender +
                ", phone='" + phone + '\'' +
                ", birthday=" + birthday +
                ", address='" + address + '\'' +
                ", role=" + role +
                ", isBan=" + isBan +
                ", image='" + image + '\'' +
                '}';
    }
}
