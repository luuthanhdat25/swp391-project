package com.swpproject.application.repository;

import com.swpproject.application.model.PersonalTrainerRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PersonalTrainerRequestRepository extends JpaRepository<PersonalTrainerRequest, Integer> {
}
