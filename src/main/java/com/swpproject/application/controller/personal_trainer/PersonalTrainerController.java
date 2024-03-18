package com.swpproject.application.controller.personal_trainer;

import com.swpproject.application.dto.PersonalTrainerDto;
import com.swpproject.application.dto.RoleDTO;
import com.swpproject.application.enums.Gender;
import com.swpproject.application.model.Account;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.service.AccountService;
import com.swpproject.application.service.CertificateService;
import com.swpproject.application.service.PersonalTrainerService;
import com.swpproject.application.utils.DtoUtils;
import com.swpproject.application.utils.JsonUtils;
import com.swpproject.application.repository.PersonalTrainerRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/personal-trainer")
public class PersonalTrainerController {
    private static final DateTimeFormatter DATETIME_PATTERN = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    private final PersonalTrainerRepository personalTrainerRepository;
    private final CertificateService certificateService;
    private final DtoUtils dtoUtils;
    private final PersonalTrainerService personalTrainerService;

    private final AccountService accountService;

    @Autowired
    public PersonalTrainerController(
            PersonalTrainerRepository personalTrainerRepository,
            CertificateService certificateService,
            DtoUtils dtoUtils, PersonalTrainerService personalTrainerService,
            AccountService accountService
    ) {
        this.personalTrainerRepository = personalTrainerRepository;
        this.certificateService = certificateService;
        this.dtoUtils = dtoUtils;
        this.personalTrainerService = personalTrainerService;
        this.accountService = accountService;
    }

    @RequestMapping(value = "", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getPersonalTrainerListPage(ModelMap model, HttpServletRequest request) {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        List<PersonalTrainerDto> personalTrainerDTOList = personalTrainerService.getPersonalTrainerDTOList(roleDTO);
        String json = JsonUtils.jsonConvert(personalTrainerDTOList);
        model.addAttribute("personalTrainerList", json);
        return "personal-trainer-list";
    }


    @RequestMapping(value = "/details", method = RequestMethod.GET)
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
                                @ModelAttribute PersonalTrainerDto personalTrainerDto,
                                @RequestParam("avatar") MultipartFile avatar,
                                HttpSession session) throws IOException {
        PersonalTrainer personalTrainer = personalTrainerRepository.getPersonalTrainerById(personalTrainerDto.getId()).get() .toBuilder()
                .description(personalTrainerDto.getDescription())
                .bankName(personalTrainerDto.getBankName())
                .bankNumber(personalTrainerDto.getBankNumber())
                .price(personalTrainerDto.getPrice())
                .build();
        Account account = accountService.getAccountByEmail(personalTrainer.getAccount().getEmail()).get();
        account = account.toBuilder()
                .fullName(personalTrainerDto.getFullName())
                .phone(personalTrainerDto.getPhone())
                .birthday(LocalDate.parse(personalTrainerDto.getBirthday(),DATETIME_PATTERN))
                .gender(Gender.valueOf(personalTrainerDto.getGender()))
                .address(personalTrainerDto.getAddress())
                .build();

        if(!avatar.isEmpty()) {
            account.setAvatarImage(avatar.getBytes());
        }
        personalTrainer.setAccount(account);

        personalTrainer.setPrice(Integer.valueOf(personalTrainerDto.getPrice()));
        session.setAttribute("account", account);
        session.setAttribute("personalTrainer", personalTrainer);
        accountService.save(account);
        personalTrainerRepository.save(personalTrainer);
        return "redirect:/profile/details?ptid=" + id;
    }


}


