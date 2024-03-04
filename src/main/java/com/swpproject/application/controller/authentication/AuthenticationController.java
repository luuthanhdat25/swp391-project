package com.swpproject.application.controller.authentication;

import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.model.SchedulePersonalTrainer;
import com.swpproject.application.service.AccountService;
import com.swpproject.application.model.Account;
import com.swpproject.application.service.EmailService;
import com.swpproject.application.service.PersonalTrainerService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Optional;
import java.util.Random;

@RequestMapping("/auth")
@Controller
public class AccountLoginController {

    @Autowired
    private AccountService accountService;
    @Autowired
    private EmailService emailService;
    @Autowired
    private PersonalTrainerService personalTrainerService;

    @RequestMapping(value = "/login", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String showloginForm() {
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    public String loginAccount(@RequestParam String email, @RequestParam String password,
                               RedirectAttributes redirectAttributes, HttpSession session) {
        Optional<Account> account = accountService.getAccountByEmail(email);
        if(account.isPresent() && password.equals(account.get().getPassword())) {
            session.setAttribute("scheduleSlots", account);

            return "welcome";
        } else
        return "redirect:/login";
    }

    // LOG-OUT
    @RequestMapping(name = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    // SEND-OTP
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
            SchedulePersonalTrainer schedulePersonalTrainerEntity = new SchedulePersonalTrainer();
            schedulePersonalTrainerEntity.setPersonalTrainer(personalTrainer);
//            schedulePersonalTrainerService.save(schedulePersonalTrainerEntity);
            redirectAttributes.addFlashAttribute("MSG","Account created successfully! " +
                    "You can login into website now!");
            return "redirect:/login";
        } else {
            redirectAttributes.addFlashAttribute("MSG","Incorrect OTP Code! Try again.");
        }
        return "redirect:/otp";
    }
}
