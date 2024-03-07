package com.swpproject.application.controller.exercise;

import com.swpproject.application.model.Exercise;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.repository.ExerciseRepository;
import com.swpproject.application.repository.PersonalTrainerRepository;
import com.swpproject.application.utils.*;
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
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Locale;
import java.util.zip.DataFormatException;


@Controller
@RequestMapping("/exercise")
public class ExerciseController {
    private final ExerciseRepository exerciseRepository;
    private final PersonalTrainerRepository personalTrainerRepository;

    public ExerciseController(ExerciseRepository exerciseRepository, PersonalTrainerRepository personalTrainerRepository) {
        this.exerciseRepository = exerciseRepository;
        this.personalTrainerRepository = personalTrainerRepository;
    }

    //Get view exercise list
    @RequestMapping(value = "/", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getExerciseListPage(ModelMap model){
        List<Exercise> exercises = exerciseRepository.findAll();
        String json = JsonUtils.jsonConvert(exercises);
        model.addAttribute("exerciseList", json);
        return "exercise/exercise-list";
    }

    //Get view exercise details
    @RequestMapping(value = "/details", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getExerciseDetailsPage(@RequestParam int id, ModelMap model) {
        Exercise exercise = exerciseRepository.findById(id);
        String json = JsonUtils.jsonConvert(exercise);
        model.addAttribute("exercise", json);
        return "exercise-details";
    }

    //Get view create exercise
    @RequestMapping(value = "/create", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getCreateExercisePage() {
        return "exercise-create";
    }

    //Post create exercise data
    @RequestMapping(value = "/create", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    public String createExercise(@ModelAttribute ExerciseDTO exerciseDTO, Model model) throws IOException {
        Exercise exercise = new Exercise();
        exercise.setName(exerciseDTO.getExerciseName());
        exercise.setType(exerciseDTO.getMuscle());
        exercise.setDescription(exerciseDTO.getExerciseDescription());
        exercise.setLevel(exerciseDTO.getLevelRadio());
        exercise.setEquipment(exerciseDTO.getEquipment());
        exercise.setVideoDescription(exerciseDTO.getYoutubeLink());
        exercise.setImageDescription(exerciseDTO.getImage().getBytes());

        String isPrivateString = exerciseDTO.getIsPrivate();
        int isPrivateBoolean = isPrivateString == null ? 0 : 1;
        exercise.setIsPrivate(isPrivateBoolean);

        PersonalTrainer personalTrainerExample = personalTrainerRepository.findAll().getFirst();
        exercise.setPersonalTrainer(personalTrainerExample);

        exerciseRepository.save(exercise);
        return "redirect:/exercise/";
    }


    //Get update view exercise
    @RequestMapping(value = "/details/edit", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getExerciseDetailsEditPage(@RequestParam int id, HttpServletRequest request, ModelMap model) {
        HttpSession session = request.getSession();
        session.setAttribute("exerciseId", id);

        Exercise exercise = exerciseRepository.findById(id);
        String json = JsonUtils.jsonConvert(exercise);
        model.addAttribute("exercise", json);
        return "exercise-update";
    }

    //Post update exercise data
    @RequestMapping(value = "/details/edit", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    public String editExercise(@ModelAttribute ExerciseDTO exerciseDTO, HttpServletRequest request, Model model) throws IOException {
        HttpSession session = request.getSession();
        Integer id = (Integer) session.getAttribute("exerciseId");

        if (id != null) {
            Exercise exercise = exerciseRepository.findById(id);
            exercise.setName(exerciseDTO.getExerciseName());
            exercise.setType(exerciseDTO.getMuscle());
            exercise.setDescription(exerciseDTO.getExerciseDescription());
            exercise.setLevel(exerciseDTO.getLevelRadio());
            exercise.setEquipment(exerciseDTO.getEquipment());
            exercise.setVideoDescription(exerciseDTO.getYoutubeLink());
            System.out.println(exerciseDTO.getImage().getBytes().length);
            if(exerciseDTO.getImage().getBytes().length != 0) exercise.setImageDescription(exerciseDTO.getImage().getBytes());
            exerciseRepository.update(exercise);

            session.removeAttribute("exerciseId");
            return "redirect:/exercise/details?id=" + id;
        } else {
            return "redirect:/error";
        }
    }
}

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
class ExerciseDTO {
    private String exerciseName;
    private String levelRadio;
    private String equipment;
    private String muscle;
    private MultipartFile image;
    private String youtubeLink;
    private String exerciseDescription;
    private String isPrivate;
}


