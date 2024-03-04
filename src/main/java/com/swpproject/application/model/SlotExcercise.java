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
public class SlotExcercise {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;


    private String day;
    private int start_hour;
    private int end_hour;
    private int week;
    private int year;

    private boolean isPending;
    private Attendant attendant_status;


    @ManyToOne
    @JoinColumn(name = "schedule_id", nullable = false)
    private SchedulePersonalTrainer schedulePersonalTrainer;



    @ManyToOne
    @JoinColumn(name = "gymer",nullable = false)
    private Gymer gymer;

    @Override
    public String toString() {
        return "SlotExcercise{" +
                "id=" + id +
                ", day='" + day + '\'' +
                ", start_hour=" + start_hour +
                ", end_hour=" + end_hour +
                ", is_pending=" + isPending +
                ", attendant_status='" + attendant_status + '\'' +
                ", schedulePersonalTrainer=" + schedulePersonalTrainer +
                '}';
    }

    public int getWeek() {
        return week;
    }

    public void setWeek(int week) {
        this.week = week;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
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

    public int getStart_hour() {
        return start_hour;
    }

    public void setStart_hour(int start_hour) {
        this.start_hour = start_hour;
    }

    public int getEnd_hour() {
        return end_hour;
    }

    public void setEnd_hour(int end_hour) {
        this.end_hour = end_hour;
    }

    public boolean isPending() {
        return isPending;
    }

    public void setPending(boolean pending) {
        isPending = pending;
    }

    public Gymer getGymer() {
        return gymer;
    }

    public void setGymer(Gymer gymer) {
        this.gymer = gymer;
    }

    public Attendant getAttendant_status() {
        return attendant_status;
    }

    public void setAttendant_status(Attendant attendant_status) {
        this.attendant_status = attendant_status;
    }

    public SchedulePersonalTrainer getSchedulePersonalTrainer() {
        return schedulePersonalTrainer;
    }

    public void setSchedulePersonalTrainer(SchedulePersonalTrainer schedulePersonalTrainer) {
        this.schedulePersonalTrainer = schedulePersonalTrainer;
    }
}
