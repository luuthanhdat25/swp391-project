package com.swpproject.application.service.impl;

import com.swpproject.application.dto.ExerciseDTOIn;
import com.swpproject.application.dto.ExerciseDTOOut;
import com.swpproject.application.dto.RoleDTO;
import com.swpproject.application.enums.Role;
import com.swpproject.application.model.*;
import com.swpproject.application.repository.ExerciseRepository;
import com.swpproject.application.repository.PersonalTrainerRepository;
import com.swpproject.application.service.ExerciseService;
import io.micrometer.common.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ExerciseServiceImpl implements ExerciseService {
    @Autowired
    private ExerciseRepository exerciseRepository;

    @Autowired
    private PersonalTrainerRepository personalTrainerRepository;

    @Override
    public List<ExerciseDTOOut> getExerciseDTOOutList(RoleDTO roleDTO) {
        return getExerciseListAuthentication(roleDTO).stream()
                .map(Exercise::getExerciseDTOOutSlim).collect(Collectors.toList());
    }


    @Override
    public List<Exercise> getExerciseListAuthentication(RoleDTO roleDTO) {
        if (roleDTO == null)
            return exerciseRepository.findAllNonPrivate();

        return switch (roleDTO.getRole()) {
            case ADMIN -> exerciseRepository.findAll();
            case GYMER -> exerciseRepository.findAllNonPrivateOrPrivateForOrdersOnGoing(roleDTO.getId());
            default -> exerciseRepository.findAllNonPrivateOrByPersonalTrainerId(roleDTO.getId());
        };
    }


    @Override
    public Optional<Exercise> findExerciseById(int exerciseId, RoleDTO roleDTO) {
        if(roleDTO == null)
            return exerciseRepository.findNonPrivateById(exerciseId);

        return switch (roleDTO.getRole()) {
            case ADMIN -> exerciseRepository.findById(exerciseId);
            case GYMER -> exerciseRepository.findNonPrivateOrPrivateForOrdersOnGoingById(roleDTO.getId(), exerciseId);
            default -> exerciseRepository.findNonPrivateOrByPersonalTrainerId(roleDTO.getId(), exerciseId);
        };
    }


    @Override
    public void create(ExerciseDTOIn exerciseDTOIn, RoleDTO roleDTO) throws IOException {
        Exercise exercise = new Exercise();
        exercise.setName(exerciseDTOIn.getExerciseName());
        exercise.setType(exerciseDTOIn.getMuscle());
        exercise.setDescription(addLineBreaks(exerciseDTOIn.getExerciseDescription()));
        exercise.setLevel(exerciseDTOIn.getLevelRadio());
        exercise.setEquipment(exerciseDTOIn.getEquipment());
        exercise.setVideoDescription(exerciseDTOIn.getYoutubeLink());
        exercise.setImageDescription(exerciseDTOIn.getImage().getBytes());
        exercise.setIsPrivate(isPrivateStringToInteger(exerciseDTOIn.getIsPrivate()));
        exercise.setPersonalTrainer(getPersonalTrainerbyRoleDTO(roleDTO));
        exerciseRepository.save(exercise);
    }

    private String addLineBreaks(String text) {
        if (StringUtils.isEmpty(text)) return "";
        return text.replaceAll("\\r?\\n", "<br>");
    }

    private int isPrivateStringToInteger(String isPrivateString){return isPrivateString == null ? 0 : 1;}

    private PersonalTrainer getPersonalTrainerbyRoleDTO(RoleDTO roleDTO){
        return roleDTO.getRole() == Role.PT ?
                personalTrainerRepository.findById(roleDTO.getId()).get() : null;
    }


    @Override
    public void update(ExerciseDTOIn exerciseDTOIn, int exerciseId) throws IOException {
        Exercise exercise = exerciseRepository.findById(exerciseId).get();
        exercise.setName(exerciseDTOIn.getExerciseName());
        exercise.setType(exerciseDTOIn.getMuscle());
        exercise.setDescription(addLineBreaks(exerciseDTOIn.getExerciseDescription()));
        exercise.setLevel(exerciseDTOIn.getLevelRadio());
        exercise.setEquipment(exerciseDTOIn.getEquipment());
        exercise.setVideoDescription(exerciseDTOIn.getYoutubeLink());
        if(!isImageLengthEqualZero(exerciseDTOIn.getImage()))
            exercise.setImageDescription(exerciseDTOIn.getImage().getBytes());
        exerciseRepository.save(exercise);
    }

    private boolean isImageLengthEqualZero(MultipartFile image) throws IOException {
        return image.getBytes().length == 0;
    }
}