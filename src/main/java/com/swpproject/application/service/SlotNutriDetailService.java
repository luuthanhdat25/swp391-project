package com.swpproject.application.service;

import com.swpproject.application.model.SlotExerciseDetail;
import com.swpproject.application.model.SlotNutritionDetail;
import com.swpproject.application.repository.SlotExeDetailRepository;
import com.swpproject.application.repository.SlotNutriDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SlotNutriDetailService {
    @Autowired
    private SlotNutriDetailRepository slotNutriDetailRepository;

    public void save(SlotNutritionDetail slotNutritionDetail){
        slotNutriDetailRepository.save(slotNutritionDetail);
    }
}
