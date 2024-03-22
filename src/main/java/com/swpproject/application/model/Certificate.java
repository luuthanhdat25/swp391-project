package com.swpproject.application.model;

import jakarta.persistence.*;

import java.util.Arrays;

import lombok.*;
import org.springframework.data.relational.core.mapping.Table;
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Data
@Entity
@Table(name = "certificate")
public class Certificate {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
    @Lob
    @Column(name = "image")
    private byte[] image;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "personal_trainer_id")
    private PersonalTrainer personalTrainer;
}
