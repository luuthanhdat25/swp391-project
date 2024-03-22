package com.swpproject.application.service.impl;

import com.swpproject.application.dto.PersonalTrainerDto;
import com.swpproject.application.dto.RoleDTO;
import com.swpproject.application.enums.Role;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.repository.PersonalTrainerRepository;
import com.swpproject.application.service.PersonalTrainerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class PersonalTrainerServiceImpl implements PersonalTrainerService {
    @Override
    public  Optional<PersonalTrainer> findPersonalTrainerByID(Integer personalTrainerID) {
        return personalTrainerRepository.findById(personalTrainerID);
    }

    @Override
    public Optional<PersonalTrainer> findByID(Integer id) {
        return personalTrainerRepository.findById(id);
    }

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

    @Override
    public List<PersonalTrainer> getAll() {
        return personalTrainerRepository.findAll();
    }



    //Dat
    @Override
    public List<PersonalTrainer> getPersonalTrainerListAuthentication(RoleDTO roleDTO) {
        if (roleDTO == null || roleDTO.getRole() != Role.ADMIN)
            return personalTrainerRepository.findAllByIsActiveTrueAndAccountIsBanFalse();

        return personalTrainerRepository.findAll();
    }

    @Override
    public List<PersonalTrainerDto> getPersonalTrainerDTOList(RoleDTO roleDTO) {
        return getPersonalTrainerListAuthentication(roleDTO).stream()
                .map(PersonalTrainer::getPersonalTrainerDTOSlim).collect(Collectors.toList());
    }

    @Override
    public Optional<PersonalTrainer> findPersonalTrainerByIdAuthentication(int personalTrainerId, RoleDTO roleDTO) {
        if (roleDTO == null || roleDTO.getRole() != Role.ADMIN)
            return personalTrainerRepository.findByIdAndIsActiveTrueAndAccountIsBanFalse(personalTrainerId);

        return personalTrainerRepository.findById(personalTrainerId);
    }

    @Override
    public Optional<PersonalTrainer> getPersonalTrainerById(int id) {
        return personalTrainerRepository.getPersonalTrainerById(id);
    }
}
