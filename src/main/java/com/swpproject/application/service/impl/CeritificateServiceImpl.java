package com.swpproject.application.service.impl;

import com.swpproject.application.model.Certificate;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.repository.CertificateRepository;
import com.swpproject.application.service.CertificateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CeritificateServiceImpl implements CertificateService {

    @Autowired
    private CertificateRepository certificateRepository;

    @Override
    public void save(Certificate certificate) {
        certificateRepository.save(certificate);
    }

    @Override
    public List<Certificate> getCertificatesByPersonalTrainer(PersonalTrainer personalTrainer) {
        return certificateRepository.getCertificatesByPersonalTrainer(personalTrainer);
    }

    @Override
    public List<byte[]> getAllCertificatesData(PersonalTrainer personalTrainer) {
        return certificateRepository.getCertificatesByPersonalTrainer(personalTrainer)
                                    .stream()
                                    .map(Certificate::getImage)
                                    .toList();
    }
}
