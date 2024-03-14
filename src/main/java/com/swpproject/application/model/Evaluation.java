package com.swpproject.application.model;

import jakarta.persistence.*;
import lombok.*;
import org.intellij.lang.annotations.Identifier;

import java.time.LocalDate;
import java.time.LocalDateTime;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder(toBuilder = true)
@ToString
@Entity
public class Evaluation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "star", nullable = false)
    private int star;

    @Column(name = "content", columnDefinition = "nvarchar(max)")
    private String content;

    @Column(name = "evaluation_date", nullable = false)
    private LocalDateTime evaluationDate;

    // TODO: Maybe need Order (Gymer - PT)

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "gymer_id", nullable = false)
    private Gymer gymer;

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name = "personal_trainer_id", nullable = false)
    private PersonalTrainer personalTrainer;
}
