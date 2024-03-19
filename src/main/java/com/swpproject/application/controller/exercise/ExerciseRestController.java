package com.swpproject.application.controller.exercise;

import com.swpproject.application.dto.ExerciseDTOOut;
import com.swpproject.application.dto.RoleDTO;
import com.swpproject.application.model.Exercise;
import com.swpproject.application.service.ExerciseService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/exercises")
public class ExerciseRestController {

    @Autowired
    private ExerciseService exerciseService;

    @PostMapping("/search")
    public ResponseEntity<List<ExerciseDTOOut>> searchExerciseDTOOut(
            @RequestBody FilterObject filterObject,
            HttpServletRequest request)
    {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        List<ExerciseDTOOut> exerciseDTOOutList = exerciseService.getExerciseDTOOutList(roleDTO);

        exerciseDTOOutList = getExerciseDTOOutListAppliedSearchFilter(filterObject, exerciseDTOOutList);
        return ResponseEntity.ok().body(exerciseDTOOutList);
    }

//    @RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    @GetMapping("/{id}")
    public ResponseEntity<ExerciseDTOOut> getExerciseDetails(@PathVariable int id, HttpServletRequest request) {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        Optional<Exercise> optionalExercise = exerciseService.findExerciseById(id, roleDTO);
        if(optionalExercise.isEmpty()) return ResponseEntity.notFound().build();
        ExerciseDTOOut exerciseDTOOut = optionalExercise.get().getExerciseDTOOutAllInfor();
        return ResponseEntity.ok().body(exerciseDTOOut);
    }

    private List<ExerciseDTOOut> getExerciseDTOOutListAppliedSearchFilter(FilterObject filterObject, List<ExerciseDTOOut> exerciseDTOOutList){
        exerciseDTOOutList = findByNameContaining(filterObject.getSearchValue(), exerciseDTOOutList);
        exerciseDTOOutList = findByCategory(filterObject.getCategories(), exerciseDTOOutList);
        exerciseDTOOutList = findByLevel(filterObject.getDifficulties(), exerciseDTOOutList);
        exerciseDTOOutList = findByEquipment(filterObject.getEquipments(), exerciseDTOOutList);
        return exerciseDTOOutList;
    }

    private List<ExerciseDTOOut> findByNameContaining(String keyword, List<ExerciseDTOOut> exercises) {
        if(keyword == null) return exercises;
        String finalKeyword = keyword.toLowerCase();
        return exercises.stream()
                .filter(exercise -> exercise.getName().toLowerCase().contains(finalKeyword))
                .collect(Collectors.toList());
    }

    private List<ExerciseDTOOut> findByCategory(List<String> categories, List<ExerciseDTOOut> exercises) {
        if (categories.isEmpty()) return exercises;
        return exercises.stream()
                .filter(exercise -> categories.contains(exercise.getType()))
                .collect(Collectors.toList());
    }


    private List<ExerciseDTOOut> findByLevel(List<String> difficulties, List<ExerciseDTOOut> exercises) {
        if (difficulties.isEmpty()) return exercises;
        return exercises.stream()
                .filter(exercise -> difficulties.contains(exercise.getLevel()))
                .collect(Collectors.toList());
    }


    private List<ExerciseDTOOut> findByEquipment(List<String> equipments, List<ExerciseDTOOut> exercises) {
        if (equipments.isEmpty()) return exercises;
        return exercises.stream()
                .filter(exercise -> equipments.contains(exercise.getEquipment()))
                .collect(Collectors.toList());
    }
}


@Getter
@Setter
@NoArgsConstructor
class FilterObject {
    private String searchValue;
    private List<String> categories;
    private List<String> difficulties;
    private List<String> equipments;

    @Override
    public String toString() {
        return "FilterObject{" +
                "searchValue='" + searchValue + '\'' +
                ", categories=" + categories +
                ", difficulties=" + difficulties +
                ", equipments=" + equipments +
                '}';
    }
}
