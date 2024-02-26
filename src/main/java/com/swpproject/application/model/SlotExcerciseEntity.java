package com.swpproject.application.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import org.springframework.data.relational.core.mapping.Table;

@Entity
@Table(name = "SlotExcerciseEntity")
public class SlotExcerciseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String day;
    private int startHour;
    private int endHour;

    private boolean Is_Pending;

    private String Attendant_Status;

    public SlotExcerciseEntity(Long id, String day, int startHour, int endHour, boolean is_Pending, String attendant_Status) {
        this.id = id;
        this.day = day;
        this.startHour = startHour;
        this.endHour = endHour;
        Is_Pending = is_Pending;
        Attendant_Status = attendant_Status;
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
                '}';
    }
}
