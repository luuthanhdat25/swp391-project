package com.swpproject.application.controller;

import com.swpproject.application.model.Account;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.model.SchedulePersonalTrainerEntity;
import com.swpproject.application.service.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Random;

@Controller
public class AccountOTPController {

    @Autowired
    private AccountService accountService;
    @Autowired
    private EmailService emailService;
    @Autowired
    private PersonalTrainerService personalTrainerService;
    @Autowired
    private SchedulePersonalTrainerService schedulePersonalTrainerService;

    @RequestMapping(value="/otp", method = RequestMethod.GET,produces = "text/html; charset= UTF-8")
    public String index(HttpSession session) {
        if(session.getAttribute("sysOtp")==null) {
            Account account = (Account) session.getAttribute("account");
            String otp = String.valueOf(100000
                    + new Random().nextInt(900000));
            emailService.sendOTPEmail(account.getEmail(), otp);
            session.setAttribute("sysOtp", otp);
        }
        return "otp";
    }

    @RequestMapping(value="/otp", method = RequestMethod.POST,produces = "text/html; charset= UTF-8")
    public String verifiOtp(RedirectAttributes redirectAttributes, HttpSession session,
                            @RequestParam String digit1,
                            @RequestParam String digit2,
                            @RequestParam String digit3,
                            @RequestParam String digit4,
                            @RequestParam String digit5,
                            @RequestParam String digit6) {

        String userOtp = new StringBuilder("").append(digit1)
                .append(digit2)
                .append(digit3)
                .append(digit4)
                .append(digit5)
                .append(digit6).toString();
        String sysOtp = session.getAttribute("sysOtp").toString();
        System.out.println("sysOtp --> " + sysOtp + "userOtp --> " + userOtp);
        if(sysOtp.equals(userOtp)) {
            accountService.save((Account)session.getAttribute("account"));
            PersonalTrainer personalTrainer = new PersonalTrainer();
            personalTrainer.setAccount((Account)session.getAttribute("account"));
            personalTrainerService.save(personalTrainer);
            SchedulePersonalTrainerEntity schedulePersonalTrainerEntity = new SchedulePersonalTrainerEntity();
            schedulePersonalTrainerEntity.setPersonalTrainer(personalTrainer);
            schedulePersonalTrainerService.save(schedulePersonalTrainerEntity);
            redirectAttributes.addFlashAttribute("MSG","Account created successfully! " +
                    "You can login into website now!");
            return "redirect:/login";
        } else {
            redirectAttributes.addFlashAttribute("MSG","Incorrect OTP Code! Try again.");
        }
        return "redirect:/otp";

    }
}
