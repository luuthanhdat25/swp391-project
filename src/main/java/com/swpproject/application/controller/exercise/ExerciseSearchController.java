//package com.swpproject.application.controller.exercise;
//
//import com.swpproject.application.model.Exercise;
//import com.swpproject.application.repository.ExerciseRepository;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.http.MediaType;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.ArrayList;
//import java.util.List;
//import java.util.stream.Collectors;
//
//@RestController
//@RequestMapping("/api/exercises")
//public class ExerciseSearchController {
//    @Autowired
//    private ExerciseRepository exerciseRepository;
//
//    @PostMapping("/search")
//    public ResponseEntity<List<Exercise>> searchExercise(@RequestBody FilterObject filterObject) {
//        List<Exercise> exercises = exerciseRepository.findAll();
//        exercises = findByNameContaining(filterObject.getSearchValue(), exercises);
//        exercises = findByCategory(filterObject.getCategories(), exercises);
//        exercises = findByLevel(filterObject.getDifficulties(), exercises);
//        exercises = findByEquipment(filterObject.getEquipments(), exercises);
//        return ResponseEntity.ok().body(exercises);
//    }
//
//    @RequestMapping(value = "/", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
//    public ResponseEntity<List<Exercise>> getExerciseList() {
//        List<Exercise> exercises = exerciseRepository.findAll();
//        return ResponseEntity.ok().body(exercises);
//    }
//
//
//    private List<Exercise> findByNameContaining(String keyword, List<Exercise> exercises) {
//        if(keyword == null) return exercises;
//        return exercises.stream()
//                .filter(exercise -> exercise.getName().toLowerCase().contains(keyword.toLowerCase()))
//                .collect(Collectors.toList());
//    }
//
//    private List<Exercise> findByCategory(List<String> categories, List<Exercise> exercises) {
//        if(categories == null) return exercises;
//        List<Exercise> newExercise = new ArrayList<>();
//        for (Exercise exercise : exercises){
//            for (String category : categories){
//                if(category.equalsIgnoreCase(exercise.getType())){
//                    newExercise.add(exercise);
//                    break;
//                }
//            }
//        }
//        return newExercise;
//    }
//
//    private List<Exercise> findByLevel(List<String> difficulties, List<Exercise> exercises) {
//        if(difficulties == null) return exercises;
//        List<Exercise> newExercise = new ArrayList<>();
//        for (Exercise exercise : exercises){
//            for (String difficult : difficulties){
//                if((exercise.getLevel().charAt(0)) == difficult.charAt(0)) newExercise.add(exercise);
//            }
//        }
//        return newExercise;
//    }
//
//    private List<Exercise> findByEquipment(List<String> equipments, List<Exercise> exercises) {
//        if(equipments == null) return exercises;
//        List<Exercise> newExercise = new ArrayList<>();
//        for (Exercise exercise : exercises){
//            for (String equipment : equipments){
//                if(equipment.equalsIgnoreCase(exercise.getEquipment())){
//                    newExercise.add(exercise);
//                    break;
//                }
//            }
//        }
//        return newExercise;
//    }
//}
//
//class FilterObject {
//    private String searchValue;
//    private List<String> categories;
//     private List<String> difficulties;
//     private List<String> equipments;
//
//     public FilterObject(String searchValue, List<String> categories, List<String> difficulties, List<String> equipments) {
//         this.searchValue = searchValue;
//         this.categories = categories;
//         this.difficulties = difficulties;
//         this.equipments = equipments;
//     }
//
//     public String getSearchValue() {
//         return searchValue;
//     }
//
//     public void setSearchValue(String searchValue) {
//         this.searchValue = searchValue;
//     }
//
//     public List<String> getCategories() {
//         return categories;
//     }
//
//     public void setCategories(List<String> categories) {
//         this.categories = categories;
//     }
//
//     public List<String> getDifficulties() {
//         return difficulties;
//     }
//
//     public void setDifficulties(List<String> difficulties) {
//         this.difficulties = difficulties;
//     }
//
//     public List<String> getEquipments() {
//         return equipments;
//     }
//
//     public void setEquipments(List<String> equipments) {
//         this.equipments = equipments;
//     }
// }
