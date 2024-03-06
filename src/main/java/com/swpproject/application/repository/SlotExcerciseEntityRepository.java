package com.swpproject.application.repository;

import com.swpproject.application.model.SlotExercise;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SlotExcerciseEntityRepository extends JpaRepository<SlotExercise,Long> {
    public List<SlotExercise> getSlotExcerciseBySchedule_IdAndWeekAndYear(Long ScheduleId,int week,int year);
    public List<SlotExercise> findAllBySchedule_IdAndGymer_GymerIdAndIsPending(
            Integer schedulePersonalTrainerId,
            Integer gymeid,
            boolean isPending
    );


}
