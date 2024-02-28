package com.swpproject.application.model;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.relational.core.mapping.Table;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Data
@Entity
@Table(name = "slot_exercise")
public class SlotExcercise {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String day;
    private int start_hour;
    private int end_hour;

    private boolean is_pending;
    private String attendant_status;

    @ManyToOne
    @JoinColumn(name = "schedule_id", nullable = false)
    private SchedulePersonalTrainer schedulePersonalTrainer;
}
