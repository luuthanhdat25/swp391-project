package com.swpproject.application.controller.personal_trainer;

import com.swpproject.application.model.Exercise;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.others.JsonUntils;
import com.swpproject.application.repository.AccountRepository;
import com.swpproject.application.repository.PersonalTrainerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/personal-trainer")
public class PersonalTrainerListController {
    @Autowired
    private PersonalTrainerRepository personalTrainerRepository;
    private AccountRepository accountRepository;

    @RequestMapping(value = "/", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getPersonalTrainerListPage(ModelMap model) {
        List<PersonalTrainer> list = personalTrainerRepository.findAll();
        for (PersonalTrainer child : list) {
            child.setAccount(accountRepository.findById(child.getId()).get());
        }
        String json = JsonUntils.jsonConvert(list);
        model.addAttribute("personalTrainerList", json);
        return "personal-trainer-list";
    }
}
