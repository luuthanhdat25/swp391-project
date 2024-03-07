package com.swpproject.application.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LandingPageController {
    @RequestMapping(value= "/",method = RequestMethod.GET, produces = "text/html; charset= UTF-8")
    public String landing() {
        return "landing-page";
    }

    @RequestMapping(value= "/welcome",method = RequestMethod.GET, produces = "text/html; charset= UTF-8")
    public String welcome() {
        return "landing-page";
    }
}
