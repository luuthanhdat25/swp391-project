package com.swpproject.application.repository;

import com.swpproject.application.model.OrderRequest;
import com.swpproject.application.model.SlotExercise;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.data.jpa.repository.Modifying;

import java.sql.Date;
import java.util.List;

@Repository
public interface SlotExcerciseEntityRepository extends JpaRepository<SlotExercise, Long> {
    public List<SlotExercise> getSlotExcerciseBySchedule_IdAndWeekAndYear(Integer ScheduleId, int week, int year);

    public List<SlotExercise> findAllBySchedule_IdAndGymer_GymerIdAndIsPending(
            Integer schedulePersonalTrainerId,
            Integer gymeid,
            boolean isPending
    );

    @Query("SELECT se FROM SlotExercise se " +
            "WHERE se.orderRequest.orderId = :orderId " +
            "AND se.week = (SELECT MIN(se2.week) FROM SlotExercise se2 " +
            "WHERE se2.orderRequest.orderId = :orderId) " +
            "AND se.isPending = :isPending")
    List<SlotExercise> findAllByMinWeekAndConditions(
            Integer orderId,
            boolean isPending
    );
    @Transactional
    @Modifying
    @Query("UPDATE SlotExercise se SET se.isPending = :isPending WHERE se.id = :slotExerciseId")
    public void updateIsPending(Long slotExerciseId,
                         boolean isPending);

    @Query("SELECT se FROM SlotExercise se " +
            "WHERE se.orderRequest.datetime_end > :targetDate " +
            "AND se.isPending = :isPending")
    List<SlotExercise> findSlotsWithDateEndGreaterThanAndPending(
             Date targetDate,
             boolean isPending
    );


    public List<SlotExercise> getSlotExerciseByOrderRequest_OrderId(Integer orderRequestID);
}
