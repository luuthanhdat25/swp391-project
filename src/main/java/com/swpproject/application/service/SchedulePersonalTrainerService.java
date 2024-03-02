package com.swpproject.application.service;

import com.swpproject.application.model.SchedulePersonalTrainer;
import com.swpproject.application.repository.SchedulePersonalTrainerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class SchedulePersonalTrainerService {
    @Autowired
    SchedulePersonalTrainerRepository personalTrainerRepository;

    public void save(SchedulePersonalTrainer schedulePersonalTrainerEntity){
        personalTrainerRepository.save(schedulePersonalTrainerEntity);
    }
    public SchedulePersonalTrainer findScheduleByPtId(Integer id){
        return personalTrainerRepository.findSchedulePersonalTrainerById(id);
    }
}
