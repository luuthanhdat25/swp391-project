package com.swpproject.application.controller.authentication;

import com.swpproject.application.model.Gymer;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.model.SchedulePersonalTrainer;
import com.swpproject.application.service.*;
import com.swpproject.application.model.Account;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.swpproject.application.enums.*;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Random;

import static com.swpproject.application.utils.SessionUtils.*;

@RequestMapping("/auth")
@Controller
public class AuthenticationController {

    private static final int MIN_LENGTH_PASSWORD = 8;
    private static final int MAX_LENGTH_PASSWORD = 20;

    @Autowired
    private AccountService accountService;
    @Autowired
    private EmailService emailService;
    @Autowired
    private PersonalTrainerService personalTrainerService;

    @Autowired
    private CertificateService certificateService;

    @Autowired
    private GymerService gymerService;
    @Autowired
    private SchedulePersonalTrainerService schedulePersonalTrainerService;
    @Autowired
    private GymerService gymerService;
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

        // Check valid type password
        if( account.getPassword().length() < MIN_LENGTH_PASSWORD ||
            account.getPassword().length() > MAX_LENGTH_PASSWORD ) {
            redirectAttributes.addFlashAttribute("MSG", "Password must at least 8 characters and at most 20 characters");
            session.setAttribute("password", "password");
            return "redirect:/auth/registration";
        }

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

    @GetMapping("/certificate")
    public String authCertificates() {
        return "authentication/upload-certificate";
    }

    @PostMapping("/certificate")
    public String uploadImages(@RequestParam("file1") MultipartFile file1,
                               @RequestParam("file2") MultipartFile file2,
                               @RequestParam("file3") MultipartFile file3) {

        try {
            System.out.println(file1.getOriginalFilename() + file1.getBytes());
            certificateService.save(file1.getOriginalFilename(), file1.getBytes());
            certificateService.save(file2.getOriginalFilename(), file2.getBytes());
            certificateService.save(file3.getOriginalFilename(), file3.getBytes());
        } catch (IOException e) {
            e.printStackTrace();
            return "Error uploading images.";
        }

        return "redirect:/login";
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
            removeAttributes(session, "email", "password");
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
        if(sysOtp.equals(userOtp)) {
            Account account = (Account)session.getAttribute("account");
            accountService.save(account);
            if(account.getRole().equals(Role.PT)) {
                PersonalTrainer personalTrainer = new PersonalTrainer();
                personalTrainer.setAccount(account);
                personalTrainer.setPrice(0);
                personalTrainer.setIsActive(false);
                personalTrainerService.save(personalTrainer);
                SchedulePersonalTrainer schedulePersonalTrainerEntity = new SchedulePersonalTrainer();
                schedulePersonalTrainerEntity.setPersonalTrainer(personalTrainer);

                session.setAttribute("personalTrainer", personalTrainer);
                return "redirect:/auth/certificate";
            } else {
                Gymer gymer = new Gymer();
                gymer.setAccount(account);

                gymerService.save(gymer);
            }
            removeAttributes(session, "digit1", "digit2", "digit3", "digit4", "digit5", "digit6","rptPassword","fRptPassword","sysOtp");
            redirectAttributes.addFlashAttribute("MSG","Account created successfully! " +
                    "You can login into website now!");
            return "redirect:/auth/login?successfully";
        } else {
            redirectAttributes.addFlashAttribute("MSG","Incorrect OTP Code! Try again.");
        }
        return "redirect:/auth/otp";
    }

    // FORGOT PASSWORD
    @GetMapping("/forgot")
    public String forgot() {
        return "authentication/forgot-password";
    }

    @GetMapping("/fotgot/otp")
    public String sendOtp(HttpSession session, @RequestParam("email") String email) {

        session.setAttribute("email", email);
        Optional<Account> optionalAccount = accountService.getAccountByEmail(email);
        if(optionalAccount.isPresent()) {
            if(session.getAttribute("wrongEmail")!=null) session.removeAttribute("wrongEmail");
            String otp = String.valueOf(100000
                    + new Random().nextInt(900000));
            emailService.sendOTPEmail(email, otp);
            session.setAttribute("sysOtp", otp);
            session.setAttribute("isSent", true);
        } else {
            session.setAttribute("wrongEmail", "This email is not exist in system! Please enter correct email!");
        }
        return "authentication/forgot-password";
    }

    @PostMapping("/forgot/otp")
    public String checkOtp( HttpSession session,
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
        if(session.getAttribute("sysOtp")!=null) {
            String sysOtp = session.getAttribute("sysOtp").toString();
            if(sysOtp.equals(userOtp)) {
                session.setAttribute("validOtp", "OTP Code verified successfully! Change your password here!");
                return "redirect:/auth/recover";
            }
        }
        session.setAttribute("digit1", digit1);
        session.setAttribute("digit2", digit2);
        session.setAttribute("digit3", digit3);
        session.setAttribute("digit4", digit4);
        session.setAttribute("digit5", digit5);
        session.setAttribute("digit6", digit6);
        session.setAttribute("wrongOtp", "Your OTP is not correct!");
        return "authentication/forgot-password";
    }

    @GetMapping("/recover")
    public String showRecoveryForm() {
        return "authentication/confirm-password";
    }

    @PostMapping("/recover")
    public String recovery( @RequestParam("password") String password,
                            @RequestParam("rPassword") String rPassword,
                            HttpSession session) {

        removeAttributes(session, "wrongOtp", "digit1", "digit2", "digit3", "digit4", "digit5", "digit6","isSent","sysOtp", "validOtp");

        session.setAttribute("password",password);
        session.setAttribute("rPassword",rPassword);

        if(!password.equals(rPassword)) {
            return "redirect:/auth/recover?failed";
        }

        String email = (String) session.getAttribute("email");

        Account account = accountService.getAccountByEmail(email).get();

        if(password.equals(account.getPassword())) {
            return "redirect:/auth/recover?duplicated";
        }

        account.setPassword(password);
        accountService.save(account);
        System.out.println(account);
        return "redirect:/auth/login?successfully";
    }

}
