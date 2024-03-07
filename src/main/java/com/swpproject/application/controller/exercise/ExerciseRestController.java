package com.swpproject.application.controller.exercise;

import com.swpproject.application.model.Exercise;
import com.swpproject.application.repository.ExerciseRepository;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/exercises")
public class ExerciseRestController {
    private final ExerciseRepository exerciseRepository;

    public ExerciseRestController(ExerciseRepository exerciseRepository) {
        this.exerciseRepository = exerciseRepository;
    }

    @PostMapping("/search")
    public ResponseEntity<List<Exercise>> searchExercises(@RequestBody FilterObject filterObject) {
        List<Exercise> exercises = exerciseRepository.findAll();
        exercises = findByNameContaining(filterObject.getSearchValue(), exercises);
        exercises = findByCategory(filterObject.getCategories(), exercises);
        exercises = findByLevel(filterObject.getDifficulties(), exercises);
        exercises = findByEquipment(filterObject.getEquipments(), exercises);
        return ResponseEntity.ok().body(exercises);
    }

    @PostMapping("/")
    public ResponseEntity<List<Exercise>> searchExercise() {
        List<Exercise> exercises = exerciseRepository.findAll();
        return ResponseEntity.ok().body(exercises);
    }

    private List<Exercise> findByNameContaining(String keyword, List<Exercise> exercises) {
        if(keyword == null) return exercises;
        String finalKeyword = keyword.toLowerCase();
        return exercises.stream()
                .filter(exercise -> exercise.getName().toLowerCase().contains(finalKeyword))
                .collect(Collectors.toList());
    }

    private List<Exercise> findByCategory(List<String> categories, List<Exercise> exercises) {
        if (categories.isEmpty()) return exercises;
        return exercises.stream()
                .filter(exercise -> categories.contains(exercise.getType()))
                .collect(Collectors.toList());
    }


    private List<Exercise> findByLevel(List<String> difficulties, List<Exercise> exercises) {
        if (difficulties.isEmpty()) return exercises;
        return exercises.stream()
                .filter(exercise -> difficulties.contains(exercise.getLevel()))
                .collect(Collectors.toList());
    }


    private List<Exercise> findByEquipment(List<String> equipments, List<Exercise> exercises) {
        if (equipments.isEmpty()) return exercises;
        return exercises.stream()
                .filter(exercise -> equipments.contains(exercise.getEquipment()) || exercise.getEquipment().equals("None"))
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
