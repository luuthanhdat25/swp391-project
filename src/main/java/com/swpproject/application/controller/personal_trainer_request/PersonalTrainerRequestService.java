package com.swpproject.application.controller.personal_trainer_request;

import com.swpproject.application.enums.RequestStatus;
import com.swpproject.application.model.Account;
import com.swpproject.application.model.Certificate;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.model.PersonalTrainerRequest;
import com.swpproject.application.repository.AccountRepository;
import com.swpproject.application.repository.CertificateRepository;
import com.swpproject.application.repository.PersonalTrainerRequestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class PersonalTrainerRequestService {
    @Autowired private PersonalTrainerRequestRepository personalTrainerRequestRepository;
    @Autowired private AccountRepository accountRepository;
    @Autowired private CertificateRepository certificateRepository;

    public void createUploadCertificate(List<Integer> certificateIDList, PersonalTrainer personalTrainerAccount) {
        List<Certificate> certificates = new ArrayList<>();
        StringBuilder requestContent = new StringBuilder();

        for (Integer certificateID: certificateIDList)
            certificates.add(certificateRepository.findById(certificateID).get());

        String TITLE = "Approve personal trainer's certifications";
        for (Certificate certificate: certificates) {
            requestContent.append("<img class=\"w-100 mb-2\" src=\"").append("data:image/jpeg;base64,")
                          .append(certificate.getImage().toString()).append("\">");
        }

        PersonalTrainerRequest personalTrainerRequest = new PersonalTrainerRequest();
        personalTrainerRequest.setPersonalTrainerAccount(personalTrainerAccount);
        personalTrainerRequest.setTimeStamp(LocalDateTime.now());
        personalTrainerRequest.setStatus(RequestStatus.PENDING);
        personalTrainerRequest.setTitle(TITLE);
        personalTrainerRequest.setContent(requestContent.toString());
        personalTrainerRequestRepository.save(personalTrainerRequest);
    }
}
