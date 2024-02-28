package com.swpproject.application.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
public class PersonalScheduleController {
    @GetMapping(value = "/view-personal-schedule")
    public String showPersonalSchedule() {
        // Add your controller logic here

        return "view-schedule"; // Return the view name
    }

    @GetMapping(value = "/view-personal-schedule", params = {"week", "year"})
    public String showPersonalScheduleWithParams(@RequestParam("week") String week, @RequestParam("year") String year) {
        // Use the week and year values in your controller logic
        System.out.println("Week: " + week);
        System.out.println("Year: " + year);

        // Add your controller logic here
        return "redirect:/view-personal-schedule"; // Return the view name
    }
}
