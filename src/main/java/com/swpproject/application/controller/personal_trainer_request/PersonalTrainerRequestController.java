package com.swpproject.application.controller.personal_trainer_request;

import com.swpproject.application.model.Account;
import com.swpproject.application.model.PersonalTrainerRequest;
import com.swpproject.application.repository.AccountRepository;
import com.swpproject.application.repository.PersonalTrainerRequestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDateTime;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class PersonalTrainerRequestController {
    @Autowired
    private PersonalTrainerRequestRepository personalTrainerRequestRepository;
    @Autowired
    private AccountRepository accountRepository;

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
                return "personalTrainerRequest/admin-home-view-personal-trainer-request-list";
            }

            Collections.sort(requestFilters, Comparator.comparing(PersonalTrainerRequest::getTimeStamp).reversed());
            int fromIndex = Math.min((papeNo - 1) * pageSize, requestFilters.size() - 1);
            int toIndex = Math.min(fromIndex + pageSize - 1, requestFilters.size() - 1);
            List<PersonalTrainerRequest> pageContent = requestFilters.subList(fromIndex, toIndex + 1);
            personalTrainerRequests = new PageImpl<>(pageContent, pageable, requestFilters.size());
        }

        modelMap.put("PersonalTrainerRequestList", personalTrainerRequests);
        modelMap.addAttribute("TotalPage", personalTrainerRequests.getTotalPages());
         return "personalTrainerRequest/admin-home-view-personal-trainer-request-list";
    }

    @RequestMapping(value = "admin-home/view-personal-trainer-request-detail", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getPersonalTrainerRequestDetail(ModelMap modelMap, @RequestParam("requestID") int requestID) {
        PersonalTrainerRequest request = personalTrainerRequestRepository.findById(requestID).get();
        modelMap.addAttribute("RequestDetail", request);
        return "personal-trainer-request/admin-home-view-request-detail";
    }

    @RequestMapping(value = "admin-home/create-personal-trainer-request-detail", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String createPersonalTrainerRequestDetail(@RequestParam("title") String requestTitle,
                                                     @RequestParam("content") String requestContent,
                                                     @RequestParam("personalTrainerAccountID") Integer personalTrainerAccountID) {
        PersonalTrainerRequest personalTrainerRequest = new PersonalTrainerRequest();
        Account account = accountRepository.findById(personalTrainerAccountID).get();

        personalTrainerRequest.setTitle(requestTitle);
        personalTrainerRequest.setContent(requestContent);
        personalTrainerRequest.setTimeStamp(LocalDateTime.now());
        personalTrainerRequest.setPersonalTrainerAccount(account);

        personalTrainerRequestRepository.save(personalTrainerRequest);
        return "forward:manage-personal-trainer-request";
    }
}
