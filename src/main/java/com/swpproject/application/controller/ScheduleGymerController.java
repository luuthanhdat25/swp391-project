package com.swpproject.application.controller;


import com.swpproject.application.model.Account;
import com.swpproject.application.model.Gymer;
import com.swpproject.application.model.SlotExercise;
import com.swpproject.application.service.GymerService;
import com.swpproject.application.service.SlotExcerciseEntityService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class ScheduleGymerController {


    @Autowired private SlotExcerciseEntityService slotExcerciseEntityService;
    @Autowired private GymerService gymerService;
    @RequestMapping("/Schedule-by-pt")
    public String getSchedulebyPt(HttpSession session, Model model,
                                  @RequestParam(value = "week",required = false) Integer week,
                                  @RequestParam(value = "year",required = false) Integer year,
                                  RedirectAttributes redirectAttributes){
//        Account account = (Account) session.getAttribute("account");
//        Gymer gymerSession = gymerService.getGymerByAccount(account).get();
//        if(week!= null || year != null){
//            List<SlotExercise> slotExercisesByPT = slotExcerciseEntityService.getTrainingPTSlot(gymerSession.getGymerId(),week,year,false);
//            System.out.println("slot size: "+slotExercisesByPT.size());
//            model.addAttribute("SlotTraining",model);
//            redirectAttributes.addAttribute("week",week);
//            redirectAttributes.addAttribute("year",year);
//        }else {
//            model.addAttribute("MSG","Please choose the schedule");
//        }
        redirectAttributes.addAttribute("week",week);
        redirectAttributes.addAttribute("year",year);
        return "view-schedule-by-personal-Trainer";
    } //Manh Le: view schedule by personal trainer



}
