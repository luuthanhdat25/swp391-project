package com.swpproject.application.controller;

import org.apache.jasper.tagplugins.jstl.core.Redirect;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

@Controller
public class PersonalScheduleController {
    @GetMapping(value = "/view-personal-schedule")
    public String showPersonalSchedule() {
        // Add your controller logic here

        return "view-schedule"; // Return the view name
    }

    @GetMapping(value = "/selectWeek", params = {"week", "year"})
    public String showPersonalScheduleWithParams(@RequestParam("week") String week,
                                                 @RequestParam("year") String year,
                                                 RedirectAttributes attributes) {
        attributes.addAttribute("week", week);
        attributes.addAttribute("year", year);

        return "redirect:/view-personal-schedule"; // Redirect with parameters
    }

}
