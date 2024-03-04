package com.swpproject.application.repository;

import com.swpproject.application.model.SlotExcercise;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SlotExcerciseEntityRepository extends JpaRepository<SlotExcercise,Long> {
    public List<SlotExcercise> getSlotExcerciseBySchedulePersonalTrainer_ScheduleIdAndWeekAndYear(Long ScheduleId,int week,int year);
    public List<SlotExcercise> findAllBySchedulePersonalTrainer_ScheduleIdAndGymer_GymerIdAndIsPending(
            Integer schedulePersonalTrainerId,
            Integer gymeid,
            boolean isPending
    );


}
