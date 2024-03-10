package com.swpproject.application.controller;

import com.swpproject.application.controller.dto.Base64Dto;
import com.swpproject.application.controller.dto.GymerDto;
import com.swpproject.application.enums.Gender;
import com.swpproject.application.enums.Goal;
import com.swpproject.application.enums.Role;
import com.swpproject.application.model.Account;
import com.swpproject.application.model.Gymer;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.service.AccountService;
import com.swpproject.application.service.GymerService;
import com.swpproject.application.service.PersonalTrainerService;
import com.swpproject.application.utils.DtoUtils;
import com.swpproject.application.utils.JsonUtils;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Base64;

import static com.swpproject.application.utils.ProfileUtils.*;

@RequestMapping("profile")
@Controller
public class ProfileController {

    private static final DateTimeFormatter DATETIME_PATTERN = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    @Autowired
    private AccountService accountService;

    @Autowired
    private GymerService gymerService;

    @Autowired
    private DtoUtils dtoUtils;

    @ModelAttribute("goals")
    public Goal[] getGoals() {
        return Goal.values();
    }

    @GetMapping("/details")
    public String viewProfile(HttpSession session, ModelMap model) {
        Account account = (Account) session.getAttribute("account");
        if(account.getRole().equals(Role.GYMER)) {
            Gymer gymer = (Gymer) session.getAttribute("gymer");
            GymerDto gymerDto = dtoUtils.convertGymerToGymerDto(gymer);
            String gymerDtoJson = JsonUtils.jsonConvert(gymerDto);
            model.addAttribute("gymerDtoJson", gymerDtoJson);
        } else {
            model.addAttribute("personalDtoJson", JsonUtils.jsonConvert(dtoUtils.convertPersonalTrainerToPersonalTrainerDto((PersonalTrainer) session.getAttribute("personalTrainer"))));
        }
        return "profile/profile-details";
    }

    @GetMapping("/update")
    public String viewUpdate(@RequestParam("id") int id) {
        return "profile/profile-update";
    }

    @PostMapping("/update")
    public String updateProfile(@ModelAttribute GymerDto gymerDto, HttpSession session,
                                @RequestParam("avatar") MultipartFile avatar) throws IOException {
        System.out.println(avatar.getBytes());

        Gymer gymer = gymerService.getGymerById(gymerDto.getId()).get() .toBuilder()
                                                                        .goal(Goal.valueOf(gymerDto.getGoal()))
                                                                        .height(gymerDto.getHeight())
                                                                        .weight(gymerDto.getWeight())
                                                                        .description(gymerDto.getDescription())
                                                                        .build();
        Account account = accountService.getAccountByEmail(gymer.getAccount().getEmail()).get();
        account = account.toBuilder()
                         .fullName(gymerDto.getFullName())
                         .phone(gymerDto.getPhone())
                         .birthday(LocalDate.parse(gymerDto.getBirthday(),DATETIME_PATTERN))
                         .gender(Gender.valueOf(gymerDto.getGender()))
                         .address(gymerDto.getAddress())
                         .build();
        if(avatar.getBytes() != Base64.getDecoder().decode(account.getAvatarImageAsString())) {
            account.setAvatarImage(avatar.getBytes());
        }

        gymer.setAccount(account);
        session.setAttribute("account", account);
        session.setAttribute("gymer", gymer);
        accountService.save(account);
        gymerService.save(gymer);
        return "redirect:/profile/details";
    }


}
