package com.swpproject.application.service;

import com.swpproject.application.model.Exercise;
import com.swpproject.application.dto.ExerciseDTOIn;
import com.swpproject.application.dto.ExerciseDTOOut;
import com.swpproject.application.dto.RoleDTO;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Service
public interface ExerciseService {
    List<Exercise> getExerciseListAuthentication(RoleDTO roleDTO);

    List<ExerciseDTOOut> getExerciseDTOOutList(RoleDTO roleDTO);

    Optional<Exercise> findExerciseById(int exerciseId, RoleDTO roleDTO);

    void create(ExerciseDTOIn exerciseDTOIn, RoleDTO roleDTO) throws IOException;

    void update(ExerciseDTOIn exerciseDTOIn, int exerciseId) throws IOException;
}
