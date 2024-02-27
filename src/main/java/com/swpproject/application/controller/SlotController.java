package com.swpproject.application.controller;

import com.swpproject.application.model.SlotExcerciseEntity;
import com.swpproject.application.service.SlotExcerciseEntityService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class SlotController {

    @Autowired
    private SlotExcerciseEntityService slotExcerciseEntiryService;

    @RequestMapping(value ="bookPT", method = RequestMethod.GET)
    public String bookPT(Model model, HttpSession session) {
        List<SlotExcerciseEntity> allSlots = slotExcerciseEntiryService.getAllSlots();
        model.addAttribute("allSlots", allSlots);
        for (SlotExcerciseEntity allSlot : allSlots) {
            System.out.println(allSlot.toString());
        };
        session.setAttribute("allSlots", allSlots);
        return "book-pt";
    }


    @RequestMapping(value = "save-checked",method = RequestMethod.POST)
    public String saveCheckedSlots(@RequestParam(value = "checkedSlots", required = false) List<String> checkedSlots) {
        if (checkedSlots != null && !checkedSlots.isEmpty()) {
            slotExcerciseEntiryService.SaveSlotExcercise(checkedSlots);
        }
        return "redirect:/bookPT";
    }

}
