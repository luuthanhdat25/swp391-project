package com.swpproject.application.service.impl;

import com.swpproject.application.enums.OrderStatus;
import com.swpproject.application.enums.Role;
import com.swpproject.application.model.*;
import com.swpproject.application.repository.ExerciseRepository;
import com.swpproject.application.repository.GymerRepository;
import com.swpproject.application.repository.OrderRepository;
import com.swpproject.application.repository.PersonalTrainerRepository;
import com.swpproject.application.service.ExerciseService;
import io.micrometer.common.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ExerciseServiceImpl implements ExerciseService {
    @Autowired
    private ExerciseRepository exerciseRepository;

    @Autowired
    private PersonalTrainerRepository personalTrainerRepository;

    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private GymerRepository gymerRepository;

    @Override
    public List<Exercise> getExerciseListAuthentication(RoleDTO roleDTO) {
        if(roleDTO == null){
            return exerciseRepository.findAll().stream()
                    .filter(exercise -> exercise.getIsPrivate() == 0)
                    .collect(Collectors.toList());

        }

        if(roleDTO.getRole() == Role.ADMIN) return exerciseRepository.findAll();

        if(roleDTO.getRole() == Role.GYMER){
            Optional<Gymer> gymerOptional = gymerRepository.findById(roleDTO.getId());
            if(gymerOptional.isEmpty()) return null;

            List<Orders> orders = orderRepository.findAllByGymer(gymerOptional.get());
            List<Integer> personalTrainerIdOnGoing = orders.stream()
                    .filter(order -> order.getStatus().equals(OrderStatus.OnDoing.toString()))
                    .map(order -> order.getPersonalTrainer().getId())
                    .toList();

            List<Exercise> exerciseList = new ArrayList<>();
            for (Exercise exercise : exerciseRepository.findAll()){
                if(exercise.getIsPrivate() == 0){
                    exerciseList.add(exercise);
                }else{
                    for (Integer personalTrainerId : personalTrainerIdOnGoing) {
                        if(exercise.getPersonalTrainer().getId() == personalTrainerId) {
                            exerciseList.add(exercise);
                        }
                    }
                }
            }

            return exerciseList;
        }

//        if(roleDTO.getRole() == Role.PT){
        return exerciseRepository.findAll().stream()
                .filter(exercise -> exercise.getIsPrivate() == 0
                        || exercise.getPersonalTrainer().getId() == roleDTO.getId())
                .collect(Collectors.toList());
    }

    @Override
    public List<ExerciseDTOOut> getExerciseDTOOutList(RoleDTO roleDTO) {
        return getExerciseListAuthentication(roleDTO)
                .stream()
                .map(Exercise::getExerciseDTOOutSlim)
                .collect(Collectors.toList());
    }

    @Override
    public Optional<Exercise> findExerciseById(int exerciseId, RoleDTO roleDTO) {
        if(roleDTO == null){
            return exerciseRepository.findAll().stream()
                    .filter(exercise -> exercise.getIsPrivate() == 0)
                    .filter(exercise -> exercise.getId() == exerciseId)
                    .findFirst();
        }

        if(roleDTO.getRole() == Role.ADMIN) return exerciseRepository.findById(exerciseId);

        if (roleDTO.getRole() == Role.GYMER) {
            Optional<Gymer> gymerOptional = gymerRepository.findById(roleDTO.getId());
            if(gymerOptional.isEmpty()) return Optional.empty();

            List<Orders> orders = orderRepository.findAllByGymer(gymerOptional.get());
            List<Integer> personalTrainerIdOnGoing = orders.stream()
                    .filter(order -> order.getStatus().equals(OrderStatus.OnDoing.toString()))
                    .map(order -> order.getPersonalTrainer().getId())
                    .toList();

            return exerciseRepository.findAll().stream()
                    .filter(exercise -> exercise.getIsPrivate() == 0
                            || personalTrainerIdOnGoing.contains(exercise.getPersonalTrainer().getId()))
                    .filter(exercise -> exercise.getId() == exerciseId)
                    .findFirst();
        }


        //if(roleDTO.getRole() == Role.PT){
        return exerciseRepository.findAll().stream()
                .filter(exercise -> exercise.getIsPrivate() == 0
                        || exercise.getPersonalTrainer().getId() == roleDTO.getId())
                .filter(exercise -> exercise.getId() == exerciseId)
                .findFirst();
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

        String isPrivateString = exerciseDTOIn.getIsPrivate();
        int isPrivateBoolean = isPrivateString == null ? 0 : 1;
        exercise.setIsPrivate(isPrivateBoolean);

        PersonalTrainer personalTrainerExample = roleDTO.getRole() == Role.PT ?
                personalTrainerRepository.findById(roleDTO.getId()).get() : null;

        exercise.setPersonalTrainer(personalTrainerExample);

        exerciseRepository.save(exercise);
    }

    private String addLineBreaks(String text) {
        if (StringUtils.isEmpty(text)) return "";
        return text.replaceAll("\\r?\\n", "<br>");
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
        System.out.println(exerciseDTOIn.getImage().getBytes().length);
        if(exerciseDTOIn.getImage().getBytes().length != 0) exercise.setImageDescription(exerciseDTOIn.getImage().getBytes());
        exerciseRepository.save(exercise);
    }
}