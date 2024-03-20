package com.swpproject.application.repository;

import com.swpproject.application.model.Account;
import com.swpproject.application.model.Account;
import com.swpproject.application.model.PersonalTrainer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface PersonalTrainerRepository extends JpaRepository<PersonalTrainer, Integer> {
    Optional<PersonalTrainer> findByAccountId(int accountId);

    Optional<PersonalTrainer> findPersonalTrainerByAccount_Email(String email);


    List<PersonalTrainer> findAllByIsActiveTrueAndAccountIsBanFalse();

    Optional<PersonalTrainer> findByIdAndIsActiveTrueAndAccountIsBanFalse(int personalTrainerId);
    Optional<PersonalTrainer> getPersonalTrainerById(int id);
}