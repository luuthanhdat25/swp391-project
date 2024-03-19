package com.swpproject.application.model;

import jakarta.persistence.*;
import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Data
@Entity
@Table(name = "slot_exercise_detail")
public class SlotExerciseDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private int setExe;
    private int rep;

    @ManyToOne
    @JoinColumn(name = "exercise_id", nullable = true)
    private Exercise exercise;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "slot_exercise_id", nullable = true)
    private SlotExercise slotExercise;


}
