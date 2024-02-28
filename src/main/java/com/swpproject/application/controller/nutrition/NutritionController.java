package com.swpproject.application.controller.nutrition;

import com.swpproject.application.model.Nutrition;
import com.swpproject.application.utils.JsonUtils;
import com.swpproject.application.repository.NutritionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/nutrition")
public class NutritionController {

    @Autowired
    private NutritionRepository nutritionRepository;

    @RequestMapping(value = "/", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getExerciseListPage(ModelMap model) {
        List<Nutrition> list = nutritionRepository.findAll();
        String json = JsonUtils.jsonConvert(list);
        model.addAttribute("nutritionList", json);
        return "nutrition-list";
    }
}
