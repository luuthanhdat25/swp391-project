package com.swpproject.application.repository;

import com.swpproject.application.model.SlotNutritionDetail;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface SlotNutriDetailRepository extends JpaRepository<SlotNutritionDetail,Integer> {
    public List<SlotNutritionDetail> findAllBySlotNutrition_Id(Integer id);

    public Optional<SlotNutritionDetail> findSlotNutritionDetailById(Integer id);

    public void deleteAllBySlotNutrition_Id(Integer id);
}
