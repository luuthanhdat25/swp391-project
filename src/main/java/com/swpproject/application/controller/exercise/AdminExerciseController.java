package com.swpproject.application.controller.exercise;

import com.swpproject.application.dto.*;
import com.swpproject.application.enums.Role;
import com.swpproject.application.model.Exercise;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.service.ExerciseService;
import com.swpproject.application.service.PersonalTrainerService;
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
public class AdminExerciseController {

    @Autowired
    private ExerciseService exerciseService;

    @Autowired
    private PersonalTrainerService personalTrainerService;

    @RequestMapping(value = "/manage-exercise", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getManageExerciseView(
            ModelMap model,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes
    ){
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        if(roleDTO == null) return "error";
        if(roleDTO.getRole() != Role.ADMIN) return "error";

        List<ExerciseDTOOut> exerciseDTOOutList = exerciseService.getExerciseDTOOutList(roleDTO);
        String exerciseDTOoutJson = JsonUtils.jsonConvert(exerciseDTOOutList);
        model.addAttribute("exerciseList", exerciseDTOoutJson);

        String toastDTOObject = (String) redirectAttributes.getFlashAttributes().get("toastDTO");
        if (toastDTOObject != null && !toastDTOObject.isEmpty()) {
            model.addAttribute("toastDTO", toastDTOObject);
        }
        return "exercise/admin-home-manage-exercise";
    }

    @GetMapping("/exercise-change-status")
    public ResponseEntity<String> changeStatusExercise(@RequestParam int id, @RequestParam int status, HttpServletRequest request){
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        exerciseService.updateExerciseStatus(id, status);
        Exercise exercise = exerciseService.findExerciseById(id, roleDTO).get();
        String statusString = status == 1 ? "Private" : "Public";
        String updateMessage = exercise.getName() + " is change to " + statusString + " successfully!";
        return ResponseEntity.ok(updateMessage);
    }

    @RequestMapping(value = "/manage-exercise/create", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getCreateExerciseAdmin(HttpServletRequest request) {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        if(roleDTO == null) return "error";
        if(roleDTO.getRole() != Role.ADMIN) return "error";
        return "exercise/admin-home-exercise-create";
    }

    @RequestMapping(value = "/manage-exercise/create", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    public String createExerciseAdmin(
            @ModelAttribute ExerciseDTOIn exerciseDTOIn,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes
    )
            throws IOException
    {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        exerciseService.create(exerciseDTOIn, roleDTO);
        ToastResponseDTO toastResponseDTO = new  ToastResponseDTO(1, "Success", "Create Exercise successfully!");
        String toastDTOJson = JsonUtils.jsonConvert(toastResponseDTO);
        redirectAttributes.addFlashAttribute("toastDTO", toastDTOJson);
        return "redirect:/admin-home/manage-exercise";
    }

    @GetMapping("/personal-trainer-account")
    public String getPersonalTrainerAccount(@RequestParam("id") int id){
        Optional<PersonalTrainer> optionalPersonalTrainer = personalTrainerService.getPersonalTrainerById(id);
        if(optionalPersonalTrainer.isEmpty()) return "error";
        int accountId = optionalPersonalTrainer.get().getAccount().getId();
        return "redirect:/admin-home/manage-account/details?id=" + accountId;
    }

    //Get update view exercise
    @RequestMapping(value = "/manage-exercise/edit", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getExerciseDetailsEditPage(@RequestParam int id, HttpServletRequest request, ModelMap model) {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        Optional<Exercise> exerciseOptional = exerciseService.findExerciseById(id, roleDTO);

        HttpSession session = request.getSession();
        session.setAttribute("exerciseId", id);

        ExerciseDTOOut exerciseDTOOutAllInfor = exerciseOptional.get().getExerciseDTOOutAllInfor();
        String json = JsonUtils.jsonConvert(exerciseDTOOutAllInfor);
        model.addAttribute("exercise", json);
        return "exercise/admin-home-exercise-update";
    }

    //Post update exercise data
    @RequestMapping(value = "/manage-exercise/edit", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    public String editExercise(
            @ModelAttribute ExerciseDTOIn exerciseDTOIn,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes
    )
            throws IOException
    {
        HttpSession session = request.getSession();
        Integer exerciseId = (Integer) session.getAttribute("exerciseId");

        session.removeAttribute("exerciseId");
        exerciseService.update(exerciseDTOIn, exerciseId);

        ToastResponseDTO toastResponseDTO = new  ToastResponseDTO(1, "Success", "Update Exercise successfully!");
        String toastDTOJson = JsonUtils.jsonConvert(toastResponseDTO);
        redirectAttributes.addAttribute("id", exerciseId);
        redirectAttributes.addFlashAttribute("toastDTO", toastDTOJson);
        return "redirect:/admin-home/manage-exercise";
    }
}
