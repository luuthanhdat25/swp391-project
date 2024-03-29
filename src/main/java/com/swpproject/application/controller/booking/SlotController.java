package com.swpproject.application.controller.booking;

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
import java.time.temporal.WeekFields;
import java.util.*;

@Controller
public class SlotController {

    @Autowired private SlotExcerciseEntityService slotExcerciseEntityService;
    @Autowired private AccountServiceImpl accountService;
    @Autowired private GymerService gymerService;
    @Autowired private PersonalTrainerService personalTrainerService;
    @Autowired private SchedulePersonalTrainerService schedulePersonalTrainerService;
    @Autowired private OrderRequestService orderRequestService;
    @Autowired private SystemNotificationService systemNotificationService;

    @RequestMapping(value = "bookPT", method = RequestMethod.GET)
    public String viewSChedulePT(HttpSession session,Model model) {
        Gymer gymerSession = (Gymer) session.getAttribute("gymer");
        if(gymerSession == null){
            return "redirect:/auth/login";
        }
        boolean checkOrderExist = orderRequestService.checkGymerOrderExist(gymerSession.getGymerId(),OrderStatus.OnDoing);
        boolean checkOrderWaiting = orderRequestService.checkGymerOrderExist(gymerSession.getGymerId(),OrderStatus.Pending);
        boolean checkOrderPaying = orderRequestService.checkGymerOrderExist(gymerSession.getGymerId(),OrderStatus.Accepted);
        if (checkOrderExist){
            model.addAttribute("MSGAnount","You booked another Personal Trainer");
            model.addAttribute("MSGDescError","You Can't book this Personal Trainer because you are booking another personal trainer");
            return "book-fail";

        }else if(checkOrderWaiting){
            model.addAttribute("MSGAnount", "Please wait for another order accept or decline");
            model.addAttribute("MSGDescError","You Can't book this Personal Trainer because you are book another personal trainer," +
                    "please wait for this order update");
            return "book-fail";
        } else if (checkOrderPaying) {
            model.addAttribute("MSGAnount","Your previous request is accepted");
            model.addAttribute("MSGDescError","Sorry because you can not book more Personal Trainer at the same time," +
                    "Your previous request is accepted. Please pay for that order.");
                return "book-fail";
        }
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
            List<SlotExercise> getSlotOnGoing = slotExcerciseEntityService.getSlotOfPersonalTrainer(personalTrainer);
            if (week != null && year != null) {
                List<SlotExercise> getSlotOnWeekAndYear = slotExcerciseEntityService.getAllSlotByWeek(week,year);
                model.addAttribute("week", week);
                model.addAttribute("year", year);
                model.addAttribute("allSlot",getSlotOnGoing);
                redirectAttributes.addAttribute("PersonalTrainerID", personalTrainerID);
                redirectAttributes.addAttribute("week", week);
                redirectAttributes.addAttribute("year", year);
//            session.setAttribute("allSlot", getSlotByScheduleYearAndWeek);
            } else {
                LocalDate currentDate = LocalDate.now();
                // Lấy vị trí của tuần trong năm
                int weekOfYear = currentDate.get(WeekFields.of(Locale.getDefault()).weekOfWeekBasedYear());
                System.out.println("week of year: "+weekOfYear);
                model.addAttribute("week", weekOfYear);
                model.addAttribute("year", currentDate.getYear());
                model.addAttribute("allSlot",getSlotOnGoing );
                redirectAttributes.addAttribute("PersonalTrainerID", personalTrainerID);
                redirectAttributes.addAttribute("week", weekOfYear);
                redirectAttributes.addAttribute("year", currentDate.getYear());
                return "redirect:/bookPT1";
            }
        }
        List<ConflictInfo> conflictsList = (List<ConflictInfo>) session.getAttribute("conflictsList");
        String errorMessage = (String) session.getAttribute("ErrorMessage");
        if(session.getAttribute("trainingTime") != null){
            int trainingTime = (int) session.getAttribute("trainingTime");
            model.addAttribute("trainingTime",trainingTime);
        }

        model.addAttribute("ErrorMessage",errorMessage);
        model.addAttribute("conflictsList",conflictsList);
        session.removeAttribute("conflictsList");
        session.removeAttribute("ErrorMessage");
        session.removeAttribute("trainingTime");
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
                List<SlotExercise> SlotInWeekAndYear = slotExcerciseEntityService.findALlSlotOfAPersonalTrainer(cloudWeek,cloudYear,personalTrainer);
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
                if (cloudWeek < 52) {
                    cloudWeek++;
                }else if (cloudWeek == 52) {
                    cloudWeek= 1;
                    cloudYear++;
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
            System.out.println(flag);
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
                redirectAttributes.addAttribute("PersonalTrainerID", personalTrainerID);
                redirectAttributes.addAttribute("week", week);
                redirectAttributes.addAttribute("year", year);
                model.addAttribute("trainingTime", trainingTime);
                session.setAttribute("trainingTime",trainingTime);
                return "redirect:/bookPT1";
            }else{
                    orderRequest.setPersonalTrainer(personalTrainer); //set personal Trainer for order request
                    orderRequest.setTitle(title);
                    orderRequest.setGymer(gymerService.getGymerByAccount(accountSession).get());
                    orderRequest.setDescription(desc);
                    orderRequest.setTotal_of_money(totalAmount);
                    orderRequest.setStatus(OrderStatus.Pending);
                    orderRequest.setTracking(0);
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
                if (week != null && year != null) {
                    model.addAttribute("week", week);
                    model.addAttribute("year", year);
                    if (checkedSlots != null && !checkedSlots.isEmpty()) {
                        for (int i = 1; i <= trainingTime; i++) {

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
                                    slotExcerciseEntityService.SaveSlotExcercise(slotEntity);
                                } else {
                                    System.out.println("Invalid slot format: " + checkedSlot);
                                }
                            }
                            if (week < 52) {
                                week++;
                            } else if (week == 52) {
                                week = 1;
                                year++;
                            }
                        }
                    }
                }
                systemNotificationService.createNotification_NewRequestHiring(orderRequest);
            }
        }else {
            System.out.println("Slot request size: "+slotRequest.size());
                session.setAttribute("ErrorMessage","you need input atleast 1 slot to send request");
                redirectAttributes.addAttribute("PersonalTrainerID", personalTrainerID);
                redirectAttributes.addAttribute("week", week);
                redirectAttributes.addAttribute("year", year);
                return "redirect:/bookPT1";

        }


        return "redirect:/order-history";
    }
    public boolean checkBookSecond(Account account){
        Gymer gymer = gymerService.getGymerByAccount(account).get();
        return false;
    }
}