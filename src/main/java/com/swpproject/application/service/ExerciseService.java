package com.swpproject.application.service;

import com.swpproject.application.model.Exercise;
import com.swpproject.application.controller.dto.ExerciseDTOIn;
import com.swpproject.application.controller.dto.ExerciseDTOOut;
import com.swpproject.application.controller.dto.RoleDTO;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Service
public interface ExerciseService {
    @Transactional
    List<Exercise> getExerciseListAuthentication(RoleDTO roleDTO);

    @Transactional
    List<ExerciseDTOOut> getExerciseDTOOutList(RoleDTO roleDTO);

    @Transactional
    Optional<Exercise> findExerciseById(int exerciseId, RoleDTO roleDTO);

    @Transactional
    void create(ExerciseDTOIn exerciseDTOIn, RoleDTO roleDTO) throws IOException;

    @Transactional
    void update(ExerciseDTOIn exerciseDTOIn, int exerciseId) throws IOException;
}
