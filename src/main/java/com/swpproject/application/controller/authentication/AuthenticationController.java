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
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.swpproject.application.enums.*;
import java.time.LocalDate;
import java.util.Optional;
import java.util.Random;

@RequestMapping("/auth")
@Controller
public class AuthenticationController {

    @Autowired
    private AccountService accountService;
    @Autowired
    private EmailService emailService;
    @Autowired
    private PersonalTrainerService personalTrainerService;

    @ModelAttribute("roles")
    public Role[] getRoles() {
        return Role.values();
    }

    @ModelAttribute("genders")
    public Gender[] getGenders() {
        return Gender.values();
    }

    // REGISTRATION
    @GetMapping(value = "/registration", produces = "text/html; charset=UTF-8")
    public String showRegistrationForm() {
        return "authentication/registration";
    }

    @PostMapping("/registration")
    public String registerAccount(@ModelAttribute("account") Account account,
                                  @RequestParam String rptPassword,
                                  RedirectAttributes redirectAttributes,
                                  HttpSession session) {

        session.setAttribute("account",account);
        session.setAttribute("rptPassword",rptPassword);
        // Check if fullName contains any number or special character
        if (!account.getFullName().matches("^[a-zA-Z ]+$")) {
            redirectAttributes.addFlashAttribute("MSG", "Please enter a valid full name. " +
                    "The full name should only contain alphabet characters and spaces.");
            session.setAttribute("fullname", "fullname");
            return "redirect:/auth/registration";
        }
        session.removeAttribute("fullname");
        // Check if the email is already taken
        if (accountService.getAccountByEmail(account.getEmail()).isPresent()) {
            redirectAttributes.addFlashAttribute("MSG", "This email is already taken!");
            session.setAttribute("email", "email");
            return "redirect:/auth/registration";
        }
        session.removeAttribute("email");
        // Check if passwords match
        if (!account.getPassword().equals(rptPassword)) {
            redirectAttributes.addFlashAttribute("MSG", "Repeat password does not match!");
            session.setAttribute("fRptPassword", "fRptPassword");
            return "redirect:/auth/registration";
        }
        session.removeAttribute("fRptPassword");
        // Check if birthday exceed or equal today
        if(LocalDate.now().isBefore(account.getBirthday())) {
            redirectAttributes.addFlashAttribute("MSG", "Birthday must not exceed today!");
            session.setAttribute("birthday", "birthday");
            return "redirect:/auth/registration";
        }
        session.removeAttribute("birthday");
        account.setIsBan(false);
        session.setAttribute("account",account);
        return "redirect:/auth/otp";
    }



    // LOGIN
    @GetMapping("/login")
    public String showloginForm() {
        return "authentication/login";
    }

    @PostMapping("/login")
    public String loginAccount(@RequestParam String email, @RequestParam String password,
                               RedirectAttributes redirectAttributes, HttpSession session) {
        Optional<Account> account = accountService.getAccountByEmail(email);
        if(account.isPresent() && password.equals(account.get().getPassword())) {
            session.setAttribute("scheduleSlots", account);
            session.removeAttribute("email");
            session.removeAttribute("password");
            return "welcome";
        } else {
            session.setAttribute("email",email);
            session.setAttribute("password",password);
            return "redirect:/auth/login?failed";
        }
    }

    // LOG-OUT
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    // SEND-OTP
    @GetMapping("/otp")
    public String index(HttpSession session) {
        if(session.getAttribute("sysOtp")==null) {
            Account account = (Account) session.getAttribute("account");
            String otp = String.valueOf(100000
                    + new Random().nextInt(900000));
            emailService.sendOTPEmail(account.getEmail(), otp);
            session.setAttribute("sysOtp", otp);
        }
        return "authentication/otp";
    }

    @PostMapping("/otp")
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
            return "redirect:/auth/login?successfully";
        } else {
            redirectAttributes.addFlashAttribute("MSG","Incorrect OTP Code! Try again.");
        }
        return "redirect:/auth/otp";
    }
}
