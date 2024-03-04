package com.swpproject.application.controller;

import com.swpproject.application.model.SlotExercise;
import com.swpproject.application.repository.SlotExeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class PersonalScheduleController {

    @Autowired
    private SlotExeRepository slotExeRepository;
    @GetMapping(value = "/view-personal-schedule")
    public String showPersonalSchedule() {
        // Add your controller logic here
        return "view-schedule"; // Return the view name
    }

    @GetMapping(value = "/selectWeek", params = {"week", "year"})
    public String showPersonalScheduleWithParams(@RequestParam("week") int week,
                                                 @RequestParam("year") int year,
                                                 RedirectAttributes attributes, Model model) {
        List<SlotExercise> slotExercises = slotExeRepository.findAll();
        slotExercises.forEach(System.out::println);
        String[] daysOfWeek = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};
        model.addAttribute("slotExercises", slotExercises);
        model.addAttribute("daysOfWeek", daysOfWeek);
        return "redirect:/view-personal-schedule?year=" + year + "&week=" + week;
    }
}
