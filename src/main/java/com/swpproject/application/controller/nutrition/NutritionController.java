package com.swpproject.application.controller.nutrition;

    import com.swpproject.application.model.Exercise;
import com.swpproject.application.model.Nutrition;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.repository.PersonalTrainerRepository;
import com.swpproject.application.utils.JsonUtils;
import com.swpproject.application.repository.NutritionRepository;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/nutrition")
public class NutritionController {
    private final PersonalTrainerRepository personalTrainerRepository;
    private final NutritionRepository nutritionRepository;

    public NutritionController(PersonalTrainerRepository personalTrainerRepository, NutritionRepository nutritionRepository) {
        this.personalTrainerRepository = personalTrainerRepository;
        this.nutritionRepository = nutritionRepository;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getExerciseListPage(ModelMap model) {
        List<Nutrition> list = nutritionRepository.findAll();
        String json = JsonUtils.jsonConvert(list);
        System.out.println(json);
        model.addAttribute("nutritionList", json);
        return "nutrition-list";
    }

    //Get view create nutrition
    @RequestMapping(value = "/create", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getCreateNutritionPage() {
        return "nutrition-create";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    public String createExercise(@ModelAttribute NutritionDTO nutritionDTO, Model model) throws IOException {
        Nutrition nutrition = new Nutrition();
        nutrition.setName(nutritionDTO.getNutritionName());
        nutrition.setCaloIn(nutritionDTO.getCalories());
        nutrition.setProtein(nutritionDTO.getProtein());
        nutrition.setFat(nutritionDTO.getFat());
        nutrition.setCarb(nutritionDTO.getCarb());
        nutrition.setImageDescription(nutritionDTO.getImage().getBytes());

        String isPrivateString = nutritionDTO.getIsPrivate();
        int isPrivateBoolean = isPrivateString == null ? 0 : 1;
        nutrition.setIsPrivate(isPrivateBoolean);

        PersonalTrainer personalTrainerExample = personalTrainerRepository.findAll().getFirst();
        nutrition.setPersonalTrainer(personalTrainerExample);

        nutritionRepository.save(nutrition);
        return "redirect:/nutrition/";
    }
}

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
class NutritionDTO {
    private String nutritionName;
    private Float calories;
    private Float protein;
    private Float fat;
    private Float carb;
    private MultipartFile image;
    private String isPrivate;
}