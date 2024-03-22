package com.swpproject.application.service;

import com.swpproject.application.dto.PersonalTrainerDto;
import com.swpproject.application.dto.RoleDTO;
import com.swpproject.application.model.Gymer;
import com.swpproject.application.model.PersonalTrainer;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public interface PersonalTrainerService {
    public void save(PersonalTrainer personalTrainer);
    public PersonalTrainer findPersonalTrainerByAccountID(int accountId);
    public PersonalTrainer findPersonalTrainerByEmail(String email);
    public Optional<PersonalTrainer> findByID(Integer id);

    public Optional<PersonalTrainer> findPersonalTrainerByID(Integer personalTrainerID);
    public List<PersonalTrainer> getAll();

    List<PersonalTrainer> getPersonalTrainerListAuthentication(RoleDTO roleDTO);

    List<PersonalTrainerDto> getPersonalTrainerDTOList(RoleDTO roleDTO);

    Optional<PersonalTrainer> findPersonalTrainerByIdAuthentication(int personalTrainerId, RoleDTO roleDTO);
    Optional<PersonalTrainer> getPersonalTrainerById(int id);

}
