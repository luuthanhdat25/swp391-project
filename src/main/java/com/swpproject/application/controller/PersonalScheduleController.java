package com.swpproject.application.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PersonalScheduleController {
    @GetMapping(value = "/view-personal-schedule")
    public String showPersonalSchedule() {
        // Add your controller logic here

        return "view-schedule"; // Return the view name
    }



}
