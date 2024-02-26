package com.swpproject.application.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LandingPageController {

    @RequestMapping(value= "/asset",method = RequestMethod.GET, produces = "text/html; charset= UTF-8")
    public String index() {
        return "index";
    }
}
