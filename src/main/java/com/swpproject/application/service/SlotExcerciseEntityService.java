package com.swpproject.application.service;


import com.swpproject.application.model.SlotExcerciseEntity;
import com.swpproject.application.repository.SlotExcerciseEntityRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SlotExcerciseEntityService {

    @Autowired
    private SlotExcerciseEntityRepository slotExcerciseEntityRepository;

    public List<SlotExcerciseEntity> getAllSlots() {
        return slotExcerciseEntityRepository.findAll();
    }
    public void SaveSlotExcercise(SlotExcerciseEntity slotExcerciseEntity){
        slotExcerciseEntityRepository.save(slotExcerciseEntity);
    }

}
