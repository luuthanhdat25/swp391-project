package com.swpproject.application.controller.nutrition;

import com.swpproject.application.model.Nutrition;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.repository.PersonalTrainerRepository;
import com.swpproject.application.utils.JsonUtils;
import com.swpproject.application.repository.NutritionRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

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
        List<NutritionDTOOut> listOut = getNutritionDTOOutListFromNutritionList(list);

        String json = JsonUtils.jsonConvert(listOut);
        model.addAttribute("nutritionList", json);
        return "nutrition-list";
    }

    private List<NutritionDTOOut> getNutritionDTOOutListFromNutritionList(List<Nutrition> nutritionsList) {
        return nutritionsList.stream()
                .map(this::getNutritionDTOOutbyNutrition)
                .collect(Collectors.toList());
    }

    private NutritionDTOOut getNutritionDTOOutbyNutrition(Nutrition nutrition){
        NutritionDTOOut nutritionDTOOut = new NutritionDTOOut();
        nutritionDTOOut.setNutritionId(nutrition.getNutritionId());
        nutritionDTOOut.setName(nutrition.getName());
        nutritionDTOOut.setCaloIn(nutrition.getCaloIn());
        nutritionDTOOut.setProtein(nutrition.getProtein());
        nutritionDTOOut.setFat(nutrition.getFat());
        nutritionDTOOut.setCarb(nutrition.getCarb());
        nutritionDTOOut.setImageDescription(nutrition.getImageDescription());
        nutritionDTOOut.setIsPrivate(nutrition.getIsPrivate() + "");
        nutritionDTOOut.setPersonalTrainerId(nutrition.getPersonalTrainer().getId());
        nutritionDTOOut.setPersonalTrainerImage(nutrition.getPersonalTrainer().getAccount().getAvatarImage());
        return nutritionDTOOut;
    }


    //Get view create nutrition
    @RequestMapping(value = "/create", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getCreateNutritionPage() {
        return "nutrition-create";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    public String createExercise(@ModelAttribute NutritionDTOIn nutritionDTO, Model model) throws IOException {
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

    //Get update view nutrition
    @RequestMapping(value = "/details/edit", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getNutritionDetailsEditPage(@RequestParam int id, HttpServletRequest request, ModelMap model) {
        HttpSession session = request.getSession();
        session.setAttribute("nutritionId", id);

        Nutrition nutrition = nutritionRepository.findById(id).get();
        NutritionDTOOut nutritionDTOOut = getNutritionDTOOutbyNutrition(nutrition);

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
            Nutrition nutrition = nutritionRepository.findById(id).get();
            nutrition.setName(nutritionDTOIn.getNutritionName());
            nutrition.setCaloIn(nutritionDTOIn.getCalories());
            nutrition.setProtein(nutritionDTOIn.getProtein());
            nutrition.setFat(nutritionDTOIn.getFat());
            nutrition.setCarb(nutritionDTOIn.getCarb());
            System.out.println(nutrition.getPersonalTrainer().getId());
            if(nutritionDTOIn.getImage().getBytes().length != 0) nutrition.setImageDescription(nutritionDTOIn.getImage().getBytes());
            nutritionRepository.save(nutrition);

            session.removeAttribute("exerciseId");
            return "redirect:/nutrition/";
        } else {
            return "redirect:/error";
        }
    }
}

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
class NutritionDTOIn {
    private String nutritionName;
    private Float calories;
    private Float protein;
    private Float fat;
    private Float carb;
    private MultipartFile image;
    private String isPrivate;
}


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
class NutritionDTOOut {
    private int nutritionId;
    private String name;
    private Float caloIn;
    private Float protein;
    private Float fat;
    private Float carb;
    private byte[] imageDescription;
    private String isPrivate;
    private int personalTrainerId;
    private byte[] personalTrainerImage;
}