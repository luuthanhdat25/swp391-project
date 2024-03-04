package com.swpproject.application.model;

import jakarta.persistence.*;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Data
@Entity
public class Schedule {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @ManyToOne
    @JoinColumn(name = "gymer_id")
    private Gymer gymer;

    @ManyToOne
    @JoinColumn(name = "personal_trainer_id", nullable = true)
    private PersonalTrainer personalTrainer;

}


