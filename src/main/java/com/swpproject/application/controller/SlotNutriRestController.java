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
        List<SlotNutritionDetailDTO> slotNutritionDetailDTOS = new ArrayList<>();

        for (SlotNutritionDetail slotNutritionDetail : slotNutritionDetails) {
            SlotNutritionDetailDTO slotNutritionDetailDTO = new SlotNutritionDetailDTO();
            slotNutritionDetailDTO.setId(slotNutritionDetail.getId());
            slotNutritionDetailDTO.setAmount(slotNutritionDetail.getAmount());
            slotNutritionDetailDTO.setDescription(slotNutritionDetail.getSlotNutrition().getDescription());
            slotNutritionDetailDTO.setNutriId(slotNutritionDetail.getNutrition().getNutritionId());
            slotNutritionDetailDTO.setNutritionList(nutritionList);
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
    private List<Nutrition> nutritionList;
    private int nutriId;
    private int amount;
    private String description;
}
