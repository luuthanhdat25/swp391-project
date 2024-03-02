package com.swpproject.application.controller.authentication;

import com.swpproject.application.service.AccountService;
import com.swpproject.application.model.Account;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Optional;

@Controller
public class AccountLoginController {

    @Autowired
    private AccountService accountService;

    @RequestMapping(value = "/login", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String showloginForm() {
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
    public String loginAccount(@RequestParam String email, @RequestParam String password,
                               RedirectAttributes redirectAttributes, HttpSession session) {
        Optional<Account> account = accountService.findAccountByEmail(email);
        if(account.isPresent() && password.equals(account.get().getPassword())) {
            session.setAttribute("account", account);
            return "welcome";
        } else
        return "redirect:/login";
    }
}
