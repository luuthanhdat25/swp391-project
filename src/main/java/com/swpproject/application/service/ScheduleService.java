package com.swpproject.application.service;

import com.swpproject.application.model.Account;
import com.swpproject.application.model.Schedule;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public interface ScheduleService {
    List<Schedule> getSchedules();

    Optional<Schedule> findScheduleById(Integer id);

    Optional<Schedule> findScheduleByGymerIdAndPTId(Integer gid,Integer ptId);

    void save(Schedule schedule);
}
