package com.swpproject.application.controller;

import com.swpproject.application.enums.Role;
import com.swpproject.application.model.*;
import com.swpproject.application.repository.*;
import com.swpproject.application.service.*;
import com.swpproject.application.service.impl.ScheduleServiceImplement;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;
import java.time.temporal.WeekFields;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Optional;


@Controller
public class PersonalScheduleController {
    @Autowired
    private SlotNutritionService slotNutritionService;
    @Autowired
    private SlotExcerciseEntityService slotExcerciseEntityService;

    @Autowired
    private SlotNutriDetailService slotNutriDetailService;
    @Autowired
    private SlotExeDetailService slotExeDetailService;

    @Autowired
    private SlotExeRepository slotExeRepository;

    @Autowired
    private NutritionRepository nutritionRepository;

    @Autowired
    private SlotNutriRepository slotNutriRepository;

    @Autowired
    private PersonalTrainerService personalTrainerService;
    @Autowired
    private ExerciseRepository exerciseRepository;
    @Autowired
    private GymerService gymerService;
    @Autowired
    private ScheduleServiceImplement scheduleServiceImplement;

    // view pt schedule
    @GetMapping(value = "/view-pt-schedule")
    public String showPTSchedule(@RequestParam(value = "week", required = false) Integer week,
                                 @RequestParam(value = "year", required = false) Integer year,
                                 Model model) {
        if (week==null && year==null){
            LocalDate currentDate = LocalDate.now();
            // Lấy vị trí của tuần trong năm
            week = currentDate.get(WeekFields.of(Locale.getDefault()).weekOfWeekBasedYear());
            year = currentDate.getYear();
            return "redirect:/selectTime?week="+week+"&year="+year;
        }
        return "pt-schedule";
    }

    @GetMapping(value = "/selectTime", params = {"week", "year"})
    public String showSchedulePT(@RequestParam("week") int week,
                                 @RequestParam("year") int year, Model model,
                                 HttpSession session) {
        Account account = (Account) session.getAttribute("account");
        if (account.getRole().equals(Role.PT)) {
            PersonalTrainer personalTrainer = personalTrainerService.findPersonalTrainerByAccountID(account.getId());
            List<SlotExercise> slotExercises = slotExcerciseEntityService.findAllByWeekAndYearAndPersonalTrainerAndIsPending(week, year, personalTrainer, false);
            model.addAttribute("slotExercises", slotExercises);
        }
        return "forward:/view-pt-schedule?year=" + year + "&week=" + week;
    }

    // gymer view schedule created by Personal Trainer
    @GetMapping(value = "/view-schedule-withpt")
    public String viewScheduleWithPT(Model model, HttpSession session,
                                     @RequestParam(value = "week", required = false) Integer week,
                                     @RequestParam(value = "year", required = false) Integer year,
                                     @RequestParam(value = "GymerID", required = false) Integer gymerID) {
        if (gymerID != null) {
            Gymer gymer = gymerService.getGymerById(gymerID).get();
            session.setAttribute("GymerCustomer", gymer);
        }
        if (week==null && year==null){
            LocalDate currentDate = LocalDate.now();
            // Lấy vị trí của tuần trong năm
            week = currentDate.get(WeekFields.of(Locale.getDefault()).weekOfWeekBasedYear());
            year = currentDate.getYear();
            return "redirect:/select-week?week="+week+"&year="+year;
        }
        return "gymer-schedule";
    }

    @GetMapping(value = "/select-week", params = {"week", "year"})
    public String showScheduleWithPT(@RequestParam("week") int week,
                                     @RequestParam("year") int year, Model model,
                                     HttpSession session) {


        Gymer gymer = (Gymer) session.getAttribute("gymer");
        if (gymer == null) {
            gymer = (Gymer) session.getAttribute("GymerCustomer");
        }
        if (gymer != null) {
            List<SlotExercise> slotExes = slotExcerciseEntityService.findAllByWeekAndYearAndGymerAndPersonalTrainerNotNullAndIsPending(week, year, gymer, false);
            model.addAttribute("slotExes", slotExes);
        }
        return "forward:/view-schedule-withpt?year=" + year + "&week=" + week;
    }

    //Gymer view personal schedule
    @GetMapping(value = "/view-personal-schedule")
    public String showPersonalSchedule(@RequestParam(value = "week", required = false) Integer week,
                                       @RequestParam(value = "year", required = false) Integer year,
                                       Model model) {
        if (week==null && year==null){
            LocalDate currentDate = LocalDate.now();
            // Lấy vị trí của tuần trong năm
            week = currentDate.get(WeekFields.of(Locale.getDefault()).weekOfWeekBasedYear());
            year = currentDate.getYear();
            return "redirect:/selectWeek?week="+week+"&year="+year;
        }
        return "view-schedule";
    }

    @GetMapping(value = "/selectWeek", params = {"week", "year"})
    public String showPersonalScheduleWithParams(@RequestParam("week") int week,
                                                 @RequestParam("year") int year,
                                                 Model model, HttpSession session) {
        int scheduleId = 0;
        Gymer gymer = (Gymer) session.getAttribute("gymer");

        if (gymer != null) {
            Schedule schedule = scheduleServiceImplement.findScheduleByGymerIdAndPTId(gymer.getGymerId(), null).get();
            scheduleId = schedule.getId();
            List<SlotExercise> slotExercises = slotExeRepository.findSlotExeByWeekAndYearAndScheduleId(week, year, scheduleId);
            model.addAttribute("slotExercises", slotExercises);
            List<SlotNutrition> slotNutritions = slotNutriRepository.findSlotNutriByWeekAndYearAndScheduleId(week, year, scheduleId);
            model.addAttribute("slotNutritions", slotNutritions);
        }
        List<Exercise> exercises = exerciseRepository.findAll();
        session.setAttribute("exercises", exercises);

        List<Nutrition> nutritions = nutritionRepository.findAll();
        session.setAttribute("nutritions", nutritions);

        model.addAttribute("week", week);
        model.addAttribute("year", year);
        return "forward:/view-personal-schedule?week=" + week + "&year=" + year;
    }

    @PostMapping(value = "/view-personal-schedule")
    public String addSlot(@RequestParam("typeOfSlot") String typeOfSlot,
                          @RequestParam("day") String day,
                          @RequestParam("slot") String slot,
                          @RequestParam("week") int week,
                          @RequestParam("year") int year,
                          @RequestParam("description") String description,
                          @RequestParam(value = "exerciseSet", required = false) String exerciseSet,
                          @RequestParam(value = "exerciseRep", required = false) String exerciseRep,
                          @RequestParam(value = "nutritionAmount", required = false) String nutritionAmount,
                          @RequestParam(value = "exerciseSelect", required = false) List<String> selectedExercises,
                          @RequestParam(value = "nutritionSelect", required = false) List<String> selectedNutritions,
                          HttpSession session) {

        Gymer gymer = (Gymer) session.getAttribute("gymer");
        Schedule schedule = scheduleServiceImplement.findScheduleByGymerIdAndPTId(gymer.getGymerId(), null).get();

        if ("Exercise".equals(typeOfSlot)) {
            //Create slot exercise
            SlotExercise slotExercise = new SlotExercise();
            slotExercise.setDay(day);
            slotExercise.setWeek(week);
            slotExercise.setYear(year);
            String[] startEnd = slot.split("-");
            slotExercise.setStart_hour(startEnd[0]);
            slotExercise.setEnd_hour(startEnd[1]);
            slotExercise.setDescription(description);
            slotExercise.setSchedule(schedule);
            slotExeRepository.save(slotExercise);
            SlotExercise slotExe = slotExeRepository.findLastSlotExercise();
            int i = 0;
            for (String idExercise : selectedExercises) {
                //Create slot exercise details
                SlotExerciseDetail slotExerciseDetail = new SlotExerciseDetail();
                Exercise exercise = exerciseRepository.findById(Integer.parseInt(idExercise)).get();
                String[] set = exerciseSet.split(",");
                slotExerciseDetail.setSetExe(Integer.parseInt(set[i]));
                String[] rep = exerciseRep.split(",");
                slotExerciseDetail.setRep(Integer.parseInt(rep[i]));
                slotExerciseDetail.setExercise(exercise);
                slotExerciseDetail.setSlotExercise(slotExe);
                slotExeDetailService.save(slotExerciseDetail);
                i++;
            }
        } else if ("Nutrition".equals(typeOfSlot)) {
            //Create slot exercise
            SlotNutrition slotNutrition = new SlotNutrition();
            slotNutrition.setDay(day);
            slotNutrition.setWeek(week);
            slotNutrition.setYear(year);
            String[] startEnd = slot.split("-");
            slotNutrition.setStart_hour(startEnd[0]);
            slotNutrition.setEnd_hour(startEnd[1]);
            slotNutrition.setDescription(description);
            slotNutrition.setSchedule(schedule);
            slotNutriRepository.save(slotNutrition);
            SlotNutrition slotNutri = slotNutriRepository.findLastSlotNutrition();
            int j = 0;
            for (String idNutrition : selectedNutritions) {
                //Create slot nutrition details
                SlotNutritionDetail slotNutritionDetail = new SlotNutritionDetail();
                Nutrition nutrition = nutritionRepository.findById(Integer.parseInt(idNutrition)).get();
                String[] amount = nutritionAmount.split(",");
                slotNutritionDetail.setAmount(Integer.parseInt(amount[j]));
                slotNutritionDetail.setNutrition(nutrition);
                slotNutritionDetail.setSlotNutrition(slotNutri);
                slotNutriDetailService.save(slotNutritionDetail);
                j++;
            }
        }
        return "redirect:/selectWeek?week=" + week + "&year=" + year;
    }

    @PostMapping(value = "/update-personal-schedule")
    public String updateSlot(@RequestParam(value = "slotExerciseDetailId", required = false) String slotExerciseDetailId, @RequestParam(value = "exerciseSelect", required = false) String selectedExercises, @RequestParam(value = "exerciseSet", required = false) String exerciseSet, @RequestParam(value = "exerciseRep", required = false) String exerciseRep, @RequestParam(value = "slotNutritionDetailId", required = false) String slotNutritionDetailId, @RequestParam(value = "nutritionSelect", required = false) String selectedNutritions, @RequestParam(value = "nutritionAmount", required = false) String nutritionAmount, @RequestParam("description") String description) {

        // In ra các giá trị của request param
        System.out.println("slotExerciseDetailId: " + slotExerciseDetailId);
        int week = 0;
        int year = 0;
        if (slotExerciseDetailId != null) {
            String[] exeDetailId = slotExerciseDetailId.split(",");
            String[] exerciseId = selectedExercises.split(",");
            String[] set = exerciseSet.split(",");
            String[] rep = exerciseRep.split(",");
            for (int i = 0; i < exeDetailId.length; i++) {
                SlotExerciseDetail slotExerciseDetail = slotExeDetailService.getSlotExeDetailById(Integer.parseInt(exeDetailId[i])).get();
                slotExerciseDetail.setExercise(exerciseRepository.findNonPrivateById(Integer.parseInt(exerciseId[i])).get());
                slotExerciseDetail.setSetExe(Integer.parseInt(set[i]));
                slotExerciseDetail.setRep(Integer.parseInt(rep[i]));
                slotExerciseDetail.getSlotExercise().setDescription(description);
                week = slotExerciseDetail.getSlotExercise().getWeek();
                year = slotExerciseDetail.getSlotExercise().getYear();
                slotExeDetailService.save(slotExerciseDetail);
            }
        } else {
            String[] nutriDetailId = slotNutritionDetailId.split(",");
            String[] nutritionId = selectedNutritions.split(",");
            String[] amount = nutritionAmount.split(",");
            for (int i = 0; i < nutriDetailId.length; i++) {
                SlotNutritionDetail slotNutritionDetail = slotNutriDetailService.findById(Integer.parseInt(nutriDetailId[i])).get();
                slotNutritionDetail.setNutrition(nutritionRepository.findNonPrivateById(Integer.parseInt(nutritionId[i])).get());
                slotNutritionDetail.setAmount(Integer.parseInt(amount[i]));
                slotNutritionDetail.getSlotNutrition().setDescription(description);
                week = slotNutritionDetail.getSlotNutrition().getWeek();
                year = slotNutritionDetail.getSlotNutrition().getYear();
                slotNutriDetailService.save(slotNutritionDetail);
            }
        }
        return "redirect:/selectWeek?week=" + week + "&year=" + year;
    }

    @Transactional
    @PostMapping(value = "/delete-personal-slot")
    public String deleteSlot(@RequestParam(value = "slotExerciseId", required = false) String slotExerciseId,
                             @RequestParam(value = "slotNutritionId", required = false) String slotNutritionId) {
        int week=0;
        int year=0;
        System.out.println(slotExerciseId);
        System.out.println(slotNutritionId);
        if (slotExerciseId!=null){
            SlotExercise slotExercise = slotExeRepository.findById(Integer.parseInt(slotExerciseId));
            week = slotExercise.getWeek();
            year = slotExercise.getYear();
            slotExeDetailService.deleteAllBySlotExercise_Id(slotExercise.getId());
            slotExcerciseEntityService.deleteById(slotExercise.getId());
        } else {
            SlotNutrition slotNutrition = slotNutriRepository.findSlotNutritionById(Integer.parseInt(slotNutritionId));
            week = slotNutrition.getWeek();
            year = slotNutrition.getYear();
            slotNutriDetailService.deleteAllBySlotNutrition_Id(slotNutrition.getId());
            slotNutritionService.deleteById(slotNutrition.getId());
        }
        return "redirect:/selectWeek?week=" + week + "&year=" + year;
    }

}

