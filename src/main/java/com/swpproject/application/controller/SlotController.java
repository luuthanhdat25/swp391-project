package com.swpproject.application.controller;

import com.swpproject.application.enums.Attendant;
import com.swpproject.application.enums.Role;
import com.swpproject.application.model.*;
import com.swpproject.application.service.*;
import com.swpproject.application.service.impl.AccountServiceImpl;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.sql.Date;
import java.util.List;

@Controller
public class SlotController {

    @Autowired
    private SlotExcerciseEntityService slotExcerciseEntityService;
    @Autowired
    private AccountServiceImpl accountService;
    @Autowired
    private PersonalTrainerService personalTrainerService;
    @Autowired
    private SchedulePersonalTrainerService schedulePersonalTrainerService;
    @Autowired
    private OrderRequestService orderRequestService;
    @Autowired
    private GymerService gymerService;



    @RequestMapping(value ="bookPT", method = RequestMethod.GET)
    public String viewSChedulePT(){return "book-pt";}

    @GetMapping("/bookPT1")
    public String bookPT(Model model, HttpSession session,
                         @RequestParam(name = "accountId", required = false) Integer accountId,
                         @RequestParam(name = "week", required = false) Integer week,
                         @RequestParam(name = "year", required = false) Integer year,
                         RedirectAttributes redirectAttributes) {
        PersonalTrainer  personalTrainer = new PersonalTrainer();
        personalTrainer = personalTrainerService.findPersonalTrainerByAccountID(accountId);
        SchedulePersonalTrainer schedulePersonalTrainerEntity = schedulePersonalTrainerService.findScheduleByPtId(personalTrainer.getId());
        if (accountId != null) {
            // Do something with accountId, such as storing it in the session
            System.out.println("accountId: " + accountId);
            session.setAttribute("accountId", accountId);
            model.addAttribute("accountId", accountId);
            // Other processing related to accountId...
        }
        if (week != null && year != null) {
            model.addAttribute("week", week);
            model.addAttribute("year", year);
            session.setAttribute("week", week);
            session.setAttribute("year", year);
            List<SlotExcercise> getSlotByScheduleYearAndWeek = slotExcerciseEntityService.getSlotByWeekYear(schedulePersonalTrainerEntity.getScheduleId(),week,year);
            System.out.println("number slot: " + getSlotByScheduleYearAndWeek.size());
            model.addAttribute("allSlots",getSlotByScheduleYearAndWeek);
            session.setAttribute("allSlots", getSlotByScheduleYearAndWeek);
        }





        // Redirect to the new URL with query parameters
        redirectAttributes.addAttribute("accountId", accountId);
        redirectAttributes.addAttribute("week", week);
        redirectAttributes.addAttribute("year", year);
        return "redirect:/bookPT";

//        return "";
    }

    @RequestMapping(value = "viewPT")
    public String viewPTList(Model model){
        List<Account> personalTrainers = accountService.findAccountByRole(Role.PT);
        model.addAttribute("personalTrainers", personalTrainers);
        return "viewAllPersonalTrainer";
    }

    @RequestMapping(value = "save-checked",method = RequestMethod.POST)
    public String saveCheckedSlots(@RequestParam(value = "checkedSlots", required = false) List<String> checkedSlots,
                                   @RequestParam("goals") String title,
                                   @RequestParam("description") String desc,
                                   @RequestParam("TrainingTime") int trainingTime,
                                   Model model, HttpSession session,
                                   RedirectAttributes redirectAttributes) {
        Integer accountId = (Integer) session.getAttribute( "accountId");
        Integer week = (Integer) session.getAttribute("week");
        Integer year = (Integer) session.getAttribute("year");


        PersonalTrainer  personalTrainer = new PersonalTrainer();
        personalTrainer = personalTrainerService.findPersonalTrainerByAccountID(accountId);
        SchedulePersonalTrainer schedulePersonalTrainerEntity = schedulePersonalTrainerService.findScheduleByPtId(personalTrainer.getId());
        OrderRequest orderRequest = new OrderRequest();


        LocalDate currentDate;
        Date StartDateAsDate;
        Date EndDateAsDate;


        System.out.println("PT ID : "+ personalTrainer.getId());
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
        orderRequest.setPersonalTrainer(personalTrainerService.findPersonalTrainerByAccountID(accountId)); //set personal Trainer for order request
        orderRequest.setTitle(title);
        orderRequest.setGymer(gymerService.GetGymerProifile(3));
        orderRequest.setDescription(desc);
        orderRequest.setTotal_of_money(12000000);
        System.out.println("goal"+title);
        System.out.println("desc"+desc);
        System.out.println("training time"+ trainingTime);
        switch (trainingTime){
            case 1:
                currentDate = LocalDate.now();
                StartDateAsDate= Date.valueOf(currentDate);
                EndDateAsDate= Date.valueOf(currentDate.minusMonths(1));
                orderRequest.setDatetime_start(StartDateAsDate);
                orderRequest.setDatetime_end(EndDateAsDate);
                    break;
            case 2:
                currentDate = LocalDate.now();
                StartDateAsDate= Date.valueOf(currentDate);
                EndDateAsDate= Date.valueOf(currentDate.minusMonths(3));
                orderRequest.setDatetime_start(StartDateAsDate);
                orderRequest.setDatetime_end(EndDateAsDate);
                break;
            case 3:
                currentDate = LocalDate.now();
                StartDateAsDate= Date.valueOf(currentDate);
                EndDateAsDate= Date.valueOf(currentDate.minusMonths(3));
                orderRequest.setDatetime_start(StartDateAsDate);
                orderRequest.setDatetime_end(EndDateAsDate);
                break;
        }
        if( orderRequest != null){
            orderRequestService.saveOrderRequest(orderRequest);
        }

//         Add week and year to the model if available
        if (week != null && year != null) {
            model.addAttribute("week", week);
            model.addAttribute("year", year);
            System.out.println("week: "+ week);
            System.out.println("year: "+ year);
        }else {
            System.out.println("week: "+ week);
            System.out.println("year: "+ year);
        }

        if (checkedSlots != null && !checkedSlots.isEmpty()) {
            for (String checkedSlot : checkedSlots) {
                String[] parts = checkedSlot.split("-");
                if (parts.length == 3) {
                    String day = parts[0];
                    int startHour = Integer.parseInt(parts[1]);
                    int endHour = Integer.parseInt(parts[2]);
                    SlotExcercise slotEntity = new SlotExcercise();
                    slotEntity.setDay(day);
                    slotEntity.setStart_hour(startHour);
                    slotEntity.setEnd_hour(endHour);
                    slotEntity.setWeek(week);
                    slotEntity.setYear(year);
                    slotEntity.setSchedulePersonalTrainer(schedulePersonalTrainerEntity);
                    slotEntity.setPending(true); // Set your default value
                    slotEntity.setAttendant_status(Attendant.WAITING);
                    // Set Slot value
                    slotExcerciseEntityService.SaveSlotExcercise(slotEntity);
                } else {
                    // Log or handle the case where the expected number of parts is not found
                    System.out.println("Invalid slot format: " + checkedSlot);
                }
            }
        }
        redirectAttributes.addAttribute("accountId", accountId);
        redirectAttributes.addAttribute("week", week);
        redirectAttributes.addAttribute("year", year);
        return "redirect:/bookPT";
    }

}
