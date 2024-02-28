package com.swpproject.application.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import org.springframework.data.relational.core.mapping.Table;

@Entity
@Table(name = "schedule_data_entity")
public class ScheduleDataEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private int slot;
    private int day;
    private int week;
    private int year;

    public ScheduleDataEntity() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getSlot() {
        return slot;
    }

    public void setSlot(int slot) {
        this.slot = slot;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
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

    public ScheduleDataEntity(Long id, int slot, int day, int week, int year) {
        this.id = id;
        this.slot = slot;
        this.day = day;
        this.week = week;
        this.year = year;
    }

    @Override
    public String toString() {
        return "ScheduleDataEntity{" +
                "id=" + id +
                ", slot=" + slot +
                ", day=" + day +
                ", week=" + week +
                ", year=" + year +
                '}';
    }
}
