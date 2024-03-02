package com.swpproject.application.repository;

import com.swpproject.application.model.SchedulePersonalTrainer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SchedulePersonalTrainerRepository extends JpaRepository<SchedulePersonalTrainer,Integer> {
    public SchedulePersonalTrainer findSchedulePersonalTrainerById(Integer id);
}
