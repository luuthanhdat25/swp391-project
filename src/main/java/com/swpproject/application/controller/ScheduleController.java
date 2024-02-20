package com.swpproject.application.controller;

import com.swpproject.application.model.ScheduleDataEntity;
import com.swpproject.application.service.ScheduleDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

//ManhLD
@Controller
@SessionAttributes("id")
public class ScheduleController {

    @Autowired
    private ScheduleDataService scheduleDataService;

    @RequestMapping(value = "Schedule", method = RequestMethod.GET)
    public String Schedule(){
        return "calendar";
    }

    @PostMapping("/saveSchedule")
    public String saveSchedule(@RequestBody List<String> scheduleValues) {
        for (String value : scheduleValues) {
            String[] parts = value.split("-");
            if (parts.length == 2) {
                Integer slot = Integer.parseInt(parts[0]);
                Integer day = Integer.parseInt(parts[1]);
                Boolean isChecked = true; // Modify this based on your logic
                ScheduleDataEntity entity = new ScheduleDataEntity(slot, day, isChecked);
                scheduleDataService.saveOrUpdate(entity);
            }
        }
        return "redirect:/Schedule";
    }

}
