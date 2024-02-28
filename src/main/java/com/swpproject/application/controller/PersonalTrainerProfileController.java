//package com.swpproject.application.controller;
//
//import com.swpproject.application.model.PersonalTrainer;
//import com.swpproject.application.repository.PersonalTrainerRepository;
//import jakarta.servlet.http.HttpServletRequest;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.SessionAttributes;
//
//@Controller
//@SessionAttributes("id")
//public class PersonalTrainerProfileController {
//    private PersonalTrainerRepository personalTrainerRepository;
//
//    @Autowired
//    public PersonalTrainerProfileController(PersonalTrainerRepository personalTrainerRepository) {
//        this.personalTrainerRepository = personalTrainerRepository;
//    }
//
//
//    @RequestMapping(value = "/personal-trainer/profile/update-profile", method = RequestMethod.GET)
//    public String updateProfile(@RequestParam int id, ModelMap model) {
//        PersonalTrainer personalTrainer = personalTrainerRepository.findById(id).get();
//        model.addAttribute("personalTrainer", personalTrainer);
//        return "update-profile";
//    }
//
//    @RequestMapping(value = "/personal-trainer/profile/update-profile", method = RequestMethod.POST)
//    public String updateProfile(ModelMap model, PersonalTrainer personalTrainer) {
//        personalTrainerRepository.save(personalTrainer);
//        System.out.println(personalTrainer.getPtId());
//        return "redirect:/";
//    }
//}
