package com.swpproject.application.controller.exercise;

import com.swpproject.application.dto.ExerciseDTOOut;
import com.swpproject.application.dto.NutritionDTOIn;
import com.swpproject.application.dto.NutritionDTOOut;
import com.swpproject.application.dto.RoleDTO;
import com.swpproject.application.enums.Role;
import com.swpproject.application.service.ExerciseService;
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
public class AdminExerciseController {

    @Autowired
    private ExerciseService exerciseService;

    @RequestMapping(value = "/manage-exercise", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getManageExerciseView(ModelMap model, HttpServletRequest request){
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        if(roleDTO == null) return "error";
        if(roleDTO.getRole() != Role.ADMIN) return "error";

        List<ExerciseDTOOut> exerciseDTOOutList = exerciseService.getExerciseDTOOutList(roleDTO);
        String exerciseDTOoutJson = JsonUtils.jsonConvert(exerciseDTOOutList);
        model.addAttribute("exerciseList", exerciseDTOoutJson);
        return "exercise/admin-home-manage-exercise";
    }

//    @RequestMapping(value = "/manage-nutrition/create", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
//    public String getCreateNutritionPage(HttpServletRequest request) {
//        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
//        if(roleDTO == null) return "error";
//        if(roleDTO.getRole() != Role.ADMIN) return "error";
//        return "nutrition/admin-home-nutrition-create";
//    }
//
//    @RequestMapping(value = "/manage-nutrition/create", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
//    public String createNutrition(@ModelAttribute NutritionDTOIn nutritionDTOIn, HttpServletRequest request)
//            throws IOException
//    {
//        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
//        nutritionService.create(nutritionDTOIn, roleDTO);
//        return "redirect:/admin-home/manage-nutrition";
//    }
}
