package com.swpproject.application.service;

import com.swpproject.application.model.Certificate;
import org.springframework.stereotype.Service;

@Service
public interface CertificateService {
    void save(String fileName, byte[] data);
}
