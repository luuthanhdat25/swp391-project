package com.swpproject.application.repository;

import com.swpproject.application.model.SlotNutritionDetail;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SlotNutriDetailRepository extends JpaRepository<SlotNutritionDetail,Integer> {
    public List<SlotNutritionDetail> findAllBySlotNutrition_Id(Integer id);
}
