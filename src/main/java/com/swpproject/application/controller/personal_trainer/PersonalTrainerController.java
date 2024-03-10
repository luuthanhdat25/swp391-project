package com.swpproject.application.controller.personal_trainer;

import com.swpproject.application.controller.dto.PersonalTrainerDto;
import com.swpproject.application.enums.Gender;
import com.swpproject.application.enums.Role;
import com.swpproject.application.model.Account;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.service.CertificateService;
import com.swpproject.application.utils.DtoUtils;
import com.swpproject.application.utils.JsonUtils;
import com.swpproject.application.repository.PersonalTrainerRepository;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/personal-trainer")
public class PersonalTrainerController {
    private final PersonalTrainerRepository personalTrainerRepository;
    private final CertificateService certificateService;
    private final DtoUtils dtoUtils;

    @Autowired
    public PersonalTrainerController(
            PersonalTrainerRepository personalTrainerRepository,
            CertificateService certificateService,
            DtoUtils dtoUtils
    ) {
        this.personalTrainerRepository = personalTrainerRepository;
        this.certificateService = certificateService;
        this.dtoUtils = dtoUtils;
    }
    @RequestMapping(value = "/", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getPersonalTrainerListPage(ModelMap model) {
        List<PersonalTrainerDto> personalTrainerDTOList = dtoUtils.getPersonalTrainerDtoList();
        String json = JsonUtils.jsonConvert(personalTrainerDTOList);
        model.addAttribute("personalTrainerList", json);
        return "personal-trainer-list";
    }


    @RequestMapping(value = "/details", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String view_profile_details(@RequestParam(name = "id", required = false) int id, ModelMap model) {
        Optional<PersonalTrainer> personalTrainer = personalTrainerRepository.findById(id);
        PersonalTrainerDto personalTrainerDTO = dtoUtils.convertPersonalTrainerToPersonalTrainerDto(personalTrainer.get());
        String json = JsonUtils.jsonConvert(personalTrainerDTO);
        model.addAttribute("personaltrainer", json);
        return "pt-profile-details";
    }


    // UPDATE PROFILE
    @GetMapping("update")
    public String showFormUpdate(@RequestParam int id,
                                 ModelMap model,
                                 HttpSession session) {
        PersonalTrainerDto personalTrainerDTO = dtoUtils.convertPersonalTrainerToPersonalTrainerDto(personalTrainerRepository.findById(id).get());
        String json = JsonUtils.jsonConvert(personalTrainerDTO);
        model.addAttribute("personalTrainerDto", json);
        session.setAttribute("personalTrainer", personalTrainerRepository.findById(id).get());
        return "profile-update";
    }

    @PostMapping("update")
    public String updateProfile(@RequestParam int id,
                                @RequestParam("fullname") String fullname,
                                @RequestParam("phone") String phone,
                                @RequestParam("gender") String gender,
                                @RequestParam("birthday") String birthday,
                                @RequestParam("address") String address,
                                @RequestParam("price") String price,
                                @RequestParam("avatar") MultipartFile avatar) throws IOException {
        PersonalTrainer personalTrainer = personalTrainerRepository.findById(id).get();
        Account account = personalTrainer.getAccount();
        account.builder()
                .fullName(fullname)
                .phone(phone)
                .avatarImage(avatar.getBytes())
                .gender(Gender.valueOf(gender))
                .address(address)
                .birthday(LocalDate.parse(birthday, DateTimeFormatter.ofPattern("yyyy-MM-dd")))
                .build();
        personalTrainer.setAccount(account);
        personalTrainer.setPrice(Integer.valueOf(price));
        personalTrainerRepository.save(personalTrainer);
        return "redirect:/personal-trainer/details?id=" + id;
    }


}


