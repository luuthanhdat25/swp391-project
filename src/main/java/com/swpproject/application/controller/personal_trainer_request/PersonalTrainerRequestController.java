package com.swpproject.application.controller.personal_trainer_request;

import com.swpproject.application.enums.RequestStatus;
import com.swpproject.application.model.Account;
import com.swpproject.application.model.Certificate;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.model.PersonalTrainerRequest;
import com.swpproject.application.repository.AccountRepository;
import com.swpproject.application.repository.CertificateRepository;
import com.swpproject.application.repository.PersonalTrainerRequestRepository;
import com.swpproject.application.service.CertificateService;
import com.swpproject.application.service.PersonalTrainerService;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Base64;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class PersonalTrainerRequestController {
    @Autowired
    private PersonalTrainerRequestRepository personalTrainerRequestRepository;
    @Autowired
    private CertificateService certificateService;
    @Autowired
    private PersonalTrainerService personalTrainerService;

    @RequestMapping(value = "/admin-home/manage-personal-trainer-request", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String viewManagePersonalTrainerRequest(ModelMap modelMap,
                                                   @RequestParam(name = "papeNo", defaultValue = "1") int papeNo,
                                                   @RequestParam(name = "title", defaultValue = "") String title) {
        int pageSize = 10;
        Pageable pageable = PageRequest.of(papeNo - 1, pageSize);
        Page<PersonalTrainerRequest> personalTrainerRequests = Page.empty();

        modelMap.put("IndexStarting", pageSize * (papeNo - 1) + 1);
        modelMap.addAttribute("CurrentPage", papeNo);
        modelMap.put("PersonalTrainerRequests", personalTrainerRequests);
        modelMap.put("title", title);

        if (title == null || title.isEmpty()) {

            List<PersonalTrainerRequest> personalTrainerRequestList = personalTrainerRequestRepository.findAll();
            Collections.sort(personalTrainerRequestList, Comparator.comparing(PersonalTrainerRequest::getTimeStamp).reversed());

            int fromIndex = Math.min((papeNo - 1) * pageSize, personalTrainerRequestList.size() - 1);
            int toIndex = Math.min(fromIndex + pageSize - 1, personalTrainerRequestList.size() - 1);
            if (fromIndex >= 0) {
                List<PersonalTrainerRequest> pageContent = personalTrainerRequestList.subList(fromIndex, toIndex + 1);
                personalTrainerRequests = new PageImpl<>(pageContent, pageable, personalTrainerRequestList.size());
            }
        } else {
            String titleLowerCase = title.toLowerCase();
            List<PersonalTrainerRequest> requestFilters = personalTrainerRequestRepository.findAll().stream()
                    .filter(request -> request.getTitle().toLowerCase().contains(titleLowerCase))
                    .collect(Collectors.toList());

            if (requestFilters.isEmpty()) {
                modelMap.addAttribute("TotalPage", personalTrainerRequests.getTotalPages());
                return "personalTrainerRequest/admin-home-manage-personal-trainer-request";
            }

            Collections.sort(requestFilters, Comparator.comparing(PersonalTrainerRequest::getTimeStamp).reversed());
            int fromIndex = Math.min((papeNo - 1) * pageSize, requestFilters.size() - 1);
            int toIndex = Math.min(fromIndex + pageSize - 1, requestFilters.size() - 1);
            List<PersonalTrainerRequest> pageContent = requestFilters.subList(fromIndex, toIndex + 1);
            personalTrainerRequests = new PageImpl<>(pageContent, pageable, requestFilters.size());
        }

        modelMap.put("PersonalTrainerRequestList", personalTrainerRequests);
        modelMap.addAttribute("TotalPage", personalTrainerRequests.getTotalPages());
        return "personalTrainerRequest/admin-home-manage-personal-trainer-request";
    }

    @RequestMapping(value = "admin-home/approve-personal-trainer-request", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String approvePersonalTrainerRequest(@RequestParam("requestID") Integer requestID) {
        PersonalTrainerRequest request = personalTrainerRequestRepository.findById(requestID).get();
        request.setStatus(RequestStatus.APPROVED);
        PersonalTrainer personalTrainer = personalTrainerService.getPersonalTrainerById(request.getPersonalTrainerAccount().getId()).get();
        personalTrainer.setIsActive(true);
        personalTrainerService.save(personalTrainer);
        personalTrainerRequestRepository.save(request);
        return "forward:manage-personal-trainer-request";
    }

    @RequestMapping(value = "admin-home/reject-personal-trainer-request", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String rejectPersonalTrainerRequest(@RequestParam("requestID") Integer requestID) {
        PersonalTrainerRequest request = personalTrainerRequestRepository.findById(requestID).get();
        request.setStatus(RequestStatus.REJECTED);
        personalTrainerRequestRepository.save(request);
        return "forward:manage-personal-trainer-request";
    }

    @ResponseBody
    @GetMapping(value = "/get-personal-trainer-request-detail")
    public ResponseEntity<PersonalTrainerRequestDTO> getPersonalTrainerRequestDetail(@RequestParam int requestID) {
        PersonalTrainerRequest request = personalTrainerRequestRepository.findById(requestID).get();
        PersonalTrainerRequestDTO requestDTO = new PersonalTrainerRequestDTO();
        requestDTO.setId(request.getId());
        requestDTO.setPersonalTrainerID(request.getPersonalTrainerAccount().getId());
        requestDTO.setTitle(request.getTitle());
        requestDTO.setContent(request.getContent());
        requestDTO.setTimeStamp(request.getTimeStamp());
        requestDTO.setStatus(request.getStatus());
        requestDTO.setPersonalTrainerImage(request.getPersonalTrainerAccount().getAccount().getAvatarImage());
        requestDTO.setPersonalTrainerName(request.getPersonalTrainerAccount().getAccount().getFullName());

        List<byte[]> certificateDatas = certificateService.getAllCertificatesData(request.getPersonalTrainerAccount());
        requestDTO.setCerificate_1(certificateDatas.get(0));
        requestDTO.setCerificate_2(certificateDatas.get(1));
        requestDTO.setCerificate_3(certificateDatas.get(2));
        return ResponseEntity.ok().body(requestDTO);
    }
}

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
class PersonalTrainerRequestDTO {
    private Integer id;
    private Integer personalTrainerID;
    private String title;
    private String content;
    private LocalDateTime timeStamp;
    private RequestStatus status;
    private byte[] personalTrainerImage;
    private String personalTrainerName;

    private byte[] cerificate_1;
    private byte[] cerificate_2;
    private byte[] cerificate_3;
}