package com.swpproject.application.service;


import com.swpproject.application.model.SlotExcercise;
import com.swpproject.application.repository.SlotExcerciseEntityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SlotExcerciseEntityService {

    @Autowired
    private SlotExcerciseEntityRepository slotExcerciseEntityRepository;

    public List<SlotExcercise> getAllSlots() {
        return slotExcerciseEntityRepository.findAll();
    }
    public void SaveSlotExcercise(SlotExcercise slotExcerciseEntity){
        slotExcerciseEntityRepository.save(slotExcerciseEntity);
    }
    public List<SlotExcercise> getSlotByWeekYear(Long personalTrainerId,int week,int year){
        return slotExcerciseEntityRepository.getSlotExcerciseBySchedulePersonalTrainer_ScheduleIdAndWeekAndYear(personalTrainerId, week, year);
    }
    public List<SlotExcercise> getSlotExcercises( Integer schedulePersonalTrainerId,
                                                  Integer gymeid,
                                                  boolean isPending){
        return slotExcerciseEntityRepository.findAllBySchedulePersonalTrainer_ScheduleIdAndGymer_GymerIdAndIsPending(schedulePersonalTrainerId,gymeid,isPending);
    }

}
