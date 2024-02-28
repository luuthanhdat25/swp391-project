//package com.swpproject.application.controller;
//
////import com.swpproject.application.service.AccountService;
//import com.swpproject.application.model.Account;
//import com.swpproject.application.service.AccountService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.SessionAttributes;
//import org.springframework.web.servlet.mvc.support.RedirectAttributes;
//
//import java.util.Optional;
//
//@Controller
//@SessionAttributes("account")
//public class AccountLoginController {
//
//    @Autowired
//    private AccountService accountService;
//
//
//    @RequestMapping("/custom-login")
//    public String index() {
//        return "index";
//    }
//
//    @RequestMapping(value = "/login", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
//    public String showloginForm() {
//        return "login";
//    }
//
//    @RequestMapping(value = "/login", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
//    public String loginAccount(@RequestParam String email, @RequestParam String password,
//                               RedirectAttributes redirectAttributes) {
//        Optional<Account> account = accountService.findAccountByEmail(email);
//        if(account.isPresent() && password.equals(account.get().getPassword())) {
//            return "welcome";
//        } else
//            redirectAttributes.addFlashAttribute("fLogin", "Oops! Invalid login. Retry or use 'Forgot Password.' Contact support if needed. Thank you.");
//        return "redirect:/login";
//    }
//}
