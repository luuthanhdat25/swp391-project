package com.swpproject.application.service;


import com.swpproject.application.model.Schedule;
import com.swpproject.application.repository.ScheduleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class SchedulePersonalTrainerService {
    @Autowired
    ScheduleRepository scheduleRepository;

    public void save(Schedule schedulePersonalTrainerEntity){
        scheduleRepository.save(schedulePersonalTrainerEntity);
    }
    public Schedule findScheduleByPtId(Integer id){
        return scheduleRepository.findAllByPersonalTrainer_Id(id);
    }
}
