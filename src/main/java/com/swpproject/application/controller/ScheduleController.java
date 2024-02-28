//package com.swpproject.application.controller;
//
//import com.swpproject.application.model.ScheduleDataEntity;
//import com.swpproject.application.service.ScheduleDataService;
////import com.swpproject.application.service.ScheduleDataService;
//import jakarta.servlet.http.HttpSession;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.List;
//
////ManhLD
//@Controller
//@SessionAttributes("id")
//public class ScheduleController {
//
//    @Autowired
//    private ScheduleDataService scheduleDataService;
//
//    @RequestMapping(value = "Schedule", method = RequestMethod.GET)
//    public String Schedule(){
//        return "calendar";
//    }
//
//    @PostMapping("/saveSchedule")
//    public String saveSchedule(@RequestParam("selectedSlotsAndDays") String selectedSlotsAndDays,HttpSession session) {
//        String[] selectedSlotsAndDaysArray = selectedSlotsAndDays.split(",");
//        for (String slotAndDay : selectedSlotsAndDaysArray) {
//            String[] parts = slotAndDay.split("-");
//            if (parts.length == 2) {
//                int slot = Integer.parseInt(parts[0]);
//                int day = Integer.parseInt(parts[1]);
//                ScheduleDataEntity scheduleData = new ScheduleDataEntity();
//                scheduleData.setSlot(slot);
//                scheduleData.setDay(day);
//
//
//                scheduleData.setWeek((int)session.getAttribute("selectedWeek"));
//                scheduleData.setYear((int)session.getAttribute("selectedYear"));
//                // Làm tương tự cho các trường khác như week, year
//                System.out.println(slot);
//                System.out.println(day);
//                System.out.println("----");
//                scheduleDataService.saveOrUpdate(scheduleData);
//                // Save or update the data to the database using your service
//                // scheduleDataService.saveOrUpdate(year, week, slot, day);
//            }
//        }
//
//        // Redirect to the appropriate page
//        return "redirect:/SelectWeek?year=" + session.getAttribute("selectedYear") + "&week=" + session.getAttribute("selectedWeek");
//    }
//
//    @GetMapping( "/SelectWeek")
//    public String handleFormSubmission(@RequestParam int week, @RequestParam int year, Model model, HttpSession session) {
//        List<ScheduleDataEntity> scheduleSlots = scheduleDataService.getSlotsByWeekAndYear(week, year);
//        model.addAttribute("scheduleSlots", scheduleSlots);
//        System.out.println(week +","+year);
//        // Store scheduleSlots in the session
//        session.setAttribute("scheduleSlots", scheduleSlots);
//        session.setAttribute("selectedWeek", week);
//        session.setAttribute("selectedYear", year);
//        return "redirect:/Schedule?year=" + year + "&week=" + week;
//    }
//
//
//
//}
