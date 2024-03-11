package com.swpproject.application.controller.exercise;

import com.swpproject.application.controller.dto.ExerciseDTOIn;
import com.swpproject.application.controller.dto.ExerciseDTOOut;
import com.swpproject.application.controller.dto.RoleDTO;
import com.swpproject.application.enums.Role;
import com.swpproject.application.model.*;
import com.swpproject.application.service.ExerciseService;
import com.swpproject.application.utils.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.awt.print.Pageable;
import java.io.IOException;
import java.util.*;


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
    @RequestMapping(value = "", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getExerciseListPage(ModelMap model, HttpServletRequest request,
                                      @RequestParam(defaultValue = "0") int page,
                                      @RequestParam(defaultValue = "5") int size){
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        List<ExerciseDTOOut> exerciseDTOOutList = exerciseService.getExerciseDTOOutList(roleDTO);
//        PageRequest pageable = PageRequest.of(page, size);
//        int start = (int)pageable.getOffset();
//        int end = Math.min((start + pageable.getPageSize()), exerciseDTOOutList.size());
//        Page<ExerciseDTOOut> pageImpl = new PageImpl<>(exerciseDTOOutList.subList(start, end), pageable, exerciseDTOOutList.size());
//        System.out.println(pageImpl.getContent().size() + " Item");
//        String json = JsonUtils.jsonConvert(pageImpl.getContent());
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
        return "redirect:/exercise";
    }


    //Get update view exercise
    @RequestMapping(value = "/details/edit", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getExerciseDetailsEditPage(@RequestParam int id, HttpServletRequest request, ModelMap model) {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        System.out.println(roleDTO.getRole().getLabel());
        if(roleDTO == null || roleDTO.getRole() == Role.GYMER)
            return ERROR_URL;

        Optional<Exercise> exerciseOptional = exerciseService.findExerciseById(id, roleDTO);
        if(exerciseOptional.isEmpty())
            return ERROR_URL;

        Exercise exercise = exerciseOptional.get();
        HttpSession session = request.getSession();
        session.setAttribute("exerciseId", exercise.getId());
        String json = JsonUtils.jsonConvert(exercise.getExerciseDTOOutAllInfor());
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
        return "redirect:/exercise/details?id=" + exerciseId;
    }
}

