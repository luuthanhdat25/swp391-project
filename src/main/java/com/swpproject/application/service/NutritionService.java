package com.swpproject.application.service;

import com.swpproject.application.dto.NutritionDTOIn;
import com.swpproject.application.dto.NutritionDTOOut;
import com.swpproject.application.dto.RoleDTO;
import com.swpproject.application.model.Nutrition;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Service
public interface NutritionService {
    List<Nutrition> getNutritionListAuthentication(RoleDTO roleDTO);

    List<NutritionDTOOut> getNutritionDTOOutList(RoleDTO roleDTO);

    Optional<Nutrition> findNutritionById(int nutritionId, RoleDTO roleDTO);

    void create(NutritionDTOIn nutritionDTOIn, RoleDTO roleDTO) throws IOException;

    void update(NutritionDTOIn nutritionDTOIn, int nutritinoId) throws IOException;
}
