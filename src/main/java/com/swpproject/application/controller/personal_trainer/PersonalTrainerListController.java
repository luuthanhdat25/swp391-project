package com.swpproject.application.controller.personal_trainer;

import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.utils.JsonUtils;
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
    @Autowired
    private AccountRepository accountRepository;

    @RequestMapping(value = "/", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getPersonalTrainerListPage(ModelMap model) {
        List<PersonalTrainer> list = personalTrainerRepository.findAll();
        String json = JsonUtils.jsonConvert(list);
        model.addAttribute("personalTrainerList", json);
        return "personal-trainer-list";
    }
}
