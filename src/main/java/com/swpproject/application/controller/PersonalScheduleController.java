package com.swpproject.application.controller;

import com.swpproject.application.model.SlotExercise;
import com.swpproject.application.repository.SlotExeRepository;
import jakarta.servlet.http.HttpSession;
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
                                                 HttpSession session,
                                                 RedirectAttributes attributes) {
        List<SlotExercise> slotExercises = slotExeRepository.findSlotExeByWeekAndYearAndScheduleId(week, year, 1);
        session.setAttribute("slotExercises", slotExercises);
        return "redirect:/view-personal-schedule?year=" + year + "&week=" + week;
    }
}
