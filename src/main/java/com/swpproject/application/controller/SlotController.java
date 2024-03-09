package com.swpproject.application.controller;

import com.swpproject.application.controller.notification.SystemNotificationService;
import com.swpproject.application.enums.Attendant;
import com.swpproject.application.enums.OrderStatus;
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
import java.util.*;

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
    @Autowired
    private SystemNotificationService systemNotificationService;

    @RequestMapping(value = "bookPT", method = RequestMethod.GET)
    public String viewSChedulePT(HttpSession session) {

        return "book-pt";
    }

    @GetMapping("/bookPT1")
    public String bookPT(Model model, HttpSession session,
                         @RequestParam(name = "PersonalTrainerID", required = false) Integer personalTrainerID,
                         @RequestParam(name = "accountId",required = false) Integer accountId,
                         @RequestParam(name = "week", required = false) Integer week,
                         @RequestParam(name = "year", required = false) Integer year,
                         RedirectAttributes redirectAttributes) {
        if(personalTrainerID != null ){
            PersonalTrainer personalTrainer = new PersonalTrainer();
            personalTrainer = personalTrainerService.findByID(personalTrainerID).get();
            model.addAttribute("pt",personalTrainer);
            System.out.println("accountId: " + personalTrainerID);
            model.addAttribute("accountId", personalTrainerID);
            model.addAttribute("personalTrainer", personalTrainer);
            System.out.println("price: " + personalTrainer.getPrice());
            List<SlotExercise> getSlotOnGoing = slotExcerciseEntityService.getSlotNotPending(personalTrainer.getId(),false);
            if (week != null && year != null) {
                model.addAttribute("week", week);
                model.addAttribute("year", year);
                model.addAttribute("allSlot",getSlotOnGoing );
//            session.setAttribute("allSlot", getSlotByScheduleYearAndWeek);
            } else {
                System.out.println("Acount PT: "+  personalTrainer.getAccount().getId());

                Optional<SlotExercise> minWeekAndYear = getSlotOnGoing.stream()
                        .min(Comparator.comparing(SlotExercise::getYear).thenComparing(SlotExercise::getWeek));

                if (minWeekAndYear.isPresent()) {
                    SlotExercise minWeekAndYearValue = minWeekAndYear.get();
                    int minWeek = minWeekAndYearValue.getWeek();
                    int minYear = minWeekAndYearValue.getYear();
                    // Sử dụng giá trị minWeek và minYear ở đây
                    redirectAttributes.addAttribute("PersonalTrainerID", personalTrainerID);
                    redirectAttributes.addAttribute("week", minWeek);
                    redirectAttributes.addAttribute("year", minYear);
                    System.out.println("Minimum week: " + minWeek + ", Minimum year: " + minYear);
                } else {
                    redirectAttributes.addAttribute("PersonalTrainerID", personalTrainerID);
                    redirectAttributes.addAttribute("week", week);
                    redirectAttributes.addAttribute("year", year);
                    // Danh sách trống, không có giá trị minWeek và minYear
                    System.out.println("No minimum week and year found");
                }
                System.out.println("week: " + week);
                System.out.println("year: " + year);
            }


        }
        List<ConflictInfo> conflictsList = (List<ConflictInfo>) session.getAttribute("conflictsList");
        model.addAttribute("conflictsList",conflictsList);
        session.removeAttribute("conflictsList");

//        else{
//            PersonalTrainer personalTrainer = new PersonalTrainer();
//            personalTrainer = personalTrainerService.findPersonalTrainerByAccountID(accountId);
//            System.out.println("accountId: " + accountId);
//
//            model.addAttribute("accountId", accountId);
//            model.addAttribute("personalTrainer", personalTrainer);
//            System.out.println("price: " + personalTrainer.getPrice());
//            List<SlotExercise> getSlotOnGoing = slotExcerciseEntityService.getSlotNotPending(personalTrainer.getId(),false);
//            if (week != null && year != null) {
//                model.addAttribute("week", week);
//                model.addAttribute("year", year);
//
//                System.out.println("week: " + week);
//                System.out.println("year: " + year);
//
//                System.out.println("number slot: " + getSlotOnGoing.size());
//                model.addAttribute("allSlot",getSlotOnGoing );
////            session.setAttribute("allSlot", getSlotByScheduleYearAndWeek);
//            } else {
//                System.out.println("week: " + week);
//                System.out.println("year: " + year);
//            }
//        redirectAttributes.addAttribute("PersonalTrainerID", personalTrainerID);
//        redirectAttributes.addAttribute("week", week);
//        redirectAttributes.addAttribute("year", year);
//        }

        return "forward:/bookPT";
    }

    @RequestMapping(value = "viewPT")
    public String viewPTList(Model model) {
        List<Account> personalTrainers = accountService.findAccountByRole(Role.PT);
        model.addAttribute("personalTrainers", personalTrainers);

        return "viewAllPersonalTrainer";
    }

    @RequestMapping(value = "save-checked", method = RequestMethod.POST)
    public String saveCheckedSlots(@RequestParam(value = "checkedSlots", required = false) List<String> checkedSlots,
                                   @RequestParam(value = "PersonalTrainerID") Integer personalTrainerID,
                                   @RequestParam(value = "week") Integer week,
                                   @RequestParam(value = "year") Integer year,
                                   @RequestParam("goals") String title,
                                   @RequestParam("description") String desc,
                                   @RequestParam("TrainingTime") int trainingTime,
                                   @RequestParam(name = "totalPrice", required = false) String totalPrice,
                                   Model model, HttpSession session,
                                   RedirectAttributes redirectAttributes) {



        PersonalTrainer personalTrainer = new PersonalTrainer();
        personalTrainer = personalTrainerService.findPersonalTrainerByID(personalTrainerID).get();
        Schedule schedulePersonalTrainerEntity = schedulePersonalTrainerService.findScheduleByPtId(personalTrainer.getId());
        Account accountSession = (Account) session.getAttribute("account");
        System.out.println("PT ID : " + personalTrainer.getId());
        System.out.println("ScheduleID: " + schedulePersonalTrainerEntity.getId());
        System.out.println("accountID: " + accountSession.getId());
        OrderRequest orderRequest = new OrderRequest();
        double doubleValue = Double.parseDouble(totalPrice);
        Integer totalAmount = (int) doubleValue;
        System.out.println("Total price: " + totalAmount);

        LocalDate currentDate;
        Date StartDateAsDate;
        Date EndDateAsDate;



        currentDate = LocalDate.now();
        StartDateAsDate = Date.valueOf(currentDate);


//        List<SlotExercise> slotOrdered = slotExcerciseEntityService.getSlotGreater(StartDateAsDate, false);


        List<SlotExercise> slotRequest = new ArrayList<>();


        int cloudWeek = week;
        int cloudYear = year;
        List<SlotExercise> slotInWeekAndYearOrdered = new ArrayList<>();
        List<SlotExercise>  getAllSlotIntime = new ArrayList<>();
        if (checkedSlots != null && !checkedSlots.isEmpty()) {
            for (int i = 1; i <= trainingTime; i++) {
                if (cloudWeek < 52) {
                    cloudWeek++;
                }else if (cloudWeek == 52) {
                    cloudWeek= 1;
                    cloudYear++;
                }
                List<SlotExercise> SlotInWeekAndYear = slotExcerciseEntityService.getAllSlotByWeek(cloudWeek, cloudYear);
                slotInWeekAndYearOrdered.addAll(SlotInWeekAndYear);
                for (String checkedSlot : checkedSlots) {
                    System.out.println(year);
                    String[] parts = checkedSlot.split("-");
                    if (parts.length == 3) {
                        String day = parts[0];
                        String startHour = parts[1];
                        String endHour = parts[2];
                        SlotExercise slotEntity = new SlotExercise();
                        slotEntity.setDay(day);
                        slotEntity.setStart_hour(startHour+":00");
                        slotEntity.setEnd_hour(endHour+":00");
                        slotEntity.setWeek(cloudWeek);
                        slotEntity.setYear(cloudYear);
                        slotEntity.setSchedule(schedulePersonalTrainerEntity);
                        slotEntity.setPending(true); // Set your default value
                        slotEntity.setAttendantStatus(Attendant.WAITING);
                        slotEntity.setGymer(gymerService.getGymerByAccount(accountSession).get());
                        slotEntity.setPersonalTrainer(personalTrainer);
                        slotRequest.add(slotEntity);
                    } else {
                        // Log or handle the case where the expected number of parts is not found
                        System.out.println("Invalid slot format: " + checkedSlot);
                    }
                }
            }
            System.out.println("order slot: " +slotInWeekAndYearOrdered.size());
            boolean flag = false;
            for (SlotExercise slotExerciseOrdered : slotInWeekAndYearOrdered) {
                for (SlotExercise slotExerciseRequest : slotRequest) {
                    if (slotExerciseRequest.getYear() == slotExerciseOrdered.getYear()
                            && slotExerciseRequest.getWeek() == slotExerciseOrdered.getWeek()
                            && slotExerciseRequest.getDay().equalsIgnoreCase(slotExerciseOrdered.getDay())
                            && slotExerciseRequest.getStart_hour().equalsIgnoreCase(slotExerciseOrdered.getStart_hour())
                            && slotExerciseRequest.getEnd_hour().equalsIgnoreCase(slotExerciseOrdered.getEnd_hour())) {
                        flag = true;
                    }
                }

            }
            List<SlotExercise> conflictsList = new ArrayList<>();
            int checkWeek = week;
            int checkYear = year;
            if(flag){
                for (int i = 1; i <= trainingTime; i++) {
                    if (checkWeek < 52) {
                        checkWeek++;
                    } else if (checkWeek == 52) {
                        checkWeek = 1;
                        checkYear++;
                    }
                    List<SlotExercise> slotCheckInTime = slotExcerciseEntityService.getAllSlotByWeek(checkWeek, checkYear);
                    conflictsList.addAll(slotCheckInTime);
                }
                System.out.println(flag);
                session.setAttribute("conflictsList", conflictsList);
                System.out.println("conflic slot: " + conflictsList.size());
                System.out.println("PT ID : " + personalTrainer.getId());
                System.out.println(" ScheduleID: " + schedulePersonalTrainerEntity.getId());
            }else{
                    orderRequest.setPersonalTrainer(personalTrainer); //set personal Trainer for order request
                    orderRequest.setTitle(title);
                    orderRequest.setGymer(gymerService.getGymerByAccount(accountSession).get());
                    orderRequest.setDescription(desc);
                    orderRequest.setTotal_of_money(totalAmount);
                    orderRequest.setStatus(OrderStatus.Pending);
                    System.out.println("goal" + title);
                    System.out.println("desc" + desc);
                    System.out.println("training time" + trainingTime);
                            currentDate = LocalDate.now();
                            StartDateAsDate = Date.valueOf(currentDate);
                            EndDateAsDate = Date.valueOf(currentDate.plusWeeks(trainingTime));
                            orderRequest.setDatetime_start(StartDateAsDate);
                            orderRequest.setDatetime_end(EndDateAsDate);
                    if (orderRequest != null) {
                        orderRequestService.saveOrUpdateOrderRequest(orderRequest);
                    }
////         Add week and year to the model if available
                if (week != null && year != null) {
                    model.addAttribute("week", week);
                    model.addAttribute("year", year);
                    if (checkedSlots != null && !checkedSlots.isEmpty()) {
                        for (int i = 1; i <= trainingTime; i++) {
                            if (week < 52) {
                                week++;
                            } else if (week == 52) {
                                week = 1;
                                year++;
                            }
                            for (String checkedSlot : checkedSlots) {
                                String[] parts = checkedSlot.split("-");
                                if (parts.length == 3) {
                                    String day = parts[0];
                                    String startHour = parts[1];
                                    String endHour = parts[2];
                                    SlotExercise slotEntity = new SlotExercise();
                                    slotEntity.setDay(day);
                                    slotEntity.setStart_hour(startHour + ":00");
                                    slotEntity.setEnd_hour(endHour + ":00");
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
                }
            }
        }
        systemNotificationService.createNotification_NewRequestHiring(gymerService.getGymerByAccount(accountSession).get().getGymerId(), personalTrainer.getId());
        redirectAttributes.addAttribute("PersonalTrainerID", personalTrainerID);
        redirectAttributes.addAttribute("week", week);
        redirectAttributes.addAttribute("year", year);
        return "redirect:/bookPT1";
//        return "redirect:/personal-trainer/";
    }


}