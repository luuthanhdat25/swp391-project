package com.swpproject.application.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.swpproject.application.model.Exercise;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/exercises")
public class ExerciseSearchController {
    private List<Exercise> exerciseList = Arrays.asList(
            new Exercise(
                    "Dumbbell Bench Press",
                    "Chest",
                    "Lie down on a flat bench with a dumbbell in each hand resting on top of your thighs. The palms of your hands will be facing each other. Then, using your thighs to help raise the dumbbells up, lift the dumbbells one at a time so that you can hold them in front of you at shoulder width. Once at shoulder width, rotate your wrists forward so that the palms of your hands are facing away from you. The dumbbells should be just to the sides of your chest, with your upper arm and forearm creating a 90 degree angle. Be sure to maintain full control of the dumbbells at all times. This will be your starting position. Then, as you breathe out, use your chest to push the dumbbells up. Lock your arms at the top of the lift and squeeze your chest, hold for a second and then begin coming down slowly. Tip: Ideally, lowering the weight should take about twice as long as raising it. Repeat the movement for the prescribed amount of repetitions of your training program.  Caution: When you are done, do not drop the dumbbells next to you as this is dangerous to your rotator cuff in your shoulders and others working out around you. Just lift your legs from the floor bending at the knees, twist your wrists so that the palms of your hands are facing each other and place the dumbbells on top of your thighs. When both dumbbells are touching your thighs simultaneously push your upper torso up (while pressing the dumbbells on your thighs) and also perform a slight kick forward with your legs (keeping the dumbbells on top of the thighs). By doing this combined movement, momentum will help you get back to a sitting position with both dumbbells still on top of your thighs. At this moment you can place the dumbbells on the floor. Variations: Another variation of this exercise is to perform it with the palms of the hands facing each other. Also, you can perform the exercise with the palms facing each other and then twisting the wrist as you lift the dumbbells so that at the top of the movement the palms are facing away from the body. I personally do not use this variation very often as it seems to be hard on my shoulders.",
                    "Beginner",
                    "https://www.youtube.com/watch?v=VmB1G1K7v94",
                    "https://static.strengthlevel.com/images/illustrations/dumbbell-bench-press-1000x1000.jpg",
                    0),
            new Exercise(
                    "Dumbbell floor press",
                    "Triceps",
                    "Lay on the floor holding dumbbells in your hands. Your knees can be bent. Begin with the weights fully extended above you. Lower the weights until your upper arm comes in contact with the floor. You can tuck your elbows to emphasize triceps size and strength, or to focus on your chest angle your arms to the side. Pause at the bottom, and then bring the weight together at the top by extending through the elbows.",
                    "Intermediate",
                    "https://www.youtube.com/watch?v=uUGDRwge4F8",
                    "https://static.strengthlevel.com/images/illustrations/dumbbell-floor-press-1000x1000.jpg",
                    3   // Personal Trainer ID
            ),
            new Exercise(
                    "Incline Hammer Curls",
                    "Biceps",
                    "Seat yourself on an incline bench with a dumbbell in each hand. You should pressed firmly against he back with your feet together. Allow the dumbbells to hang straight down at your side, holding them with a neutral grip. This will be your starting position. Initiate the movement by flexing at the elbow, attempting to keep the upper arm stationary. Continue to the top of the movement and pause, then slowly return to the start position.",
                    "Advanced",
                    "https://www.youtube.com/watch?v=cbRSu8Ws_hs",
                    "https://static.strengthlevel.com/images/illustrations/incline-hammer-curl-1000x1000.jpg",
                    3   // Personal Trainer ID
            )
    );


    @PostMapping("/search")
    public ResponseEntity<List<Exercise>> searchProducts(@RequestBody FilterObject filterObject) {
        List<Exercise> exercises = findByNameContaining(filterObject.getSearchValue(), exerciseList);
        exercises = findByCategory(filterObject.getCategories(), exercises);
        exercises = findByLevel(filterObject.getDifficulties(), exercises);
        return ResponseEntity.ok().body(exercises);
    }

    private List<Exercise> findByNameContaining(String keyword, List<Exercise> exercises) {
        if(keyword == null || keyword.length() == 0) return exercises;
        return exercises.stream()
                .filter(exercise -> exercise.getName().toLowerCase().contains(keyword.toLowerCase()))
                .collect(Collectors.toList());
    }

    private List<Exercise> findByCategory(List<String> categories, List<Exercise> exercises) {
        if(categories == null || categories.size() == 0) return exercises;
        List<Exercise> newExercise = new ArrayList<>();
        for (Exercise exercise : exercises){
            for (String category : categories){
                if(exercise.getType().toLowerCase().contains(category.toLowerCase())) newExercise.add(exercise);
            }
        }
        return newExercise;
    }

    private List<Exercise> findByLevel(List<String> difficulties, List<Exercise> exercises) {
        if(difficulties == null || difficulties.size() == 0) return exercises;
        List<Exercise> newExercise = new ArrayList<>();
        for (Exercise exercise : exercises){
            for (String difficult : difficulties){
                if((exercise.getLevel().charAt(0)) == difficult.charAt(0)) newExercise.add(exercise);
            }
        }
        return newExercise;
    }
}

 class FilterObject {
    private String searchValue;
    private List<String> categories;
    private List<String> difficulties;

     public FilterObject(String searchValue, List<String> categories, List<String> difficulties) {
         this.searchValue = searchValue;
         this.categories = categories;
         this.difficulties = difficulties;
     }

     public String getSearchValue() {
         return searchValue;
     }

     public void setSearchValue(String searchValue) {
         this.searchValue = searchValue;
     }

     public List<String> getCategories() {
         return categories;
     }

     public void setCategories(List<String> categories) {
         this.categories = categories;
     }

     public List<String> getDifficulties() {
         return difficulties;
     }

     public void setDifficulties(List<String> difficulties) {
         this.difficulties = difficulties;
     }
 }
