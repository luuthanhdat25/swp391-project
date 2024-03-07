package com.swpproject.application.repository;

import com.swpproject.application.model.Certificate;
import com.swpproject.application.model.PersonalTrainer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CertificateRepository extends JpaRepository<Certificate, Integer> {

    List<Certificate> getCertificatesByPersonalTrainer(PersonalTrainer personalTrainer);
}
