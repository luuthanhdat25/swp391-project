package com.swpproject.application.controller;

import com.swpproject.application.model.PersonalTrainer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.List;

@Controller
public class ScheduleController {
    @RequestMapping(value = "/book-pt", method = RequestMethod.GET) //Click to book pt
    public String bookPTPage() {
        return "book-pt";
    }

    @PostMapping("/book-pt")
    public void processCheckboxes(@RequestBody String[] checkedCheckboxes) {
        if (checkedCheckboxes != null && checkedCheckboxes.length > 0) {
            // Process the data received from the client
            for (String checkbox : checkedCheckboxes) {
                System.out.println("Received checked checkbox: " + checkbox);
            }
        } else {
            System.out.println("No checked checkboxes received.");
        }
    }

    @RequestMapping(value = "/view-schedule", method = RequestMethod.GET) //Click to book pt
    public String viewSchedule() {
        return "view-schedule";
    }
}
