package com.swpproject.application.service.impl;

import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.repository.PersonalTrainerRepository;
import com.swpproject.application.service.PersonalTrainerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class PersonalTrainerServiceImpl implements PersonalTrainerService {
    @Autowired
    private PersonalTrainerRepository personalTrainerRepository;

    public void save(PersonalTrainer personalTrainer) {
        personalTrainerRepository.save(personalTrainer);
    }
    public PersonalTrainer findPersonalTrainerByAccountID(int accountId){
        Optional<PersonalTrainer> personalTrainerOptional = personalTrainerRepository.findByAccountId(accountId);
        return personalTrainerOptional.orElse(null);
    }

    @Override
    public PersonalTrainer findPersonalTrainerByEmail(String email) {

        return personalTrainerRepository.findPersonalTrainerByAccount_Email(email).get();
    }
}
