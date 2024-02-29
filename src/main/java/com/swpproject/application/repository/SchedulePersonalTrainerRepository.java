package com.swpproject.application.repository;

import com.swpproject.application.model.SchedulePersonalTrainer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SchedulePersonalTrainerRepository extends JpaRepository<SchedulePersonalTrainer,Long> {

    // TODO: đặt lại tên hàm --> findAllSchedulesByPTId
    public SchedulePersonalTrainer findAllByPersonalTrainer_Id(Integer id);
}
