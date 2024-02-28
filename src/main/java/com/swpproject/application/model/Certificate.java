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
    private Integer id;
    private String title;
    private String organizer;
    @Lob
    private byte[] image;
    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "personal_trainer_id", nullable = false)
    private PersonalTrainer personalTrainer;
}
