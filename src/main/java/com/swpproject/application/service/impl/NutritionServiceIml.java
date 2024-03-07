package com.swpproject.application.service.impl;

import com.swpproject.application.model.Nutrition;
import com.swpproject.application.model.NutritionDTOIn;
import com.swpproject.application.model.NutritionDTOOut;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.repository.NutritionRepository;
import com.swpproject.application.repository.PersonalTrainerRepository;
import com.swpproject.application.service.NutritionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public List<Nutrition> getNutritionList() {return nutritionRepository.findAll();}

    @Override
    public List<NutritionDTOOut> getNutritionDTOOutList() {
        return nutritionRepository.findAll()
                .stream()
                .map(Nutrition::getNutritionDTOOut)
                .collect(Collectors.toList());
    }

    @Override
    public Optional<Nutrition> findNutritionById(int id) {return nutritionRepository.findById(id);}


    @Override
    public void create(NutritionDTOIn nutritionDTOIn) throws IOException {
        Nutrition nutrition = new Nutrition();
        nutrition.setName(nutritionDTOIn.getNutritionName());
        nutrition.setCaloIn(nutritionDTOIn.getCalories());
        nutrition.setProtein(nutritionDTOIn.getProtein());
        nutrition.setFat(nutritionDTOIn.getFat());
        nutrition.setCarb(nutritionDTOIn.getCarb());
        nutrition.setImageDescription(nutritionDTOIn.getImage().getBytes());

        String isPrivateString = nutritionDTOIn.getIsPrivate();
        int isPrivateBoolean = isPrivateString == null ? 0 : 1;
        nutrition.setIsPrivate(isPrivateBoolean);

        PersonalTrainer personalTrainerExample = personalTrainerRepository.findAll().getFirst();
        nutrition.setPersonalTrainer(personalTrainerExample);

        nutritionRepository.save(nutrition);
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
        if(nutritionDTOIn.getImage().getBytes().length != 0) nutrition.setImageDescription(nutritionDTOIn.getImage().getBytes());
        nutritionRepository.save(nutrition);
    }
}
