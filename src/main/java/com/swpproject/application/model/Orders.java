package com.swpproject.application.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;
@Getter
@Setter
@Entity
public class Orders {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
    @Column(name = "title")
    private String title;
    @Column(name = "description")
    private String des;
    @Column(name = "startday")
    private LocalDateTime start;
    @Column(name = "endday")
    private LocalDateTime end;
    @Column(name = "amount")
    private Double totalAmount;
    @Column(name = "status")
    private String status;
    @ManyToOne
    @JoinColumn(name = "personal_trainer_id", nullable = false)
    private PersonalTrainer personalTrainer;
    @ManyToOne
    @JoinColumn(name = "gymer_id", nullable = false)
    private Gymer gymer;
}
