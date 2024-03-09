package com.swpproject.application.service;

import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.repository.PersonalTrainerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.relational.core.sql.In;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public interface PersonalTrainerService {
    public void save(PersonalTrainer personalTrainer);
    public PersonalTrainer findPersonalTrainerByAccountID(int accountId);
    public PersonalTrainer findPersonalTrainerByEmail(String email);
    public Optional<PersonalTrainer> findByID(Integer id);

    public Optional<PersonalTrainer> findPersonalTrainerByID(Integer personalTrainerID);

}
