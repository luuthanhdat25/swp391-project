package com.swpproject.application.model;


import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Table;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;

@Entity
@Table(name = "ScheduleData")
public class ScheduleDataEntity {

    @jakarta.persistence.Id
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column
    private Integer slot;

    @Column
    private Integer day;

    @Column
    private Boolean checked;

    public ScheduleDataEntity() {

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public ScheduleDataEntity(Integer id, Integer slot, Boolean checked) {
        this.id = id;
        this.slot = slot;
        this.day = day;
        this.checked = checked;
    }


}
