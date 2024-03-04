package com.swpproject.application.controller.exercise;

import com.swpproject.application.model.Exercise;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.repository.ExerciseRepository;
import com.swpproject.application.repository.PersonalTrainerRepository;
import com.swpproject.application.utils.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.zip.DataFormatException;


@Controller
@RequestMapping("/exercise")
public class ExerciseController {
    private final ExerciseRepository exerciseRepository;
    private final PersonalTrainerRepository personalTrainerRepository;

    @Autowired
    public ExerciseController(ExerciseRepository exerciseRepository, PersonalTrainerRepository personalTrainerRepository) {
        this.exerciseRepository = exerciseRepository;
        this.personalTrainerRepository = personalTrainerRepository;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getExerciseListPage(ModelMap model){
        List<Exercise> exercises = exerciseRepository.findAll();
        String json = JsonUtils.jsonConvert(exercises);
        model.addAttribute("exerciseList", json);
        return "exercise-list";
    }



    @RequestMapping(value = "/details", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getExerciseDetailsPage(@RequestParam int id, ModelMap model) {
        Exercise exercise = exerciseRepository.findById(id);
        model.addAttribute("exercise", exercise);
        return "exercise-details";
    }


    //----------------------------------------------------------------Create Exercise
    @RequestMapping(value = "/create", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getCreateExercisePage() {
        return "exercise-create";
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    public String createExercise(@RequestParam("exerciseName") String exerciseName,
                                 @RequestParam("levelRadio") String level,
                                 @RequestParam("equipment") String equipment,
                                 @RequestParam("muscle") String muscle,
                                 @RequestParam("image") MultipartFile image,
                                 @RequestParam("youtubeLink") String youtubeLink,
                                 @RequestParam("exerciseDescription") String exerciseDescription,
                                 @RequestParam(value = "privacy", required = false) String privacy,
                                 Model model) throws IOException {

        boolean isPrivate = (privacy != null && privacy.equals("private"));

        Exercise exercise = new Exercise();
        exercise.setName(exerciseName);
        exercise.setType(muscle);
        exercise.setDescription(exerciseDescription);
        exercise.setLevel(level);
        exercise.setEquipment(equipment);
        exercise.setVideoDescription(youtubeLink);
        exercise.setImageDescription(image.getBytes());
        exercise.setPrivate(isPrivate);

        PersonalTrainer personalTrainerExample = personalTrainerRepository.findAll().getFirst();
        exercise.setPersonalTrainer(personalTrainerExample);

        exerciseRepository.save(exercise);
        return "exercise-list";
    }

    //----------------------------------------------------------------


    //----------------------------------------------------------------Edit the exercise
    @RequestMapping(value = "/details/edit", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getExerciseDetailsEditPage(@RequestParam int id, ModelMap model) {
        Exercise exercise = exerciseRepository.findById(id);
        model.addAttribute("exercise", exercise);
        return "exercise-details-edit";
    }

    @RequestMapping(value = "/details/edit", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    public String editExercise(@RequestParam Exercise exercise, ModelMap model) {
        //
        return "exercise-details-edit";
    }
    //----------------------------------------------------------------
}

