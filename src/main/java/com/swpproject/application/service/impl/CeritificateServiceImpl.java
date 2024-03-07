package com.swpproject.application.service.impl;

import com.swpproject.application.model.Certificate;
import com.swpproject.application.repository.CertificateRepository;
import com.swpproject.application.service.CertificateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CeritificateServiceImpl implements CertificateService {

    @Autowired
    private CertificateRepository certificateRepository;

    @Override
    public void save(Certificate certificate) {
        certificateRepository.save(certificate);
    }
}
