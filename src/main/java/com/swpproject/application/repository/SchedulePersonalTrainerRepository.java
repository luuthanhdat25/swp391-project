package com.swpproject.application.repository;

import com.swpproject.application.model.ScheduleDataEntity;
import com.swpproject.application.model.SchedulePersonalTrainerEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SchedulePersonalTrainerRepository extends JpaRepository<SchedulePersonalTrainerEntity,Long> {
}
