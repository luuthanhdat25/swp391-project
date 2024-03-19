package com.swpproject.application.controller.nutrition;

import com.swpproject.application.dto.NutritionDTOIn;
import com.swpproject.application.dto.NutritionDTOOut;
import com.swpproject.application.dto.RoleDTO;
import com.swpproject.application.enums.Role;
import com.swpproject.application.service.NutritionService;
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
@RequestMapping("/admin-home")
public class AdminNutritionController {

    @Autowired
    private NutritionService nutritionService;


    @RequestMapping(value = "/manage-nutrition", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getManageNutritionView(ModelMap model, HttpServletRequest request){
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        if(roleDTO == null) return "error";
        if(roleDTO.getRole() != Role.ADMIN) return "error";

        List<NutritionDTOOut> nutritionDTOOutList = nutritionService.getNutritionDTOOutList(roleDTO);
        String nutritionDTOOutListJson = JsonUtils.jsonConvert(nutritionDTOOutList);
        model.addAttribute("nutritionList", nutritionDTOOutListJson);
        return "nutrition/admin-home-manage-nutrition";
    }

    @RequestMapping(value = "/manage-nutrition/create", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getCreateNutritionPage(HttpServletRequest request) {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        if(roleDTO == null) return "error";
        if(roleDTO.getRole() != Role.ADMIN) return "error";
        return "nutrition/admin-home-nutrition-create";
    }

    @RequestMapping(value = "/manage-nutrition/create", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    public String createNutrition(@ModelAttribute NutritionDTOIn nutritionDTOIn, HttpServletRequest request)
            throws IOException
    {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        nutritionService.create(nutritionDTOIn, roleDTO);
        return "redirect:/admin-home/manage-nutrition";
    }
}
