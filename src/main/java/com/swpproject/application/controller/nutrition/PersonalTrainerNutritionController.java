package com.swpproject.application.controller.nutrition;

import com.swpproject.application.dto.ExerciseDTOOut;
import com.swpproject.application.dto.NutritionDTOIn;
import com.swpproject.application.dto.NutritionDTOOut;
import com.swpproject.application.dto.RoleDTO;
import com.swpproject.application.enums.Role;
import com.swpproject.application.model.Nutrition;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.service.NutritionService;
import com.swpproject.application.service.PersonalTrainerService;
import com.swpproject.application.utils.JsonUtils;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class PersonalTrainerNutritionController {

    @Autowired
    private NutritionService nutritionService;

    @Autowired
    private PersonalTrainerService personalTrainerService;

    @RequestMapping(value = "/my-nutrition", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getManageNutritionView(
            ModelMap model,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes
    ){
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        if(roleDTO == null) return "error";
        if(roleDTO.getRole() != Role.PT) return "error";

        List<NutritionDTOOut> nutritionDTOOutList = nutritionService.getNutritionDTOOutList(roleDTO);
        List<NutritionDTOOut> myNutritionList = getMyNutrition(roleDTO.getId(), nutritionDTOOutList);

        String myNutritionJson = JsonUtils.jsonConvert(myNutritionList);
        model.addAttribute("nutritionList", myNutritionJson);

        boolean canCreate = canCreateUpdate(roleDTO);
        model.addAttribute("canCreate", canCreate);

        String toastDTOObject = (String) redirectAttributes.getFlashAttributes().get("toastDTO");
        if (toastDTOObject != null && !toastDTOObject.isEmpty()) {
            model.addAttribute("toastDTO", toastDTOObject);
        }
        return "nutrition/pt-nutrition-list";
    }

    private List<NutritionDTOOut> getMyNutrition(int id, List<NutritionDTOOut> nutritionDTOOutList){
        return nutritionDTOOutList.stream()
                .filter(nutrition -> nutrition.getPersonalTrainerId() == id)
                .collect(Collectors.toList());
    }

    private boolean canCreateUpdate(RoleDTO roleDTO){
        if(roleDTO == null) return false;
        if(roleDTO.getRole() == Role.ADMIN) return true;

        if(roleDTO.getRole() != Role.PT) return false;
        PersonalTrainer personalTrainer = personalTrainerService.findPersonalTrainerByID(roleDTO.getId()).get();
        return  personalTrainer.getIsActive();
    }
}
