package com.swpproject.application.repository;

import com.swpproject.application.model.SlotNutrition;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Controller;

@Controller
public interface SlotNutritionRepository extends JpaRepository<SlotNutrition, Integer> {
    public void deleteById(Integer id);
}
