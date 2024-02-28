package com.swpproject.application.service;

import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.model.ScheduleDataEntity;
import com.swpproject.application.repository.PersonalTrainerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class PersonalTrainerService {
    @Autowired
    private PersonalTrainerRepository personalTrainerRepository;

    public void save(PersonalTrainer personalTrainer) {
        personalTrainerRepository.save(personalTrainer);
    }
    public PersonalTrainer findPersonalTrainerByAccountID(int accountId){
        Optional<PersonalTrainer> personalTrainerOptional = personalTrainerRepository.findByAccount_AccountId(accountId);
        return personalTrainerOptional.orElse(null);
    }
}