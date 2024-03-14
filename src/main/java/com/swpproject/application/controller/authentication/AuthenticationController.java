package com.swpproject.application.controller.authentication;

import com.swpproject.application.dto.Base64Dto;
import com.swpproject.application.controller.personal_trainer_request.PersonalTrainerRequestService;
import com.swpproject.application.model.*;
import com.swpproject.application.repository.OrderRequestRepository;
import com.swpproject.application.service.*;
import com.swpproject.application.service.impl.ScheduleServiceImplement;
import com.swpproject.application.utils.PasswordUtils;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.swpproject.application.enums.*;

import java.util.*;
import static com.swpproject.application.utils.ProfileUtils.*;

import static com.swpproject.application.utils.SessionUtils.*;

@RequestMapping("/auth")
@Controller
public class AuthenticationController {

    private static final String BASE_IMG = "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";

    private static final String BASE_DESC_1 = "Hey there! I'm ";
    private static final String BASE_DESC_2 = ", a passionate fitness enthusiast on a journey to embrace a healthier and more active lifestyle. Fitness isn't just a hobby for me; it's a way of life. I believe in the transformative power of exercise and its ability to boost not only physical well-being but also mental and emotional health.";

    @Autowired
    private AccountService accountService;
    @Autowired
    private EmailService emailService;
    @Autowired
    private PersonalTrainerService personalTrainerService;
    @Autowired
    private ScheduleService scheduleService;

    @Autowired
    private CertificateService certificateService;

    @Autowired
    private GymerService gymerService;
    @Autowired
    private SchedulePersonalTrainerService schedulePersonalTrainerService;
    @Autowired
    private ScheduleServiceImplement scheduleServiceImplement;

    @Autowired
    PersonalTrainerRequestService personalTrainerRequestService; // Bao them vao

    @Autowired
    OrderRequestRepository orderRequestRepository;

    @ModelAttribute("roles")
    public Role[] getRoles() {
        return Role.values();
    }

    @ModelAttribute("genders")
    public Gender[] getGenders() {
        return Gender.values();
    }

    @ModelAttribute("goals")
    public Goal[] getGoals() {
        return Goal.values();
    }

    // REGISTRATION
    @GetMapping(value = "/registration", produces = "text/html; charset=UTF-8")
    public String showRegistrationForm() {
        return "authentication/registration";
    }

    @PostMapping("/registration")
    public String registerAccount(@ModelAttribute("account") Account account,
                                  @RequestParam(value = "selectedGoal", required = false) String selectedGoal,
                                  @RequestParam String rptPassword,
                                  RedirectAttributes redirectAttributes,
                                  HttpSession session) {


        System.out.println("goal --> " + selectedGoal);
        session.setAttribute("account", account);
        session.setAttribute("rptPassword", rptPassword);
        // Check if fullName contains any number or special character
        if (!isValidName(account.getFullName())) {
            redirectAttributes.addFlashAttribute("MSG", "Please enter a valid full name. " + "The full name should only contain alphabet characters and spaces.");
            session.setAttribute("fullname", "fullname");
            return "redirect:/auth/registration";
        }
        session.removeAttribute("fullname");
        // Check if the email is already taken
        if(!isValidEmail(account.getEmail())) {
            redirectAttributes.addFlashAttribute("MSG", "Invalid Email Address!");
            session.setAttribute("email", "email");
            return "redirect:/auth/registration";
        }
        if (accountService.getAccountByEmail(account.getEmail()).isPresent()) {
            redirectAttributes.addFlashAttribute("MSG", "This email is already taken!");
            session.setAttribute("email", "email");
            return "redirect:/auth/registration";
        }
        session.removeAttribute("email");

        // Check valid type password
        if (!isValidPasword(account.getPassword())) {
            redirectAttributes.addFlashAttribute("MSG", "Password must at least 8 characters and at most 20 characters");
            session.setAttribute("password", "password");
            return "redirect:/auth/registration";
        }

        // Check if passwords match
        if (!isPasswordMatches(account.getPassword(),rptPassword)) {
            redirectAttributes.addFlashAttribute("MSG", "Repeat password does not match!");
            session.setAttribute("fRptPassword", "fRptPassword");
            return "redirect:/auth/registration";
        }
        session.removeAttribute("fRptPassword");
        // Check if birthday exceed or equal today
        if (!isValidBirthday(account.getBirthday())) {
            redirectAttributes.addFlashAttribute("MSG", "Birthday must not exceed today!");
            session.setAttribute("birthday", "birthday");
            return "redirect:/auth/registration";
        }
        session.removeAttribute("birthday");
        account.setIsBan(false);
        session.setAttribute("account", account);
        session.setAttribute("goal", selectedGoal);
        return "redirect:/auth/otp";
    }

    // SEND-OTP
    @GetMapping("/otp")
    public String index(HttpSession session) {
        Account account = (Account) session.getAttribute("account");
        String otp = String.valueOf(100000 + new Random().nextInt(900000));
        emailService.sendOTPEmail(account.getEmail(), otp);
        session.setAttribute("sysOtp", otp);
        return "authentication/otp";
    }

    @PostMapping("/otp")
    public String verifiOtp(RedirectAttributes redirectAttributes, HttpSession session, @RequestParam String digit1, @RequestParam String digit2, @RequestParam String digit3, @RequestParam String digit4, @RequestParam String digit5, @RequestParam String digit6) {

        String userOtp = new StringBuilder("").append(digit1).append(digit2).append(digit3).append(digit4).append(digit5).append(digit6).toString();
        String sysOtp = session.getAttribute("sysOtp").toString();
        if (sysOtp.equals(userOtp)) {
            Account account = (Account) session.getAttribute("account");
            if (account.getRole().equals(Role.PT)) {
                return "redirect:/auth/certificate";
            } else {
                String desc = new StringBuilder(BASE_DESC_1).append(account.getFullName()).append(BASE_DESC_2).toString();
                System.out.println(desc);
                account.setPassword(PasswordUtils.hashPassword(account.getPassword()));
                account.setAvatarImage(Base64.getDecoder().decode(BASE_IMG.getBytes()));
                accountService.save(account);
                Gymer gymer = new Gymer();
                gymer.setGoal(Goal.valueOf((String)session.getAttribute("goal")));
                gymer.setDescription(desc);
                gymer.setWeight(0.0f);
                gymer.setHeight(0.0f);
                gymer.setDescription(desc);
                gymer.setAccount(account);
                gymerService.save(gymer);
                Schedule scheduleGymer = new Schedule();
                scheduleGymer.setGymer(gymer);
                scheduleService.save(scheduleGymer);
            }
            removeAttributes(session, "digit1", "digit2", "digit3", "digit4", "digit5", "digit6", "rptPassword", "fRptPassword", "sysOtp");
            redirectAttributes.addFlashAttribute("MSG", "Account created successfully! " + "You can login into website now!");
            return "redirect:/auth/login?successfully";
        } else {
            redirectAttributes.addFlashAttribute("MSG", "Incorrect OTP Code! Try again.");
        }
        return "redirect:/auth/otp";
    }

    @GetMapping("/certificate")
    public String authCertificates() {
        return "authentication/upload-certificate";
    }

    @PostMapping("/certificate")
    public String uploadImages(@RequestBody Base64Dto base64Strings,
                               HttpSession session) {
        Account account = (Account) session.getAttribute("account");
        account.setPassword(PasswordUtils.hashPassword(account.getPassword()));
        account.setAvatarImage(Base64.getDecoder().decode(BASE_IMG.getBytes()));
        accountService.save(account);
        PersonalTrainer personalTrainer = new PersonalTrainer();
        personalTrainer.setAccount(account);
        personalTrainer.setPrice(0);
        personalTrainer.setIsActive(false);
        String desc = new StringBuilder(BASE_DESC_1).append(account.getFullName()).append(BASE_DESC_2).toString();
        personalTrainer.setDescription(desc);
        personalTrainerService.save(personalTrainer);

        List<Integer> certificateIDs = new ArrayList<>(); // Bao them vao
        base64Strings.base64Strings().forEach(item -> {
            item = item.trim().split(",")[1];
            byte[] imageAsByte = Base64.getDecoder().decode(item.getBytes());
            Certificate certificate = new Certificate();
            certificate.setImage(imageAsByte);
            certificate.setPersonalTrainer(personalTrainer);
            certificateService.save(certificate);

            Certificate certificateLast = certificateService.getCertificates().getLast(); // Bao them vao
            certificateIDs.add(certificateLast.getId()); // Bao them vao
        });

        personalTrainerRequestService.createUploadCertificate(certificateIDs, personalTrainer); // Bao them vao

        personalTrainerService.save(personalTrainer);
        Schedule schedulePersonalTrainer = new Schedule();
        schedulePersonalTrainer.setPersonalTrainer(personalTrainer);
        scheduleService.save(schedulePersonalTrainer);
        session.setAttribute("personalTrainer", personalTrainer);
        return "authentication/login";
    }

    // LOGIN
    @GetMapping("/login")
    public String showloginForm() {
        return "authentication/login";
    }

    @PostMapping("/login")
    public String loginAccount(@RequestParam String email,
                               @RequestParam String password,
                               HttpSession session,
                               HttpServletResponse response) {
        Optional<Account> account = accountService.getAccountByEmail(email);
        System.out.println(PasswordUtils.hashPassword("admin123"));
        String hashing = PasswordUtils.hashPassword(password);
        if (account.isPresent() && hashing.equals(account.get().getPassword())) {
            session.setAttribute("account",account);
            if (account.get().getRole().equals(Role.GYMER)) {
                Gymer gymer = gymerService.getGymerByAccount(account.get()).get();
                session.setAttribute("gymer", gymer);
//                OrderRequest orderRequest= (OrderRequest)orderRequestRepository.findByGymer(gymer);
//                session.setAttribute("order",orderRequest);
            }
            if (account.get().getRole().equals(Role.PT)) {
                PersonalTrainer personalTrainer = personalTrainerService.findPersonalTrainerByAccountID(account.get().getId());
                session.setAttribute("personalTrainer", personalTrainer);
            }
            if (account.get().getRole().equals(Role.ADMIN)) {

                return "redirect:/admin-home/manage-notification";
            }
            removeAttributes(session, "email", "password");
            session.setAttribute("account", account.get());
            return "redirect:/welcome";
        } else {
            /*session.setAttribute("email", email);
            session.setAttribute("password", password);
            throw new RuntimeException();*/
           return "redirect:/auth/login?failed";
        }
    }

    // LOG-OUT
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
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
        if (optionalAccount.isPresent()) {
            if (session.getAttribute("wrongEmail") != null) session.removeAttribute("wrongEmail");
            String otp = String.valueOf(100000 + new Random().nextInt(900000));
            emailService.sendOTPEmail(email, otp);
            session.setAttribute("sysOtp", otp);
            session.setAttribute("isSent", true);
        } else {
            session.setAttribute("wrongEmail", "This email is not exist in system! Please enter correct email!");
        }
        return "authentication/forgot-password";
    }

    @PostMapping("/forgot/otp")
    public String checkOtp(HttpSession session, @RequestParam String digit1, @RequestParam String digit2, @RequestParam String digit3, @RequestParam String digit4, @RequestParam String digit5, @RequestParam String digit6) {
        String userOtp = new StringBuilder("").append(digit1).append(digit2).append(digit3).append(digit4).append(digit5).append(digit6).toString();
        if (session.getAttribute("sysOtp") != null) {
            String sysOtp = session.getAttribute("sysOtp").toString();
            if (sysOtp.equals(userOtp)) {
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
    public String recovery(@RequestParam("password") String password, @RequestParam("rPassword") String rPassword, HttpSession session) {

        removeAttributes(session, "wrongOtp", "digit1", "digit2", "digit3", "digit4", "digit5", "digit6", "isSent", "sysOtp", "validOtp");

        session.setAttribute("password", password);
        session.setAttribute("rPassword", rPassword);

        if (!password.equals(rPassword)) {
            return "redirect:/auth/recover?failed";
        }

        String email = (String) session.getAttribute("email");

        Account account = accountService.getAccountByEmail(email).get();
        if (PasswordUtils.hashPassword(password).equals(account.getPassword())) {
            return "redirect:/auth/recover?duplicated";
        }
        account.setPassword(PasswordUtils.hashPassword(password));
        accountService.save(account);
        return "redirect:/auth/login?successfully";
    }

}
