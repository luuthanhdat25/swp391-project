package com.swpproject.application.service;

import com.swpproject.application.model.ScheduleDataEntity;
import com.swpproject.application.repository.ScheduleDataRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScheduleDataService {
        @Autowired
        private ScheduleDataRepository scheduleDataRepository;



    public void saveOrUpdate(ScheduleDataEntity scheduleData) {
            scheduleDataRepository.save(scheduleData);
        }
    public List<ScheduleDataEntity> getSlotsByWeekAndYear(int week, int year) {
        return scheduleDataRepository.findByWeekAndYear(week, year);
    }
}
