package com.swpproject.application.controller.nutrition;

import com.swpproject.application.dto.RoleDTO;
import com.swpproject.application.dto.ToastResponseDTO;
import com.swpproject.application.enums.Role;
import com.swpproject.application.model.Nutrition;
import com.swpproject.application.dto.NutritionDTOIn;
import com.swpproject.application.dto.NutritionDTOOut;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.service.NutritionService;
import com.swpproject.application.service.PersonalTrainerService;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/nutrition")
public class NutritionController {

    @Autowired
    private NutritionService nutritionService;

    @Autowired
    private PersonalTrainerService personalTrainerService;

    @Autowired
    private PersonalTrainerNutritionController personalTrainerNutritionController;

    private static final String NUTRITION_LIST_URL = "nutrition/nutrition-list";
    private static final String NUTRITION_CREATE_URL = "nutrition/nutrition-create";
    private static final String NUTRITION_UPDATE_URL = "nutrition/nutrition-update";
    private static final String ERROR_URL = "error";


    //Get view nutrition list
    @RequestMapping(value = "", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getNutritionListPage(
            ModelMap model,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes
    ) {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        List<NutritionDTOOut> nutritionDTOOutList = nutritionService.getNutritionDTOOutList(roleDTO);

        String nutritionDTOOutListJson = JsonUtils.jsonConvert(nutritionDTOOutList);
        model.addAttribute("nutritionList", nutritionDTOOutListJson);

        boolean canCreate = canCreateUpdate(roleDTO);
        model.addAttribute("canCreate", canCreate);
        if(canCreate && roleDTO.getRole() == Role.PT){
            model.addAttribute("personalTrainerId", roleDTO.getId());
        }

        return NUTRITION_LIST_URL;
    }


    //Get view create nutrition
    @RequestMapping(value = "/create", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getCreateNutritionPage(HttpServletRequest request) {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        if(!canCreateUpdate(roleDTO)) return ERROR_URL;

        return NUTRITION_CREATE_URL;
    }

    private boolean canCreateUpdate(RoleDTO roleDTO){
        if(roleDTO == null) return false;
        if(roleDTO.getRole() == Role.ADMIN) return true;

        if(roleDTO.getRole() != Role.PT) return false;
        PersonalTrainer personalTrainer = personalTrainerService.findPersonalTrainerByID(roleDTO.getId()).get();
        return  personalTrainer.getIsActive();
    }


    //Post create nutrition data
    @RequestMapping(value = "/create", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    public String createNutrition(
            @ModelAttribute NutritionDTOIn nutritionDTOIn,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes
    )
            throws IOException
    {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        if(!canCreateUpdate(roleDTO)) return ERROR_URL;

        nutritionService.create(nutritionDTOIn, roleDTO);
        ToastResponseDTO toastResponseDTO = new  ToastResponseDTO(1, "Success", "Create Nutrition successfully!");
        String toastDTOJson = JsonUtils.jsonConvert(toastResponseDTO);
        redirectAttributes.addFlashAttribute("toastDTO", toastDTOJson);
        return "redirect:/my-nutrition";
    }


    //Get update view nutrition
    @RequestMapping(value = "/details/edit", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getNutritionDetailsEditPage(@RequestParam int id, HttpServletRequest request, ModelMap model) {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        if(!canCreateUpdate(roleDTO)) {
            return ERROR_URL;
        }

        Optional<Nutrition> nutritionOptional = nutritionService.findNutritionById(id, roleDTO);
        if(nutritionOptional.isEmpty()) {
            return ERROR_URL;
        }

        HttpSession session = request.getSession();
        session.setAttribute("nutritionId", id);

        NutritionDTOOut nutritionDTOOut = nutritionOptional.get().getNutritionDTOOut();
        String json = JsonUtils.jsonConvert(nutritionDTOOut);
        model.addAttribute("nutrition", json);
        return NUTRITION_UPDATE_URL;
    }


    //Post update nutrition data
    @RequestMapping(value = "/details/edit", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    public String editNutrition(
            @ModelAttribute NutritionDTOIn nutritionDTOIn,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes)
            throws IOException
    {
        HttpSession session = request.getSession();
        Integer nutritionId = (Integer) session.getAttribute("nutritionId");
        if(nutritionId == null) return ERROR_URL;

        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        if(!canCreateUpdate(roleDTO)) return ERROR_URL;

        session.removeAttribute("nutritionId");
        nutritionService.update(nutritionDTOIn, nutritionId);

        ToastResponseDTO toastResponseDTO = new  ToastResponseDTO(1, "Success", "Update Nutrition successfully!");
        String toastDTOJson = JsonUtils.jsonConvert(toastResponseDTO);
        redirectAttributes.addFlashAttribute("toastDTO", toastDTOJson);
        return "redirect:/my-nutrition";
    }
}




