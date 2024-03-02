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
@Table(name = "SCHEDULE_PERSONAL_TRAINER")
public class SchedulePersonalTrainer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    // Thêm các thuộc tính khác của bảng SchedulePersonalTrainerEntity nếu cần

    @ManyToOne
    @JoinColumn(name = "PT_ID", nullable = false)
    private PersonalTrainer personalTrainer;

}
