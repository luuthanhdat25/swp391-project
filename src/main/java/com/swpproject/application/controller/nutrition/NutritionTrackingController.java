package com.swpproject.application.controller.nutrition;

import com.swpproject.application.dto.NutritionDTOOut;
import com.swpproject.application.dto.RoleDTO;
import com.swpproject.application.model.SlotNutritionDetail;
import com.swpproject.application.service.NutritionService;
import com.swpproject.application.service.SlotNutriDetailService;
import com.swpproject.application.service.SlotNutritionService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

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
        List<SlotNutritionDetail> slotNutritionDetailList = slotNutriDetailService.getSlotNutritionDetailsByGymerId(roleDTO.getId());
        slotNutritionDetailList.forEach(System.out::println);
        model.addAttribute("nutritionList", nutritionList);
        return "nutrition/nutrition-tracking";
    }

}
