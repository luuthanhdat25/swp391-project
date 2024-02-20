package com.swpproject.application.repository;

import com.swpproject.application.model.PersonalTrainer;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PersonalTrainerRepository extends JpaRepository<PersonalTrainer, Integer> {
}