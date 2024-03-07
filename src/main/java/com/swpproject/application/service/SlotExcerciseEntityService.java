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
    public List<SlotExercise> getSlotByWeekYear(Integer personalTrainerId,int week,int year){
        return slotExcerciseEntityRepository.getSlotExcerciseBySchedule_IdAndWeekAndYear(personalTrainerId, week, year);
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
    public void updateSlotOrderPending(Long slotExerciseId,
                                       boolean isPending){
        slotExcerciseEntityRepository.updateIsPending(slotExerciseId,isPending);
    }
    public List<SlotExercise> getSlotGreater (Date targetDate,boolean isPending){
        return slotExcerciseEntityRepository.findSlotsWithDateEndGreaterThanAndPending(targetDate,isPending);
    }
    public List<SlotExercise> getSlotByOrder(Integer orderRequest){
        return slotExcerciseEntityRepository.getSlotExerciseByOrderRequest_OrderId(orderRequest);
    }
}
