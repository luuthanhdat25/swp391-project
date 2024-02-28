package com.swpproject.application.controller;

import com.swpproject.application.enums.Gender;
import com.swpproject.application.enums.Role;
import com.swpproject.application.model.Account;

import com.swpproject.application.service.AccountService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Map;

import static net.sf.jsqlparser.util.validation.metadata.NamedObject.user;

@Controller

public class AccountRegistrationController {

    @Autowired
    private AccountService accountService;

    @ModelAttribute("roles")
    public Role[] getRoles() {
        return Role.values();
    }

    @ModelAttribute("genders")
    public Gender[] getGenders() {
        return Gender.values();
    }


    @RequestMapping(value="/registration", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String showRegistrationForm() {
        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registerAccount(@ModelAttribute("account") Account account,
                                  @RequestParam String rptPassword,
                                  RedirectAttributes redirectAttributes,
                                  HttpSession session) {

        System.out.println(account);
        // Check if fullName contains any number or special character
        if (!account.getFullName().matches("^[a-zA-Z ]+$")) {
            redirectAttributes.addFlashAttribute("MSG", "Please enter a valid full name. " +
                                                                                 "The full name should only contain alphabet characters and spaces.");
            return "redirect:/registration";
        }

        // Check if the email is already taken
        if (accountService.findAccountByEmail(account.getEmail()).isPresent()) {
            redirectAttributes.addFlashAttribute("MSG", "This email is already taken!");
            return "redirect:/registration";
        }

        // Check if passwords match
        if (!account.getPassword().equals(rptPassword)) {
            redirectAttributes.addFlashAttribute("MSG", "Repeat password does not match!");
            return "redirect:/registration";
        }

        // Check if birthday exceed or equal today
        if(LocalDate.now().isBefore(account.getBirthday())) {
            redirectAttributes.addFlashAttribute("MSG", "Birthday must not exceed today!");
            return "redirect:/registration";
        }

        account.setBan(false);
        session.setAttribute("account",account);
        return "redirect:/otp";
    }


}