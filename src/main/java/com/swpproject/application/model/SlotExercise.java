package com.swpproject.application.model;

import com.swpproject.application.enums.Attendant;
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
public class SlotExercise {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String day;
    private String start_hour;
    private String end_hour;
    private int week;
    private int year;
    private boolean isPending;
    private Attendant attendantStatus;

    public boolean isPending() {
        return isPending;
    }

    public void setPending(boolean pending) {
        isPending = pending;
    }

    @ManyToOne
    @JoinColumn(name = "schedule_id", nullable = false)
    private Schedule schedule;

    @ManyToOne
    @JoinColumn(name = "personal_trainer_id", nullable = true)
    private PersonalTrainer personalTrainer;

    @ManyToOne
    @JoinColumn(name = "gymer_id", nullable = true)
    private Gymer gymer;

    @ManyToOne
    @JoinColumn(name = "OrderId", nullable = true)
    private OrderRequest orderRequest;

}
