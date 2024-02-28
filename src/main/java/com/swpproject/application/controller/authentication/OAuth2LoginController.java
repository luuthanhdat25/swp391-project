package com.swpproject.application.controller.authentication;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OAuth2LoginController {

    @RequestMapping(value = "/oauth2-login", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String showOAuth2LoginForm() {
        return "oauth2-login";
    }

}