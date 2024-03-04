package com.swpproject.application.model;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.relational.core.mapping.Table;

import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Data
@Entity
@Table(name = "slot_exercise")
public class SlotExercise {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String day;
    private String start_hour;
    private String end_hour;
<<<<<<< HEAD:src/main/java/com/swpproject/application/model/SlotExercise.java
    private int week;
    private int year;
=======
>>>>>>> 24d78f3928785903a9dec8925d215273a41baffc:src/main/java/com/swpproject/application/model/SlotExcercise.java
    private boolean is_pending;
    private String attendant_status;

    @ManyToOne
    @JoinColumn(name = "schedule_id", nullable = false)
    private Schedule schedule;
}
