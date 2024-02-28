package com.swpproject.application.service;

import com.swpproject.application.model.SchedulePersonalTrainerEntity;
import com.swpproject.application.repository.SchedulePersonalTrainerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class SchedulePersonalTrainerService {
    @Autowired
    SchedulePersonalTrainerRepository personalTrainerRepository;

    public void save(SchedulePersonalTrainerEntity schedulePersonalTrainerEntity){
        personalTrainerRepository.save(schedulePersonalTrainerEntity);
    }
    public SchedulePersonalTrainerEntity findScheduleByPTId(Integer id){
        return personalTrainerRepository.findAllByPersonalTrainerPtId(id);
    }
}
