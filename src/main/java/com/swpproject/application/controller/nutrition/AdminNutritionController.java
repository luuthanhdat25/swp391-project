package com.swpproject.application.controller.nutrition;

import com.swpproject.application.dto.*;
import com.swpproject.application.enums.Role;
import com.swpproject.application.model.Nutrition;
import com.swpproject.application.service.NutritionService;
import com.swpproject.application.utils.JsonUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/admin-home")
public class AdminNutritionController {

    @Autowired
    private NutritionService nutritionService;


    @RequestMapping(value = "/manage-nutrition", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getManageNutritionView(
            ModelMap model, 
            HttpServletRequest request,
            RedirectAttributes redirectAttributes
    ){
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        if(roleDTO == null) return "error";
        if(roleDTO.getRole() != Role.ADMIN) return "error";

        List<NutritionDTOOut> nutritionDTOOutList = nutritionService.getNutritionDTOOutList(roleDTO);
        String nutritionDTOOutListJson = JsonUtils.jsonConvert(nutritionDTOOutList);
        model.addAttribute("nutritionList", nutritionDTOOutListJson);
        
        String toastDTOObject = (String) redirectAttributes.getFlashAttributes().get("toastDTO");
        if (toastDTOObject != null && !toastDTOObject.isEmpty()) {
            model.addAttribute("toastDTO", toastDTOObject);
        }
        return "nutrition/admin-home-manage-nutrition";
    }

    @GetMapping("/nutrition-change-status")
    public ResponseEntity<String> changeStatusNutrition(@RequestParam int id, @RequestParam int status, HttpServletRequest request){
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        nutritionService.updateNutritionStatus(id, status);
        Nutrition nutrition = nutritionService.findNutritionById(id, roleDTO).get();
        String statusString = status == 1 ? "Private" : "Public";
        String updateMessage = nutrition.getName() + " is change to " + statusString + " successfully!";
        return ResponseEntity.ok(updateMessage);
    }

    @RequestMapping(value = "/manage-nutrition/create", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getCreateNutritionPage(HttpServletRequest request) {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        if(roleDTO == null) return "error";
        if(roleDTO.getRole() != Role.ADMIN) return "error";
        return "nutrition/admin-home-nutrition-create";
    }

    @RequestMapping(value = "/manage-nutrition/create", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    public String createNutrition(
            @ModelAttribute NutritionDTOIn nutritionDTOIn, 
            HttpServletRequest request,
            RedirectAttributes redirectAttributes
    )
            throws IOException
    {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        nutritionService.create(nutritionDTOIn, roleDTO);
        ToastResponseDTO toastResponseDTO = new  ToastResponseDTO(1, "Success", "Create Nutrition successfully!");
        String toastDTOJson = JsonUtils.jsonConvert(toastResponseDTO);
        redirectAttributes.addFlashAttribute("toastDTO", toastDTOJson);
        return "redirect:/admin-home/manage-nutrition";
    }

    //Get update view nutrition
    @RequestMapping(value = "/manage-nutrition/edit", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getNutritionDetailsEditPage(@RequestParam int id, HttpServletRequest request, ModelMap model) {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        Optional<Nutrition> nutritionOptional = nutritionService.findNutritionById(id, roleDTO);

        HttpSession session = request.getSession();
        session.setAttribute("nutritionId", id);

        NutritionDTOOut nutritionDTOOutAllInfor = nutritionOptional.get().getNutritionDTOOut();
        String json = JsonUtils.jsonConvert(nutritionDTOOutAllInfor);
        model.addAttribute("nutrition", json);
        return "nutrition/admin-home-nutrition-update";
    }

    //Post update nutrition data
    @RequestMapping(value = "/manage-nutrition/edit", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    public String editnutrition(
            @ModelAttribute NutritionDTOIn nutritionDTOIn,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes
    )
            throws IOException
    {
        HttpSession session = request.getSession();
        Integer nutritionId = (Integer) session.getAttribute("nutritionId");

        session.removeAttribute("nutritionId");
        nutritionService.update(nutritionDTOIn, nutritionId);

        ToastResponseDTO toastResponseDTO = new  ToastResponseDTO(1, "Success", "Update Nutrition successfully!");
        String toastDTOJson = JsonUtils.jsonConvert(toastResponseDTO);
        redirectAttributes.addFlashAttribute("toastDTO", toastDTOJson);
        return "redirect:/admin-home/manage-nutrition";
    }
}
