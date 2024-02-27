package com.swpproject.application.model;

import jakarta.persistence.*;
import org.springframework.data.relational.core.mapping.Table;

@Entity
@Table(name = "SCHEDULE_PERSONAL_TRAINER")
public class SchedulePersonalTrainerEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "SCHEDULE_ID")
    private Long scheduleId;

    // Thêm các thuộc tính khác của bảng SchedulePersonalTrainerEntity nếu cần

    @ManyToOne
    @JoinColumn(name = "PT_ID", nullable = false)
    private PersonalTrainer personalTrainer;

    public Long getScheduleId() {
        return scheduleId;
    }

    public void setScheduleId(Long scheduleId) {
        this.scheduleId = scheduleId;
    }

    public PersonalTrainer getPersonalTrainer() {
        return personalTrainer;
    }

    public void setPersonalTrainer(PersonalTrainer personalTrainer) {
        this.personalTrainer = personalTrainer;
    }

    @Override
    public String toString() {
        return "SchedulePersonalTrainerEntity{" +
                "scheduleId=" + scheduleId +
                ", personalTrainer=" + personalTrainer +
                '}';
    }
}
