package com.swpproject.application.controller.exercise;

import com.swpproject.application.dto.ExerciseDTOIn;
import com.swpproject.application.dto.ExerciseDTOOut;
import com.swpproject.application.dto.RoleDTO;
import com.swpproject.application.dto.ToastResponseDTO;
import com.swpproject.application.enums.Role;
import com.swpproject.application.model.*;
import com.swpproject.application.service.ExerciseService;
import com.swpproject.application.service.PersonalTrainerService;
import com.swpproject.application.utils.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.util.*;


@Controller
@RequestMapping("/exercise")
public class ExerciseController {

    @Autowired
    private ExerciseService exerciseService;

    @Autowired
    private PersonalTrainerService personalTrainerService;

    @Autowired
    private PersonalTrainerExerciseController personalTrainerExerciseController;

    private static final String EXERCISE_LIST_URL = "exercise/exercise-list";
    private static final String EXERCISE_DETAILS_URL = "exercise/exercise-details";
    private static final String EXERCISE_CREATE_URL = "exercise/exercise-create";
    private static final String EXERCISE_UPDATE_URL = "exercise/exercise-update";
    private static final String ERROR_URL = "error";

    //Get view exercise list
    @RequestMapping(value = "", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getExerciseListPage(ModelMap model, HttpServletRequest request){
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        List<ExerciseDTOOut> exerciseDTOOutList = exerciseService.getExerciseDTOOutList(roleDTO);

        String json = JsonUtils.jsonConvert(exerciseDTOOutList);
        model.addAttribute("exerciseList", json);

        boolean canCreate = canCreateUpdate(roleDTO);
        model.addAttribute("canCreate", canCreate);

        int personalTrainerId = -1;
        if(roleDTO != null && roleDTO.getRole() == Role.PT) personalTrainerId = roleDTO.getId();
        model.addAttribute("personalTrainerId", personalTrainerId);
        return EXERCISE_LIST_URL;
    }


    //Get view exercise details
    @RequestMapping(value = "/details", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getExerciseDetailsPage(
            @RequestParam int id,
            ModelMap model,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes
    ) {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        Optional<Exercise> exerciseOptional = exerciseService.findExerciseById(id, roleDTO);
        if(exerciseOptional.isEmpty()) return ERROR_URL;

        ExerciseDTOOut exerciseDTOOut = exerciseOptional.get().getExerciseDTOOutAllInfor();
        String json = JsonUtils.jsonConvert(exerciseDTOOut);
        if(roleDTO != null && roleDTO.getRole() == Role.PT){
            int personalTrainerId = roleDTO.getId();
            model.addAttribute("personalTrainerId", personalTrainerId);
        }
        model.addAttribute("exercise", json);

        String toastDTOObject = (String) redirectAttributes.getFlashAttributes().get("toastDTO");
        if (toastDTOObject != null && !toastDTOObject.isEmpty()) {
            model.addAttribute("toastDTO", toastDTOObject);
        }
        return EXERCISE_DETAILS_URL;
    }


    //Get view create exercise
    @RequestMapping(value = "/create", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getCreateExercisePage(HttpServletRequest request) {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        if(!canCreateUpdate(roleDTO)) return ERROR_URL;

        return EXERCISE_CREATE_URL;
    }

    private boolean canCreateUpdate(RoleDTO roleDTO){
        if(roleDTO == null) return false;
        if(roleDTO.getRole() == Role.ADMIN) return true;

        if(roleDTO.getRole() != Role.PT) return false;
        PersonalTrainer personalTrainer = personalTrainerService.findPersonalTrainerByID(roleDTO.getId()).get();
        return  personalTrainer.getIsActive();
    }


    //Post create exercise data
    @RequestMapping(value = "/create", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    public String createExercise(
            @ModelAttribute ExerciseDTOIn exerciseDTOIn,
            HttpServletRequest request,
            ModelMap model
    )
            throws IOException
    {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        if(!canCreateUpdate(roleDTO)) return ERROR_URL;

        exerciseService.create(exerciseDTOIn, roleDTO);
        ToastResponseDTO toastResponseDTO = new  ToastResponseDTO(1, "Success", "Create Exercise successfully!");
        String toastDTOJson = JsonUtils.jsonConvert(toastResponseDTO);
        model.addAttribute("toastDTO", toastDTOJson);
        return personalTrainerExerciseController.getManageExerciseView(model, request);
    }


    //Get update view exercise
    @RequestMapping(value = "/details/edit", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getExerciseDetailsEditPage(@RequestParam int id, HttpServletRequest request, ModelMap model) {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        if(!canCreateUpdate(roleDTO)) return ERROR_URL;

        Optional<Exercise> exerciseOptional = exerciseService.findExerciseById(id, roleDTO);
        if(exerciseOptional.isEmpty()) return ERROR_URL;

        HttpSession session = request.getSession();
        session.setAttribute("exerciseId", id);

        ExerciseDTOOut exerciseDTOOutAllInfor = exerciseOptional.get().getExerciseDTOOutAllInfor();
        String json = JsonUtils.jsonConvert(exerciseDTOOutAllInfor);
        model.addAttribute("exercise", json);
        return EXERCISE_UPDATE_URL;
    }


    //Post update exercise data
    @RequestMapping(value = "/details/edit", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    public String editExercise(
            @ModelAttribute ExerciseDTOIn exerciseDTOIn,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes
    )
            throws IOException
    {
        HttpSession session = request.getSession();
        Integer exerciseId = (Integer) session.getAttribute("exerciseId");
        if(exerciseId == null) return ERROR_URL;

        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        if(!canCreateUpdate(roleDTO)) return ERROR_URL;

        session.removeAttribute("exerciseId");
        exerciseService.update(exerciseDTOIn, exerciseId);

        ToastResponseDTO toastResponseDTO = new  ToastResponseDTO(1, "Success", "Update Exercise successfully!");
        String toastDTOJson = JsonUtils.jsonConvert(toastResponseDTO);
        redirectAttributes.addAttribute("id", exerciseId);
        redirectAttributes.addFlashAttribute("toastDTO", toastDTOJson);
        return "redirect:/exercise/details";
    }
}

