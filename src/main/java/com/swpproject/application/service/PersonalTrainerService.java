package com.swpproject.application.service;

import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.repository.PersonalTrainerRepository;
import org.aspectj.weaver.patterns.PerObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public interface PersonalTrainerService {
    public void save(PersonalTrainer personalTrainer);
    public PersonalTrainer findPersonalTrainerByAccountID(int accountId);
    public PersonalTrainer findPersonalTrainerByEmail(String email);
    public List<PersonalTrainer> getAll();

    Optional<PersonalTrainer> getPersonalTrainerById(int id);

}
