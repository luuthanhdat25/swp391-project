package com.swpproject.application.service;

import com.swpproject.application.model.SlotExerciseDetail;
import com.swpproject.application.model.SlotNutritionDetail;
import com.swpproject.application.repository.SlotExeDetailRepository;
import com.swpproject.application.repository.SlotNutriDetailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.relational.core.sql.In;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class SlotNutriDetailService {
    @Autowired
    private SlotNutriDetailRepository slotNutriDetailRepository;

    public void save(SlotNutritionDetail slotNutritionDetail){
        slotNutriDetailRepository.save(slotNutritionDetail);
    }

    public Optional<SlotNutritionDetail> findById(Integer id){
        return slotNutriDetailRepository.findSlotNutritionDetailById(id);
    }

    public void deleteAllBySlotNutrition_Id(Integer id){
        slotNutriDetailRepository.deleteAllBySlotNutrition_Id(id);
    }
}
