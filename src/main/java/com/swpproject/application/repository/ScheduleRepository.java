package com.swpproject.application.repository;

import com.swpproject.application.model.Account;
import com.swpproject.application.model.Schedule;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ScheduleRepository extends JpaRepository<Schedule, Integer> {
    Optional<Schedule> findScheduleById(Integer id);

    Optional<Schedule> findScheduleByGymer_GymerIdAndPersonalTrainer_Id(Integer pid, Integer ptId);

    public Schedule findAllByPersonalTrainer_Id(Integer id);

}
