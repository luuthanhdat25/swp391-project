package com.swpproject.application.repository;

import com.swpproject.application.model.ScheduleDataEntity;
import org.springframework.data.jpa.repository.JpaRepository;


import java.util.List;


public interface ScheduleDataRepository extends JpaRepository<ScheduleDataEntity,Long> {
    List<ScheduleDataEntity> findByWeekAndYear(int week, int year);

}
