package com.swpproject.application.controller.nutrition;

import com.swpproject.application.dto.NutritionDTOIn;
import com.swpproject.application.dto.NutritionDTOOut;
import com.swpproject.application.dto.RoleDTO;
import com.swpproject.application.enums.Role;
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

import java.io.IOException;
import java.util.List;

@Controller
public class PersonalTrainerNutritionController {

    @Autowired
    private NutritionService nutritionService;

    @Autowired
    private PersonalTrainerService personalTrainerService;

    @RequestMapping(value = "/my-nutrition", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getManageNutritionView(ModelMap model, HttpServletRequest request){
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        if(roleDTO == null) return "error";
        if(roleDTO.getRole() != Role.PT) return "error";

        List<NutritionDTOOut> nutritionDTOOutList = nutritionService.getNutritionDTOOutList(roleDTO);
        String nutritionDTOOutListJson = JsonUtils.jsonConvert(nutritionDTOOutList);
        model.addAttribute("nutritionList", nutritionDTOOutListJson);

        boolean canCreate = canCreateUpdate(roleDTO);
        model.addAttribute("canCreate", canCreate);
        return "nutrition/pt-nutrition-list";
    }

    private boolean canCreateUpdate(RoleDTO roleDTO){
        if(roleDTO == null) return false;
        if(roleDTO.getRole() == Role.ADMIN) return true;

        if(roleDTO.getRole() != Role.PT) return false;
        PersonalTrainer personalTrainer = personalTrainerService.findPersonalTrainerByID(roleDTO.getId()).get();
        return  personalTrainer.getIsActive();
    }
}
