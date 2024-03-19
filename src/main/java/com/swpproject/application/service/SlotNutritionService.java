package com.swpproject.application.service;

import com.swpproject.application.repository.SlotNutritionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SlotNutritionService {
    @Autowired
    private SlotNutritionRepository slotNutritionRepository;

    public void deleteById(Integer id){
        slotNutritionRepository.deleteById(id);
    }
}
