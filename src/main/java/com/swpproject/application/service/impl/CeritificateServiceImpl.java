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
    public void save(String fileName, byte[] data) {
        Certificate certificate = new Certificate();
        certificate.setFileName(fileName);
        certificate.setImage(data);
        certificateRepository.save(certificate);
    }
}
