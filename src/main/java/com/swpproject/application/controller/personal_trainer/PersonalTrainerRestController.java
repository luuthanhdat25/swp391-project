package com.swpproject.application.controller.personal_trainer;

import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.repository.PersonalTrainerRepository;
import lombok.Getter;
import lombok.Setter;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/personal_trainer")
public class PersonalTrainerRestController {
    private final PersonalTrainerRepository personalTrainerRepository;

    public PersonalTrainerRestController(PersonalTrainerRepository personalTrainerRepository) {
        this.personalTrainerRepository = personalTrainerRepository;
    }

    @PostMapping("/search")
    public ResponseEntity<List<PersonalTrainer>> searchExercise(@RequestBody FilterObject filterObject) {
        List<PersonalTrainer> personalTrainerList = personalTrainerRepository.findAll();
        personalTrainerList = filterByName(filterObject.getSearchName(), personalTrainerList);
        personalTrainerList = filterByPrice(filterObject.getPriceMin(), filterObject.getPriceMax(), personalTrainerList);
        personalTrainerList = filterByDistance(filterObject.getDistanceMax(), personalTrainerList);
        personalTrainerList = filterByGender(filterObject.getGender(), personalTrainerList);
        return ResponseEntity.ok().body(personalTrainerList);
    }

    private List<PersonalTrainer> filterByName(String searchName, List<PersonalTrainer> personalTrainerList) {
        if(searchName.isEmpty()) return personalTrainerList;
        return personalTrainerList.stream()
                .filter(personalTrainer -> personalTrainer.getAccount().getFullName().contains(searchName))
                .collect(Collectors.toList());
    }

    private List<PersonalTrainer> filterByPrice(Integer priceMin, Integer priceMax, List<PersonalTrainer> personalTrainerList) {
        return personalTrainerList.stream()
                .filter(personalTrainer -> personalTrainer.getPrice() >= priceMin && personalTrainer.getPrice() <= priceMax)
                .collect(Collectors.toList());
    }

    private List<PersonalTrainer> filterByDistance(Integer distanceMax, List<PersonalTrainer> personalTrainerList){
        // Use Google map API
        return personalTrainerList;
    }

    private List<PersonalTrainer> filterByGender(String gender, List<PersonalTrainer> personalTrainerList){
        if(gender.isEmpty()) return personalTrainerList;
        return personalTrainerList.stream()
                .filter(personalTrainer -> personalTrainer.getAccount().getGender().getDesc().equalsIgnoreCase(gender))
                .collect(Collectors.toList());
    }
}

@Getter
@Setter
class FilterObject {
    private String searchName;
    private Integer priceMin;
    private Integer priceMax;
    private Integer distanceMax;
    private String gender;
}

