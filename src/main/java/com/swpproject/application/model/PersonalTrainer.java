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
    private List<Certificate> certificates;

}