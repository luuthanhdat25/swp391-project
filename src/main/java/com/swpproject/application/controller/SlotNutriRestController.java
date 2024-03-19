package com.swpproject.application.controller;

import com.swpproject.application.model.Nutrition;
import com.swpproject.application.model.SlotNutritionDetail;
import com.swpproject.application.repository.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/slot-nutrition")
public class SlotNutriRestController {

    @Autowired
    private NutritionRepository nutritionRepository;

    @Autowired
    private SlotNutriDetailRepository slotNutriDetailRepository;

    @GetMapping("")
    public ResponseEntity<List<SlotNutritionDetailDTO>> searchNutritions(@RequestParam String id) {
        // Loại bỏ 3 kí tự đầu
        String modifiedId = id.substring(3);

        List<SlotNutritionDetail> slotNutritionDetails =
                slotNutriDetailRepository.findAllBySlotNutrition_Id(Integer.parseInt(modifiedId));
        List<Nutrition> nutritionList = nutritionRepository.findAll();
        List<NutritionDTO> nutritionDTOS = new ArrayList<>();
        for (Nutrition nutrition : nutritionList){
            NutritionDTO nutritionDTO = new NutritionDTO(nutrition.getNutritionId(),nutrition.getName());
            nutritionDTOS.add(nutritionDTO);
        }
        List<SlotNutritionDetailDTO> slotNutritionDetailDTOS = new ArrayList<>();
        for (SlotNutritionDetail slotNutritionDetail : slotNutritionDetails) {
            SlotNutritionDetailDTO slotNutritionDetailDTO = new SlotNutritionDetailDTO();
            slotNutritionDetailDTO.setSlotId(Integer.parseInt(modifiedId));
            slotNutritionDetailDTO.setId(slotNutritionDetail.getId());
            slotNutritionDetailDTO.setAmount(slotNutritionDetail.getAmount());
            slotNutritionDetailDTO.setDescription(slotNutritionDetail.getSlotNutrition().getDescription());
            slotNutritionDetailDTO.setNutritionId(slotNutritionDetail.getNutrition().getNutritionId());
            slotNutritionDetailDTO.setNutritions(nutritionDTOS);
            slotNutritionDetailDTOS.add(slotNutritionDetailDTO);
        }
        return ResponseEntity.ok().body(slotNutritionDetailDTOS);
    }

}

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
class SlotNutritionDetailDTO {
    private Integer id;
    private Integer slotId;
    private List<NutritionDTO> nutritions;
    private int nutritionId;
    private int amount;
    private String description;
}

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
class NutritionDTO {
    private Integer id;
    private String name;
}
