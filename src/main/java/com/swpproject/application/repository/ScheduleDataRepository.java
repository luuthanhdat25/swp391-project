package com.swpproject.application.repository;

import com.swpproject.application.model.ScheduleDataEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ScheduleDataRepository extends JpaRepository<ScheduleDataEntity,Integer> {
    Optional<ScheduleDataEntity> findBySlotAndDay(Integer slot, Integer day);
}
