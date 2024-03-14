package com.swpproject.application.controller;

import com.swpproject.application.dto.SlotExerciseDetailDTO;
import com.swpproject.application.model.Exercise;
import com.swpproject.application.model.SlotExerciseDetail;
import com.swpproject.application.repository.ExerciseRepository;
import com.swpproject.application.repository.SlotExeDetailRepository;
import com.swpproject.application.repository.SlotExeRepository;
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

    @GetMapping("")
    public ResponseEntity<List<SlotExerciseDetailDTO>> searchExercises(@RequestParam String id) {
        // Loại bỏ 3 kí tự đầu
        String modifiedId = id.substring(3);

        List<SlotExerciseDetail> slotExerciseDetails =
                slotExeDetailRepository.findAllBySlotExercise_Id(Integer.parseInt(modifiedId));
        List<Exercise> exerciseList = exerciseRepository.findAll();
        List<SlotExerciseDetailDTO> slotExerciseDetailDTOs = new ArrayList<>();

        for (SlotExerciseDetail slotExerciseDetail : slotExerciseDetails) {
            SlotExerciseDetailDTO slotExerciseDetailDTO = new SlotExerciseDetailDTO();
            slotExerciseDetailDTO.setId(slotExerciseDetail.getId());
            slotExerciseDetailDTO.setSetExe(slotExerciseDetail.getSetExe());
            slotExerciseDetailDTO.setRep(slotExerciseDetail.getRep());
            slotExerciseDetailDTO.setExerciseList(exerciseList);
            slotExerciseDetailDTO.setExerciseId(slotExerciseDetail.getExercise().getId());
            slotExerciseDetailDTO.setDescription(slotExerciseDetail.getSlotExercise().getDescription());
            slotExerciseDetailDTO.setCheck("Exe");
            slotExerciseDetailDTOs.add(slotExerciseDetailDTO);
        }
        return ResponseEntity.ok().body(slotExerciseDetailDTOs);
    }
}

