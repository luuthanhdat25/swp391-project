package com.swpproject.application.service;

import com.swpproject.application.model.SlotExerciseDetail;
import com.swpproject.application.repository.SlotExeDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SlotExeDetailService {
    @Autowired
    private SlotExeDetailRepository slotExeDetailRepository;

    public void save(SlotExerciseDetail slotExerciseDetail){
        slotExeDetailRepository.save(slotExerciseDetail);
    }
}
