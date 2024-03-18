package com.swpproject.application.controller.nutrition;

import com.swpproject.application.dto.NutritionDTOOut;
import com.swpproject.application.dto.RoleDTO;
import com.swpproject.application.service.NutritionService;
import com.swpproject.application.utils.JsonUtils;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/admin-home")
public class AdminNutritionController {

    @Autowired
    private NutritionService nutritionService;


    @RequestMapping(value = "/manage-nutrition", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getManageNutritionView(ModelMap model, HttpServletRequest request){
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        List<NutritionDTOOut> nutritionDTOOutList = nutritionService.getNutritionDTOOutList(roleDTO);
        String nutritionDTOOutListJson = JsonUtils.jsonConvert(nutritionDTOOutList);
        model.addAttribute("nutritionList", nutritionDTOOutListJson);
        return "nutrition/admin-home-manage-nutrition";
    }
}
