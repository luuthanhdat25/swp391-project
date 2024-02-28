package com.swpproject.application.controller;

import com.swpproject.application.model.Account;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.model.SchedulePersonalTrainerEntity;
import com.swpproject.application.model.SlotExcerciseEntity;
import com.swpproject.application.service.AccountServiceImpl;
import com.swpproject.application.service.PersonalTrainerService;
import com.swpproject.application.service.SchedulePersonalTrainerService;
import com.swpproject.application.service.SlotExcerciseEntityService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class SlotController {

    @Autowired
    private SlotExcerciseEntityService slotExcerciseEntiryService;

    @Autowired
    private AccountServiceImpl accountService;

    @Autowired
    private PersonalTrainerService personalTrainerService;
    @Autowired
    private SchedulePersonalTrainerService schedulePersonalTrainerService;

    @RequestMapping(value ="bookPT", method = RequestMethod.GET)
    public String viewSChedulePT(){return "book-pt";}

    @GetMapping("/bookPT1")
    public String bookPT(Model model, HttpSession session,
                         @RequestParam(name = "accountId", required = false) Integer accountId,
                         @RequestParam(name = "week", required = false) Integer week,
                         @RequestParam(name = "year", required = false) Integer year,
                         RedirectAttributes redirectAttributes) {
        if (accountId != null) {
            // Do something with accountId, such as storing it in the session
            System.out.println("accountId: " + accountId);
            session.setAttribute("accountId", accountId);
            model.addAttribute("accountId", accountId);
            // Other processing related to accountId...
        }

        // Add week and year to the model if available
        if (week != null && year != null) {
            model.addAttribute("week", week);
            model.addAttribute("year", year);
            session.setAttribute("week", week);
            session.setAttribute("year", year);
            System.out.println("week: "+ week);
            System.out.println("year: "+ year);
        }else {
            System.out.println("week: "+ week);
            System.out.println("year: "+ year);
        }


        // Redirect to the new URL with query parameters
        redirectAttributes.addAttribute("accountId", accountId);
        redirectAttributes.addAttribute("week", week);
        redirectAttributes.addAttribute("year", year);
//        return "redirect:/bookPT?accountId= "+accountId+"&year=" + year + "&week=" + week;
        return "redirect:/bookPT";

//        return "";
    }

    @RequestMapping(value = "viewPT")
    public String viewPTList(Model model){
        List<Account> personalTrainers = accountService.findAccountByRole("PT");
        model.addAttribute("personalTrainers", personalTrainers);

        return "viewAllPersonalTrainer";
    }

    @RequestMapping(value = "save-checked",method = RequestMethod.POST)
    public String saveCheckedSlots(@RequestParam(value = "checkedSlots", required = false) List<String> checkedSlots,
                                   Model model, HttpSession session,
                                   RedirectAttributes redirectAttributes) {
        Integer accountId = (Integer) session.getAttribute( "accountId");
        Integer week = (Integer) session.getAttribute("week");
        Integer year = (Integer) session.getAttribute("year");
        PersonalTrainer  personalTrainer = new PersonalTrainer();
                personalTrainer = personalTrainerService.findPersonalTrainerByAccountID(accountId);
        SchedulePersonalTrainerEntity schedulePersonalTrainerEntity = schedulePersonalTrainerService.findScheduleByPTId(personalTrainer.getPtId());

        System.out.println("PT ID : "+personalTrainer.getPtId());
        System.out.println(" ScheduleID: "+schedulePersonalTrainerEntity.getScheduleId());
        if (accountId != null) {
            // Do something with accountId, such as storing it in the session
            System.out.println("accountId: " + accountId);
            session.setAttribute("accountId", accountId);
            // Other processing related to accountId...
        }
        else {
            System.out.println("accountId: "+ accountId);

        }

        // Add week and year to the model if available
        if (week != null && year != null) {
            model.addAttribute("week", week);
            model.addAttribute("year", year);
            System.out.println("week: "+ week);
            System.out.println("year: "+ year);
        }else {
            System.out.println("week: "+ week);
            System.out.println("year: "+ year);
        }

//        if (checkedSlots != null && !checkedSlots.isEmpty()) {
//            for (String checkedSlot : checkedSlots) {
//                String[] parts = checkedSlot.split("-");
//                if (parts.length == 3) {
//                    String day = parts[0];
//                    int startHour = Integer.parseInt(parts[1]);
//                    int endHour = Integer.parseInt(parts[2]);
//                    SlotExcerciseEntity slotEntity = new SlotExcerciseEntity();
//                    slotEntity.setDay(day);
//                    slotEntity.setStartHour(startHour);
//                    slotEntity.setEndHour(endHour);
//                    slotEntity.setIs_Pending(true); // Set your default value
//                    slotEntity.setAttendant_Status("");
//                    // Set your default value
//                    slotExcerciseEntiryService.SaveSlotExcercise(slotEntity);
//                } else {
//                    // Log or handle the case where the expected number of parts is not found
//                    System.out.println("Invalid slot format: " + checkedSlot);
//                }
//            }
//        }
        redirectAttributes.addAttribute("accountId", accountId);
        redirectAttributes.addAttribute("week", week);
        redirectAttributes.addAttribute("year", year);
        return "redirect:/bookPT";
    }

}
