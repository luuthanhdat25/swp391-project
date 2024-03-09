package com.swpproject.application.controller.exercise;

import com.swpproject.application.enums.Role;
import com.swpproject.application.model.*;
import com.swpproject.application.repository.ExerciseRepository;
import com.swpproject.application.repository.PersonalTrainerRepository;
import com.swpproject.application.service.ExerciseService;
import com.swpproject.application.service.impl.ExerciseServiceImpl;
import com.swpproject.application.utils.*;
import io.micrometer.common.util.StringUtils;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.*;
import java.util.zip.DataFormatException;


@Controller
@RequestMapping("/exercise")
public class ExerciseController {

    @Autowired
    private ExerciseService exerciseService;

    private static final String EXERCISE_LIST_URL = "exercise/exercise-list";
    private static final String EXERCISE_DETAILS_URL = "exercise/exercise-details";
    private static final String EXERCISE_CREATE_URL = "exercise/exercise-create";
    private static final String EXERCISE_UPDATE_URL = "exercise/exercise-update";
    private static final String ERROR_URL = "error";

    //Get view exercise list
    @RequestMapping(value = "/", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getExerciseListPage(ModelMap model, HttpServletRequest request){
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        List<ExerciseDTOOut> exerciseDTOOutList = exerciseService.getExerciseDTOOutList(roleDTO);
        String json = JsonUtils.jsonConvert(exerciseDTOOutList);
        model.addAttribute("exerciseList", json);
        return EXERCISE_LIST_URL;
    }


    //Get view exercise details
    @RequestMapping(value = "/details", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getExerciseDetailsPage(@RequestParam int id, ModelMap model, HttpServletRequest request) {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        Optional<Exercise> exerciseOptional = exerciseService.findExerciseById(id, roleDTO);
        if(exerciseOptional.isEmpty()) return ERROR_URL;

        ExerciseDTOOut exerciseDTOOut = exerciseOptional.get().getExerciseDTOOutAllInfor();
        String json = JsonUtils.jsonConvert(exerciseDTOOut);
        model.addAttribute("exercise", json);
        return EXERCISE_DETAILS_URL;
    }


    //Get view create exercise
    @RequestMapping(value = "/create", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getCreateExercisePage(HttpServletRequest request) {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        if(roleDTO == null || roleDTO.getRole() == Role.GYMER)
            return ERROR_URL;

        return EXERCISE_CREATE_URL;
    }


    //Post create exercise data
    @RequestMapping(value = "/create", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    public String createExercise(@ModelAttribute ExerciseDTOIn exerciseDTOIn, HttpServletRequest request) throws IOException {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        if(roleDTO == null || roleDTO.getRole() == Role.GYMER)
            return ERROR_URL;

        exerciseService.create(exerciseDTOIn, roleDTO);
        return "redirect:/exercise/";
    }


    //Get update view exercise
    @RequestMapping(value = "/details/edit", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getExerciseDetailsEditPage(@RequestParam int id, HttpServletRequest request, ModelMap model) {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        if(roleDTO == null || roleDTO.getRole() == Role.GYMER)
            return ERROR_URL;

        Optional<Exercise> exerciseOptional = exerciseService.findExerciseById(id, roleDTO);
        if(exerciseOptional.isEmpty())
            return ERROR_URL;

        String json = JsonUtils.jsonConvert(exerciseOptional.get());
        model.addAttribute("exercise", json);
        return EXERCISE_UPDATE_URL;
    }


    //Post update exercise data
    @RequestMapping(value = "/details/edit", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    public String editExercise(@ModelAttribute ExerciseDTOIn exerciseDTOIn, HttpServletRequest request, Model model) throws IOException {
        HttpSession session = request.getSession();
        Integer exerciseId = (Integer) session.getAttribute("exerciseId");
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        if(exerciseId == null || roleDTO == null || roleDTO.getRole() == Role.GYMER)
            return ERROR_URL;

        exerciseService.update(exerciseDTOIn, exerciseId);
        session.removeAttribute("exerciseId");
        return "redirect:/exercise/details?exerciseId=" + exerciseId;
    }
}

