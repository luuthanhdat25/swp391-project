package com.swpproject.application.controller.nutrition;

import com.swpproject.application.dto.NutritionDTOOut;
import com.swpproject.application.dto.RoleDTO;
import com.swpproject.application.dto.SlotTrackingDto;
import com.swpproject.application.model.Nutrition;
import com.swpproject.application.model.SlotNutritionDetail;
import com.swpproject.application.service.NutritionService;
import com.swpproject.application.service.SlotNutriDetailService;
import com.swpproject.application.service.SlotNutritionService;
import com.swpproject.application.utils.DtoUtils;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.ArrayList;
import java.util.List;

@Controller
public class NutritionTrackingController {

    @Autowired
    private NutritionService nutritionService;

    @Autowired
    private SlotNutriDetailService slotNutriDetailService;

    @GetMapping("nutrition/tracking")
    public String showTracking(ModelMap model, HttpServletRequest request) {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        List<NutritionDTOOut> nutritionList = nutritionService.getNutritionDTOOutList(roleDTO);
        List<SlotTrackingDto> slotTrackingDtos = slotNutriDetailService .getSlotNutritionDetailsByGymerId(roleDTO.getId())
                                                                        .stream()
                                                                        .map(slot -> DtoUtils.convertSlotNutritionDetailToSlotTrackingDto(slot.getNutrition(),Float.valueOf(slot.getAmount())))
                                                                        .toList();
        model.addAttribute("slotTrackingDtos", slotTrackingDtos);
        model.addAttribute("nutritionList", nutritionList);
        return "nutrition/nutrition-tracking";
    }

    @PostMapping("nutrition/tracking")
    public ResponseEntity<List<SlotTrackingDto>> addFoodItem(@RequestBody SlotTrackingDto foodRequest, ModelMap model,
                                      HttpServletRequest request) {
        Float quantity = foodRequest.getAmount();
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        List<NutritionDTOOut> nutritionList = nutritionService.getNutritionDTOOutList(roleDTO);
        List<SlotTrackingDto> slotTrackingDtos = slotNutriDetailService .getSlotNutritionDetailsByGymerId(roleDTO.getId())
                                                                        .stream()
                                                                        .map(slot -> DtoUtils.convertSlotNutritionDetailToSlotTrackingDto(slot.getNutrition(),Float.valueOf(slot.getAmount())))
                                                                        .toList();
        model.addAttribute("nutritionList", nutritionList);

        Nutrition nutritionS = nutritionService .findNutritionById(nutritionList.stream()
                                                .filter(nutrition -> nutrition.getName().equals(foodRequest.getNutritionName()))
                                                .findFirst().get().getNutritionId(),roleDTO).get();
        SlotTrackingDto slotTrackingDto = DtoUtils.convertSlotNutritionDetailToSlotTrackingDto(nutritionS, quantity);
        List<SlotTrackingDto> mutableList = new ArrayList<>(slotTrackingDtos);
        mutableList.add(slotTrackingDto);
        model.addAttribute("slotTrackingDtos", mutableList);
        return ResponseEntity.ok(mutableList);
    }

}
