package com.swpproject.application.controller.exercise;

import com.swpproject.application.dto.ExerciseDTOOut;
import com.swpproject.application.dto.RoleDTO;
import com.swpproject.application.enums.Role;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.service.ExerciseService;
import com.swpproject.application.service.PersonalTrainerService;
import com.swpproject.application.utils.JsonUtils;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class PersonalTrainerExerciseController {

    @Autowired
    private ExerciseService exerciseService;

    @Autowired
    private PersonalTrainerService personalTrainerService;

    @RequestMapping(value = "/my-exercise", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getManageExerciseView(ModelMap model, HttpServletRequest request){
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        if(roleDTO == null) return "error";
        if(roleDTO.getRole() != Role.PT) return "error";

        List<ExerciseDTOOut> exerciseDTOOutList = exerciseService.getExerciseDTOOutList(roleDTO);
        List<ExerciseDTOOut> myExerciseDTOOutList = getMyExercise(roleDTO.getId(), exerciseDTOOutList);
        String myExerciseDTOOut = JsonUtils.jsonConvert(myExerciseDTOOutList);
        model.addAttribute("exerciseList", myExerciseDTOOut);

        boolean canCreate = canCreateUpdate(roleDTO);
        model.addAttribute("canCreate", canCreate);
        return "exercise/pt-exercise-list";
    }

    private boolean canCreateUpdate(RoleDTO roleDTO){
        if(roleDTO == null) return false;
        if(roleDTO.getRole() == Role.ADMIN) return true;

        if(roleDTO.getRole() != Role.PT) return false;
        PersonalTrainer personalTrainer = personalTrainerService.findPersonalTrainerByID(roleDTO.getId()).get();
        return  personalTrainer.getIsActive();
    }

    private List<ExerciseDTOOut> getMyExercise(int id, List<ExerciseDTOOut> exerciseDTOOutList){
        return exerciseDTOOutList.stream()
                .filter(exerciseDTOOut -> exerciseDTOOut.getPersonalTrainer_id() == id)
                .collect(Collectors.toList());
    }
}
