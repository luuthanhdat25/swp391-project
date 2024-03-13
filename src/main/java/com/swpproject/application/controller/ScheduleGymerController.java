package com.swpproject.application.controller;


import com.swpproject.application.model.Account;
import com.swpproject.application.model.Gymer;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.model.SlotExercise;
import com.swpproject.application.repository.SlotExeRepository;
import com.swpproject.application.service.GymerService;
import com.swpproject.application.service.SlotExcerciseEntityService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class ScheduleGymerController {

    @Autowired private SlotExeRepository slotExeRepository;
    @Autowired private SlotExcerciseEntityService slotExcerciseEntityService;
    @Autowired private GymerService gymerService;
    @GetMapping(value = "/view-gymer-schedule")
    public String showPTSchedule() {
        return "gymer-schedule";
    }

    @GetMapping(value = "/select-week", params = {"week", "year"})
    public String showPTScheduleWithParams(@RequestParam("week") int week,
                                           @RequestParam("year") int year,
                                           HttpSession session) {
        Gymer gymer = (Gymer) session.getAttribute("gymer");


        session.setAttribute("week", week);
        session.setAttribute("year", year);
        return "redirect:/view-pt-schedule?year=" + year + "&week=" + week;
    }



}
