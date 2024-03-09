package com.swpproject.application.controller.nutrition;

import com.swpproject.application.model.Nutrition;
import com.swpproject.application.model.NutritionDTOIn;
import com.swpproject.application.model.NutritionDTOOut;
import com.swpproject.application.service.NutritionService;
import com.swpproject.application.service.impl.NutritionServiceIml;
import com.swpproject.application.utils.JsonUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/nutrition")
public class NutritionController {

    @Autowired
    private NutritionService nutritionService;

    @RequestMapping(value = "/", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getExerciseListPage(ModelMap model) {
        List<NutritionDTOOut> nutritionDTOOutList = nutritionService.getNutritionDTOOutList();
        String nutritionDTOOutListJson = JsonUtils.jsonConvert(nutritionDTOOutList);
        model.addAttribute("nutritionList", nutritionDTOOutListJson);
        return "nutrition-list";
    }

    //Get view create nutrition
    @RequestMapping(value = "/create", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getCreateNutritionPage() {
        return "nutrition-create";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    public String createExercise(@ModelAttribute NutritionDTOIn nutritionDTOIn, Model model) throws IOException {
        nutritionService.create(nutritionDTOIn);
        return "redirect:/nutrition/";
    }

    //Get update view nutrition
    @RequestMapping(value = "/details/edit", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getNutritionDetailsEditPage(@RequestParam int id, HttpServletRequest request, ModelMap model) {
        HttpSession session = request.getSession();
        session.setAttribute("nutritionId", id);

        Nutrition nutrition = nutritionService.findNutritionById(id).get();
        NutritionDTOOut nutritionDTOOut = nutrition.getNutritionDTOOut();

        String json = JsonUtils.jsonConvert(nutritionDTOOut);
        model.addAttribute("nutrition", json);
        return "nutrition-update";
    }

    //Post update nutrition data
    @RequestMapping(value = "/details/edit", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    public String editNutrition(@ModelAttribute NutritionDTOIn nutritionDTOIn, HttpServletRequest request, Model model) throws IOException {
        HttpSession session = request.getSession();
        Integer id = (Integer) session.getAttribute("nutritionId");

        if (id != null) {
            nutritionService.update(nutritionDTOIn, id);
            session.removeAttribute("exerciseId");
            return "redirect:/nutrition/";
        } else {
            return "redirect:/error";
        }
    }
}




