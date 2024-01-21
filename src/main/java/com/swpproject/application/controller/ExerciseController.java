package com.swpproject.application.controller;

import com.swpproject.application.model.PersonalTrainer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/exercise")
public class ExerciseController {
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getExercisePage() {
        return "exercise-list";
    }
}
