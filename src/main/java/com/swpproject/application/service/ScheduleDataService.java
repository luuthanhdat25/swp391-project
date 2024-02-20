package com.swpproject.application.service;

import com.swpproject.application.model.ScheduleDataEntity;
import com.swpproject.application.repository.ScheduleDataRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ScheduleDataService {

    @Autowired
    private ScheduleDataRepository repository;
    public  void saveOrUpdate(ScheduleDataEntity entity){
        repository.save(entity);
    }
}
