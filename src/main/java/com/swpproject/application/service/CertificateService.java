package com.swpproject.application.service;

import com.swpproject.application.model.Certificate;
import com.swpproject.application.model.PersonalTrainer;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public interface CertificateService {
    void save(Certificate certificate);

    List<Certificate> getCertificatesByPersonalTrainer(PersonalTrainer personalTrainer);

    List<byte[]> getAllCertificatesData(PersonalTrainer personalTrainer);

    List<Certificate> getCertificates();

    @Transactional
    void removeCertificatesByPersonalTrainerId(Integer id);

}
