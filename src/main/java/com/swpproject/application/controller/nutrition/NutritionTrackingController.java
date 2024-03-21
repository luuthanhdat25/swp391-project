//package com.swpproject.application.controller.nutrition;
//
//import com.swpproject.application.dto.NutritionDTOOut;
//import com.swpproject.application.dto.RoleDTO;
//import com.swpproject.application.enums.Role;
//import com.swpproject.application.model.Nutrition;
//import com.swpproject.application.model.SlotNutrition;
//import com.swpproject.application.service.NutritionService;
//import com.swpproject.application.service.SlotNutritionService;
//import jakarta.servlet.http.HttpServletRequest;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.bind.annotation.GetMapping;
//
//import java.util.List;
//
//@Controller
//public class NutritionTrackingController {
//
//    @Autowired
//    private NutritionService nutritionService;
//
//    @Autowired
//    private SlotNutritionService slotNutritionService;
//
//    @GetMapping("nutrition/tracking")
//    public String showTracking(ModelMap model, HttpServletRequest request) {
//        slotNutritionService.
//        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
//        List<NutritionDTOOut> nutritionList = nutritionService.getNutritionDTOOutList(roleDTO);
//        model.addAttribute("nutritionList", nutritionList);
//        return "nutrition/nutrition-tracking";
//    }
//
//}
