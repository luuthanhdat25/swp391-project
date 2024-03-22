package com.swpproject.application.controller;

import com.swpproject.application.model.Exercise;
import com.swpproject.application.model.SlotExerciseDetail;
import com.swpproject.application.repository.ExerciseRepository;
import com.swpproject.application.repository.SlotExeDetailRepository;
import com.swpproject.application.service.ExerciseService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/slot-exercise")
public class SloExeRestController {

    @Autowired
    private ExerciseRepository exerciseRepository;

    @Autowired
    private SlotExeDetailRepository slotExeDetailRepository;

    @Autowired
    private ExerciseService exerciseService;

    @GetMapping("")
    public ResponseEntity<List<SlotExerciseDetailDTO>> searchExercises(@RequestParam String id
            , HttpServletRequest request) {
        // Loại bỏ 3 kí tự đầu
        String modifiedId = id.substring(3);

        List<SlotExerciseDetail> slotExerciseDetails =
                slotExeDetailRepository.findAllBySlotExercise_Id(Integer.parseInt(modifiedId));
        List<Exercise> exercises = exerciseService.findExerciseByIsPrivate(0);
//        System.out.println("check: "+exercises.size());
        List<ExerciseDTO> exerciseDTOS = new ArrayList<>();
        List<SlotExerciseDetailDTO> slotExerciseDetailDTOs = new ArrayList<>();
        for (Exercise exercise : exercises){
            ExerciseDTO exerciseDTO = new ExerciseDTO(exercise.getId(),exercise.getName());
            exerciseDTOS.add(exerciseDTO);
        }
        for (SlotExerciseDetail slotExerciseDetail : slotExerciseDetails) {
            SlotExerciseDetailDTO slotExerciseDetailDTO = new SlotExerciseDetailDTO();
            slotExerciseDetailDTO.setId(slotExerciseDetail.getId());
            slotExerciseDetailDTO.setSlotId(Integer.parseInt(modifiedId));
            slotExerciseDetailDTO.setSetExe(slotExerciseDetail.getSetExe());
            slotExerciseDetailDTO.setRep(slotExerciseDetail.getRep());
            slotExerciseDetailDTO.setExercises(exerciseDTOS);
            slotExerciseDetailDTO.setExerciseId(slotExerciseDetail.getExercise().getId());
            slotExerciseDetailDTO.setDescription(slotExerciseDetail.getSlotExercise().getDescription());
            slotExerciseDetailDTO.setCheck("Exe");
            slotExerciseDetailDTOs.add(slotExerciseDetailDTO);
        }
        return ResponseEntity.ok().body(slotExerciseDetailDTOs);
    }
}

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
class SlotExerciseDetailDTO {
    private Integer id;
    private Integer slotId;
    private List<ExerciseDTO> exercises;
    private int exerciseId;
    private int setExe;
    private int rep;
    private String description;
    private String check;
}

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
class ExerciseDTO {
    private Integer id;
    private String name;
}