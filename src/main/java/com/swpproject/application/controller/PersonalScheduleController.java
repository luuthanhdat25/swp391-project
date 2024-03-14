package com.swpproject.application.controller;

import com.swpproject.application.enums.Role;
import com.swpproject.application.model.*;
import com.swpproject.application.repository.*;
import com.swpproject.application.service.PersonalTrainerService;
import com.swpproject.application.service.SlotExcerciseEntityService;
import com.swpproject.application.service.SlotExeDetailService;
import com.swpproject.application.service.SlotNutriDetailService;
import com.swpproject.application.service.impl.ScheduleServiceImplement;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
    private ScheduleServiceImplement scheduleServiceImplement;

    // view pt schedule
    @GetMapping(value = "/view-pt-schedule")
    public String showPTSchedule(Model model) {
        return "pt-schedule";
    }

    @GetMapping(value = "/selectTime", params = {"week", "year"})
    public String showSchedulePT(@RequestParam("week") int week,
                                     @RequestParam("year") int year, Model model,
                                     HttpSession session) {
        Account account = (Account) session.getAttribute("account");
        if (account.getRole().equals(Role.PT)){
            PersonalTrainer personalTrainer = personalTrainerService.findPersonalTrainerByAccountID(account.getId());
            List<SlotExercise> slotExercises = slotExcerciseEntityService.findAllByWeekAndYearAndPersonalTrainerAndIsPending(week,year,personalTrainer,true);
            model.addAttribute("slotExercises", slotExercises);
        }
        return "forward:/view-pt-schedule?year=" + year + "&week=" + week;
    }

    // gymer view schedule created by Personal Trainer
    @GetMapping(value = "/view-schedule-withpt")
    public String viewScheduleWithPT(Model model) {
        return "gymer-schedule";
    }

    @GetMapping(value = "/select-week", params = {"week", "year"})
    public String showScheduleWithPT(@RequestParam("week") int week,
                                     @RequestParam("year") int year, Model model,
                                     HttpSession session) {
        Gymer gymer = (Gymer) session.getAttribute("gymer");
        if (gymer != null) {
            List<SlotExercise> slotExes = slotExcerciseEntityService.findAllByWeekAndYearAndGymerAndPersonalTrainerNotNullAndIsPending(week,year,gymer,true);
            model.addAttribute("slotExes", slotExes);
        }

        return "forward:/view-schedule-withpt?year=" + year + "&week=" + week;
    }

    //Gymer view personal schedule
    @GetMapping(value = "/view-personal-schedule")
    public String showPersonalSchedule(Model model) {
        return "view-schedule";
    }

    @GetMapping(value = "/selectWeek", params = {"week", "year"})
    public String showPersonalScheduleWithParams(@RequestParam("week") int week,
                                                 @RequestParam("year") int year,
                                                 Model model, HttpSession session) {
        int scheduleId = 0;
        Gymer gymer = (Gymer) session.getAttribute("gymer");
        if (gymer != null) {
            Schedule schedule = scheduleServiceImplement.findScheduleByGymerIdAndPTId(gymer.getGymerId(),null).get();
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
        return "forward:/view-personal-schedule?week="+week+"&year="+year;
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
        Schedule schedule = scheduleServiceImplement.findScheduleByGymerIdAndPTId(gymer.getGymerId(),null).get();

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
}

