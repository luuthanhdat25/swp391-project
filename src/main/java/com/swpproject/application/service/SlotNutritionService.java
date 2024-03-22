package com.swpproject.application.service;

import com.swpproject.application.model.SlotNutrition;
import com.swpproject.application.repository.SlotNutritionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class SlotNutritionService {
    @Autowired
    private SlotNutritionRepository slotNutritionRepository;

    public void deleteById(Integer id){
        slotNutritionRepository.deleteById(id);
    }

//    public Optional<SlotNutrition> getSlotNutrition
}
