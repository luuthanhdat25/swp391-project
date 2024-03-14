package com.swpproject.application.service;


import com.swpproject.application.model.OrderRequest;
import com.swpproject.application.model.SlotExercise;
import com.swpproject.application.repository.SlotExcerciseEntityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.List;

@Service
public class SlotExcerciseEntityService {

    @Autowired
    private SlotExcerciseEntityRepository slotExcerciseEntityRepository;

    public List<SlotExercise> getAllSlots() {
        return slotExcerciseEntityRepository.findAll();
    }
    public void SaveSlotExcercise(SlotExercise slotExerciseEntity){
        slotExcerciseEntityRepository.save(slotExerciseEntity);
    }
    public List<SlotExercise> getSlotNotPending(Integer personalTrainerId, boolean pending){
        return slotExcerciseEntityRepository.getSlotExcerciseByPersonalTrainer_IdAndIsPending(personalTrainerId, pending);
    }
    public List<SlotExercise> getSlotExcercises( Integer schedulePersonalTrainerId,
                                                  Integer gymeid,
                                                  boolean isPending){
        return slotExcerciseEntityRepository.findAllBySchedule_IdAndGymer_GymerIdAndIsPending(schedulePersonalTrainerId,gymeid,isPending);
    }

    public List<SlotExercise> findSlotOrder(Integer orderId,
                                            boolean isPending
                                            ){
        return slotExcerciseEntityRepository.findAllByMinWeekAndConditions(orderId,isPending);
    }
    public void updateSlotOrderPending(Integer slotExerciseId,
                                       boolean isPending){
        slotExcerciseEntityRepository.updateIsPending(slotExerciseId,isPending);
    }
    public List<SlotExercise> getSlotGreater (Date targetDate,boolean isPending){
        return slotExcerciseEntityRepository.findSlotsWithDateEndGreaterThanAndPending(targetDate,isPending);
    }
    public List<SlotExercise> getSlotByOrder(Integer orderRequest){
        return slotExcerciseEntityRepository.getSlotExerciseByOrderRequest_OrderId(orderRequest);
    }
    public List<SlotExercise> getTrainingPTSlot(Integer gymerID,
                                                Integer week,
                                                Integer year,
                                                boolean isPending){
        return slotExcerciseEntityRepository.getSlotExerciseByGymer_GymerIdAndWeekAndYearAndIsPendingAndPersonalTrainerIsNotNull(gymerID,week,year,isPending);
    }

    public void deleteSlot(Integer orderID){
        slotExcerciseEntityRepository.deleteAllByOrderRequest_OrderId(orderID);
    };
    public List<SlotExercise> getAllSlotByWeek(int week, int year){
        return slotExcerciseEntityRepository.findByWeekAndAndYear(week,year);
    }

    public SlotExercise getTop1SlotExerciseByOrderID(Integer orderId){
        return slotExcerciseEntityRepository.findTopByOrderRequest_OrderId(orderId);
    }
    public List<SlotExercise> getAllSlotNotExcepOrder(int week,int year,OrderRequest orderRequest){
        return slotExcerciseEntityRepository.findByWeekAndAndYearAndOrderRequestIsNot(week,year,orderRequest);
    }
}
