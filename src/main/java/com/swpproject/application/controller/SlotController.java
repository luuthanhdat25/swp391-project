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

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Controller
public class SlotController {

    @Autowired
    private SlotExcerciseEntityService slotExcerciseEntityService;

    @Autowired
    private AccountServiceImpl accountService;
    @Autowired
    private GymerService gymerService;

    @Autowired
    private PersonalTrainerService personalTrainerService;
    @Autowired
    private SchedulePersonalTrainerService schedulePersonalTrainerService;
    @Autowired
    private OrderRequestService orderRequestService;

    @RequestMapping(value = "bookPT", method = RequestMethod.GET)
    public String viewSChedulePT() {
        return "book-pt";
    }

    @GetMapping("/bookPT1")
    public String bookPT(Model model, HttpSession session,
                         @RequestParam(name = "accountId", required = false) Integer accountId,
                         @RequestParam(name = "week", required = false) Integer week,
                         @RequestParam(name = "year", required = false) Integer year,

                         RedirectAttributes redirectAttributes) {
        PersonalTrainer personalTrainer = new PersonalTrainer();
        personalTrainer = personalTrainerService.findPersonalTrainerByAccountID(accountId);
        Schedule schedulePersonalTrainerEntity = schedulePersonalTrainerService.findScheduleByPtId(personalTrainer.getId());

        if (accountId != null) {
            // Do something with accountId, such as storing it in the session
            System.out.println("accountId: " + accountId);

            model.addAttribute("accountId", accountId);
            model.addAttribute("personalTrainer",personalTrainer);
            System.out.println("price: "+personalTrainer.getPrice());
            // Other processing related to accountId...
        }

        // Add week and year to the model if available
        if (week != null && year != null) {
            model.addAttribute("week", week);
            model.addAttribute("year", year);

            System.out.println("week: " + week);
            System.out.println("year: " + year);
            List<SlotExercise> getSlotByScheduleYearAndWeek = slotExcerciseEntityService.getSlotByWeekYear(schedulePersonalTrainerEntity.getId(), week, year);
            System.out.println("number slot: " + getSlotByScheduleYearAndWeek.size());
            model.addAttribute("allSlot", getSlotByScheduleYearAndWeek);
//            session.setAttribute("allSlot", getSlotByScheduleYearAndWeek);
        } else {
            System.out.println("week: " + week);
            System.out.println("year: " + year);
        }


        // Redirect to the new URL with query parameters
        redirectAttributes.addAttribute("accountId", accountId);
        redirectAttributes.addAttribute("week", week);
        redirectAttributes.addAttribute("year", year);
//        return "redirect:/bookPT?accountId= "+accountId+"&year=" + year + "&week=" + week;
        return "forward:/bookPT";

//        return "";
    }

    @RequestMapping(value = "viewPT")
    public String viewPTList(Model model) {
        List<Account> personalTrainers = accountService.findAccountByRole(Role.PT);
        model.addAttribute("personalTrainers", personalTrainers);

        return "viewAllPersonalTrainer";
    }

    @RequestMapping(value = "save-checked", method = RequestMethod.POST)
    public String saveCheckedSlots(@RequestParam(value = "checkedSlots", required = false) List<String> checkedSlots,
                                   @RequestParam(value = "accountId") Integer accountId,
                                   @RequestParam(value = "week") Integer week,
                                   @RequestParam(value = "year") Integer year,
                                   @RequestParam("goals") String title,
                                   @RequestParam("description") String desc,
                                   @RequestParam("TrainingTime") int trainingTime,
                                   @RequestParam(name = "totalPrice", required = false) String totalPrice,
                                   Model model, HttpSession session,
                                   RedirectAttributes redirectAttributes) {

        PersonalTrainer personalTrainer = new PersonalTrainer();
        personalTrainer = personalTrainerService.findPersonalTrainerByAccountID(accountId);
        Schedule schedulePersonalTrainerEntity = schedulePersonalTrainerService.findScheduleByPtId(personalTrainer.getId());
        Account accountSession =(Account) session.getAttribute("account");
        System.out.println("PT ID : " + personalTrainer.getId());
        System.out.println("ScheduleID: " + schedulePersonalTrainerEntity.getId());
        System.out.println("accountID: "+accountSession.getId());
        OrderRequest orderRequest = new OrderRequest();
        double doubleValue = Double.parseDouble(totalPrice);
        Integer totalAmount = (int) doubleValue;
        System.out.println("Total price: "+totalAmount);

        LocalDate currentDate;
        Date StartDateAsDate;
        Date EndDateAsDate;


        System.out.println("PT ID : " + personalTrainer.getId());
        System.out.println(" ScheduleID: " + schedulePersonalTrainerEntity.getId());
        if (accountId != null) {
            // Do something with accountId, such as storing it in the session
            System.out.println("accountId: " + accountId);
            session.setAttribute("accountId", accountId);
            // Other processing related to accountId...
        } else {
            System.out.println("accountId: " + accountId);
        }
        orderRequest.setPersonalTrainer(personalTrainerService.findPersonalTrainerByAccountID(accountId)); //set personal Trainer for order request
        orderRequest.setTitle(title);
        orderRequest.setGymer(gymerService.getGymerByAccount(accountSession).get());
        orderRequest.setDescription(desc);
        orderRequest.setTotal_of_money(totalAmount);
        System.out.println("goal" + title);
        System.out.println("desc" + desc);
        System.out.println("training time" + trainingTime);
        switch (trainingTime) {
            case 1:
                currentDate = LocalDate.now();
                StartDateAsDate = Date.valueOf(currentDate);
                EndDateAsDate = Date.valueOf(currentDate.plusMonths(1));
                orderRequest.setDatetime_start(StartDateAsDate);
                orderRequest.setDatetime_end(EndDateAsDate);
                break;
            case 2:
                currentDate = LocalDate.now();
                StartDateAsDate = Date.valueOf(currentDate);
                EndDateAsDate = Date.valueOf(currentDate.plusMonths(3));
                orderRequest.setDatetime_start(StartDateAsDate);
                orderRequest.setDatetime_end(EndDateAsDate);
                break;
            case 3:
                currentDate = LocalDate.now();
                StartDateAsDate = Date.valueOf(currentDate);
                EndDateAsDate = Date.valueOf(currentDate.plusMonths(3));
                orderRequest.setDatetime_start(StartDateAsDate);
                orderRequest.setDatetime_end(EndDateAsDate);
                break;
        }
        if (orderRequest != null) {
            orderRequestService.saveOrderRequest(orderRequest);
        }

//         Add week and year to the model if available
        if (week != null && year != null) {
            model.addAttribute("week", week);
            model.addAttribute("year", year);


            if (checkedSlots != null && !checkedSlots.isEmpty()) {
                for (String checkedSlot : checkedSlots) {
                    String[] parts = checkedSlot.split("-");
                    if (parts.length == 3) {
                        String day = parts[0];
                        String startHour = parts[1];
                        String endHour = parts[2];
                        SlotExercise slotEntity = new SlotExercise();
                        slotEntity.setDay(day);
                        slotEntity.setStart_hour(startHour);
                        slotEntity.setEnd_hour(endHour);
                        slotEntity.setWeek(week);
                        slotEntity.setYear(year);
                        slotEntity.setSchedule(schedulePersonalTrainerEntity);
                        slotEntity.setPending(true); // Set your default value
                        slotEntity.setAttendantStatus(Attendant.WAITING);
                        slotEntity.setGymer(gymerService.getGymerByAccount(accountSession).get());
                        slotEntity.setPersonalTrainer(personalTrainer);
                        slotEntity.setOrderRequest(orderRequest);
                        // Set Slot value
                        slotExcerciseEntityService.SaveSlotExcercise(slotEntity);
                    } else {
                        // Log or handle the case where the expected number of parts is not found
                        System.out.println("Invalid slot format: " + checkedSlot);
                    }
                }
            }



        }
        redirectAttributes.addAttribute("accountId", accountId);
        redirectAttributes.addAttribute("week", week);
        redirectAttributes.addAttribute("year", year);
        return "redirect:/bookPT";
    }
}