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
    public void SaveSlotExcercise(List<String> checkedSlots){
        List<SlotExcerciseEntity> slotsToSave = new ArrayList<>();

        for (String slot : checkedSlots) {
            String[] parts = slot.split("-");

            if (parts.length == 3) {
                String day = parts[0];
                int startHour = Integer.parseInt(parts[1]);
                int endHour = Integer.parseInt(parts[2]);

                SlotExcerciseEntity slotEntity = new SlotExcerciseEntity();
                slotEntity.setDay(day);
                slotEntity.setStartHour(startHour);
                slotEntity.setEndHour(endHour);
                slotEntity.setIs_Pending(true); // Set your default value
                slotEntity.setAttendant_Status(""); // Set your default value

                slotsToSave.add(slotEntity);
            } else {
                // Log or handle the case where the expected number of parts is not found
                System.out.println("Invalid slot format: " + slot);
            }
        }


        slotExcerciseEntityRepository.saveAll(slotsToSave);
    }

}
