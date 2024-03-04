package com.swpproject.application.model;

import jakarta.persistence.*;
<<<<<<< HEAD
import lombok.*;
=======
>>>>>>> 24d78f3928785903a9dec8925d215273a41baffc

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


