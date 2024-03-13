package com.swpproject.application.service;

import com.swpproject.application.model.Nutrition;
import com.swpproject.application.dto.NutritionDTOIn;
import com.swpproject.application.dto.NutritionDTOOut;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Service
public interface NutritionService {
    @Transactional
    List<Nutrition> getNutritionList();

    @Transactional
    List<NutritionDTOOut> getNutritionDTOOutList();

    @Transactional
    Optional<Nutrition> findNutritionById(int id);

    @Transactional
    void create(NutritionDTOIn nutrition) throws IOException;

    @Transactional
    void update(NutritionDTOIn nutrition, int nutritionId) throws IOException;
}
