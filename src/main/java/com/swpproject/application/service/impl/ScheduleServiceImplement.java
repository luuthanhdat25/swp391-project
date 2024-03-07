package com.swpproject.application.service.impl;

import com.swpproject.application.model.Schedule;
import com.swpproject.application.repository.ScheduleRepository;
import com.swpproject.application.service.ScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
@Service
public class ScheduleServiceImplement implements ScheduleService {

    @Autowired
    private ScheduleRepository scheduleRepository;

    @Override
    public List<Schedule> getSchedules() {
        return scheduleRepository.findAll();
    }

    @Override
    public Optional<Schedule> findScheduleById(Integer id) {
        return scheduleRepository.findScheduleById(id);
    }

    @Override
    public Optional<Schedule> findScheduleByGymerIdAndPTId(Integer gid, Integer ptId) {
        return scheduleRepository.findScheduleByGymer_GymerIdAndPersonalTrainer_Id(gid,ptId);
    }

    @Override
    public void save(Schedule schedule) {scheduleRepository.save(schedule);
    }
}
