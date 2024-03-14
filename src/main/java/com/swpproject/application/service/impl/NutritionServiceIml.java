package com.swpproject.application.service.impl;

import com.swpproject.application.controller.dto.RoleDTO;
import com.swpproject.application.enums.Role;
import com.swpproject.application.model.Exercise;
import com.swpproject.application.model.Nutrition;
import com.swpproject.application.dto.NutritionDTOIn;
import com.swpproject.application.dto.NutritionDTOOut;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.repository.NutritionRepository;
import com.swpproject.application.repository.PersonalTrainerRepository;
import com.swpproject.application.service.NutritionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class NutritionServiceIml implements NutritionService {

    @Autowired
    private NutritionRepository nutritionRepository;

    @Autowired
    private PersonalTrainerRepository personalTrainerRepository;

    @Override
    public List<Nutrition> getNutritionListAuthentication(RoleDTO roleDTO) {
        if (roleDTO == null)
            return nutritionRepository.findAllNonPrivate();

        return switch (roleDTO.getRole()) {
            case ADMIN -> nutritionRepository.findAll();
            case GYMER -> nutritionRepository.findAllNonPrivateOrPrivateForOrdersOnGoing(roleDTO.getId());
            default -> nutritionRepository.findAllNonPrivateOrByPersonalTrainerId(roleDTO.getId());
        };
    }

    @Override
    public List<NutritionDTOOut> getNutritionDTOOutList(RoleDTO roleDTO) {
        return getNutritionListAuthentication(roleDTO).stream()
                .map(Nutrition::getNutritionDTOOut).collect(Collectors.toList());
    }


    @Override
    public Optional<Nutrition> findNutritionById(int nutritionId, RoleDTO roleDTO) {
        if(roleDTO == null)
            return nutritionRepository.findNonPrivateById(nutritionId);

        return switch (roleDTO.getRole()) {
            case ADMIN -> nutritionRepository.findById(nutritionId);
            case GYMER -> nutritionRepository.findNonPrivateOrPrivateForOrdersOnGoingById(roleDTO.getId(), nutritionId);
            default -> nutritionRepository.findNonPrivateOrByPersonalTrainerId(roleDTO.getId(), nutritionId);
        };
    }


    @Override
    public void create(NutritionDTOIn nutritionDTOIn, RoleDTO roleDTO) throws IOException {
        Nutrition nutrition = new Nutrition();
        nutrition.setName(nutritionDTOIn.getNutritionName());
        nutrition.setCaloIn(nutritionDTOIn.getCalories());
        nutrition.setProtein(nutritionDTOIn.getProtein());
        nutrition.setFat(nutritionDTOIn.getFat());
        nutrition.setCarb(nutritionDTOIn.getCarb());
        nutrition.setImageDescription(nutritionDTOIn.getImage().getBytes());
        nutrition.setIsPrivate(isPrivateStringToInteger(nutritionDTOIn.getIsPrivate()));
        nutrition.setPersonalTrainer(getPersonalTrainerbyRoleDTO(roleDTO));
        nutritionRepository.save(nutrition);
    }

    private int isPrivateStringToInteger(String isPrivateString){return isPrivateString == null ? 0 : 1;}

    private PersonalTrainer getPersonalTrainerbyRoleDTO(RoleDTO roleDTO){
        return roleDTO.getRole() == Role.PT ?
                personalTrainerRepository.findById(roleDTO.getId()).get() : null;
    }


    @Override
    public void update(NutritionDTOIn nutritionDTOIn, int nutritionId) throws IOException {
        Nutrition nutrition = nutritionRepository.findById(nutritionId).get();
        nutrition.setName(nutritionDTOIn.getNutritionName());
        nutrition.setCaloIn(nutritionDTOIn.getCalories());
        nutrition.setProtein(nutritionDTOIn.getProtein());
        nutrition.setFat(nutritionDTOIn.getFat());
        nutrition.setCarb(nutritionDTOIn.getCarb());
        System.out.println(nutrition.getPersonalTrainer().getId());
        if(!isImageLengthEqualZero(nutritionDTOIn.getImage()))
            nutrition.setImageDescription(nutritionDTOIn.getImage().getBytes());
        nutritionRepository.save(nutrition);
    }

    private boolean isImageLengthEqualZero(MultipartFile image) throws IOException {
        return image.getBytes().length == 0;
    }
}
