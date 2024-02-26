package com.swpproject.application.controller;

import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.repository.PersonalTrainerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@Controller
@SessionAttributes("id")
public class WelcomeController {
    private PersonalTrainerRepository personalTrainerRepository;

    private PersonalTrainer clonePersonalTrainer;

    @Autowired
    public WelcomeController(PersonalTrainerRepository personalTrainerRepository) {
        this.personalTrainerRepository = personalTrainerRepository;
        PersonalTrainer newPersonalTrainer = new PersonalTrainer();
//        newPersonalTrainer.setName("Doan Minh Tri");
        newPersonalTrainer.setBankName("Example Bank");
        newPersonalTrainer.setBankNumber("1234567890");
//        newPersonalTrainer.setPhone("123-456-7890");
        newPersonalTrainer.setWeight(70.5);
        newPersonalTrainer.setHeight(175.0);
//        newPersonalTrainer.setEmail("tridm@gmail.com");
//        newPersonalTrainer.setDayOfBirth(LocalDate.now().plusYears(-20));
//        newPersonalTrainer.setLocation("City, Country");
//        newPersonalTrainer.setSex("Male");
        newPersonalTrainer.setPrice(50.0);
        newPersonalTrainer.setDescription("Experienced personal trainer with a focus on strength training.");
        clonePersonalTrainer = newPersonalTrainer;
        personalTrainerRepository.save(newPersonalTrainer);
    }

    @RequestMapping(value = "/welcome", method = RequestMethod.GET) //Return login.jsp
    public String wellComePage(ModelMap model) {
        PersonalTrainer personalTrainer = personalTrainerRepository.findById(clonePersonalTrainer.getId()).get();
        model.addAttribute("id", personalTrainer.getId());
        model.addAttribute("personTrainer", personalTrainer);
        return "welcome";
    }

    @RequestMapping(value = "/profile/change-password", method = RequestMethod.GET) //Return login.jsp
    public String wellComePage(@RequestParam long id, ModelMap model) {
        PersonalTrainer personalTrainer = personalTrainerRepository.findById(clonePersonalTrainer.getId()).get();
        model.addAttribute("id", personalTrainer.getId());
        model.addAttribute("personTrainer", personalTrainer);
        return "change-password";
    }

    @RequestMapping(value = "/profile/change-password", method = RequestMethod.POST)
    public String changePassword(@RequestParam String pass,
                                 @RequestParam String newPassword, @RequestParam String confirmPassword, ModelMap model) {

        // Check if the old password matches the stored password
        if (!pass.equals("tri")) {
            model.addAttribute("error", "Old password is incorrect.");
            return "change-password";
        }

        // Check if the new password and confirm password match
        if (!newPassword.equals(confirmPassword)) {
            model.addAttribute("error", "New password and confirm password do not match.");
            return "change-password";
        }

        // Update the password in the PersonalTrainer object and save it to the repository
//        personalTrainer.setPassword(newPassword);
//        personalTrainerRepository.save(personalTrainer);

        // Redirect to a success page or a profile page
        model.addAttribute("succes", "Change password successfully");
        return "redirect:/";
    }
}
