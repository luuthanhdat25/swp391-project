package com.swpproject.application.repository;

import com.swpproject.application.model.PersonalTrainer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PersonalTrainerRepository extends JpaRepository<PersonalTrainer, Integer> {
    Optional<PersonalTrainer> findByAccount_AccountId(Integer accountId);
}