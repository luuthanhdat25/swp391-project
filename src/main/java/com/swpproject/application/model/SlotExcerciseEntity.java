package com.swpproject.application.model;

import jakarta.persistence.*;
import org.springframework.data.relational.core.mapping.Table;

@Entity
@Table(name = "SLOT_EXERCISE_ENTITY")
public class SlotExcerciseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String day;
    private int startHour;
    private int endHour;

    private boolean Is_Pending;
    private String Attendant_Status;

    @ManyToOne
    @JoinColumn(name = "schedule_id", nullable = false)
    private SchedulePersonalTrainerEntity schedulePersonalTrainer;

    // Constructors, getters, setters, and other methods

    public SlotExcerciseEntity(Long id, String day, int startHour, int endHour, boolean is_Pending, String attendant_Status, SchedulePersonalTrainerEntity schedulePersonalTrainer) {
        this.id = id;
        this.day = day;
        this.startHour = startHour;
        this.endHour = endHour;
        Is_Pending = is_Pending;
        Attendant_Status = attendant_Status;
        this.schedulePersonalTrainer = schedulePersonalTrainer;
    }

    public SlotExcerciseEntity() {

    }

    @Override
    public String toString() {
        return "SlotExcerciseEntity{" +
                "id=" + id +
                ", day='" + day + '\'' +
                ", startHour=" + startHour +
                ", endHour=" + endHour +
                ", Is_Pending=" + Is_Pending +
                ", Attendant_Status='" + Attendant_Status + '\'' +
                ", schedulePersonalTrainer=" + schedulePersonalTrainer +
                '}';
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDay() {
        return day;
    }

    public void setDay(String day) {
        this.day = day;
    }

    public int getStartHour() {
        return startHour;
    }

    public void setStartHour(int startHour) {
        this.startHour = startHour;
    }

    public int getEndHour() {
        return endHour;
    }

    public void setEndHour(int endHour) {
        this.endHour = endHour;
    }

    public boolean isIs_Pending() {
        return Is_Pending;
    }

    public void setIs_Pending(boolean is_Pending) {
        Is_Pending = is_Pending;
    }

    public String getAttendant_Status() {
        return Attendant_Status;
    }

    public void setAttendant_Status(String attendant_Status) {
        Attendant_Status = attendant_Status;
    }

    public SchedulePersonalTrainerEntity getSchedulePersonalTrainer() {
        return schedulePersonalTrainer;
    }

    public void setSchedulePersonalTrainer(SchedulePersonalTrainerEntity schedulePersonalTrainer) {
        this.schedulePersonalTrainer = schedulePersonalTrainer;
    }
}
