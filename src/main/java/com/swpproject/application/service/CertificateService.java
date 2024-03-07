package com.swpproject.application.service;

import com.swpproject.application.model.Certificate;
import com.swpproject.application.model.PersonalTrainer;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface CertificateService {
    void save(Certificate certificate);

    List<Certificate> getCertificatesByPersonalTrainer(PersonalTrainer personalTrainer);

    List<byte[]> getAllCertificatesData(PersonalTrainer personalTrainer);

}
