package com.swpproject.application.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class ViewProfilePersonalTrainer {

    @GetMapping("view-pt-details")
    public String view() {
        return "pt-profile-details";
    }
}
