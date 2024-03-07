package com.swpproject.application.controller;

import com.swpproject.application.model.*;
import com.swpproject.application.repository.*;
import com.swpproject.application.service.SlotExeDetailService;
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

import java.util.List;
import java.util.Map;
import java.util.Optional;


@Controller
public class PersonalScheduleController {

    @Autowired
    private SlotExeDetailService slotExeDetailService;

    @Autowired
    private SlotExeRepository slotExeRepository;

    @Autowired
    private NutritionRepository nutritionRepository;

    @Autowired
    private SlotNutriRepository slotNutriRepository;

    @Autowired
    private ScheduleRepository scheduleRepository;

    @Autowired
    private ExerciseRepository exerciseRepository;

    @Autowired
    private ScheduleServiceImplement scheduleServiceImplement;

    @GetMapping(value = "/view-personal-schedule")
    public String showPersonalSchedule() {
        // Add your controller logic here
        return "view-schedule"; // Return the view name
    }

    @GetMapping(value = "/selectWeek", params = {"week", "year"})
    public String showPersonalScheduleWithParams(@RequestParam("week") int week,
                                                 @RequestParam("year") int year,
                                                 HttpSession session) {
        int scheduleId = 0;
        Gymer gymer = (Gymer) session.getAttribute("gymer");
        if (gymer!=null){
            Schedule schedule = scheduleServiceImplement.findScheduleByGymerIdAndPTId(gymer.getGymerId(),null).get();
            scheduleId =schedule.getId();
            List<SlotExercise> slotExercises = slotExeRepository.findSlotExeByWeekAndYearAndScheduleId(week, year, scheduleId);
            session.setAttribute("slotExercises", slotExercises);
            List<SlotNutrition> slotNutritions = slotNutriRepository.findSlotNutriByWeekAndYearAndScheduleId(week, year, scheduleId);
            session.setAttribute("slotNutritions", slotNutritions);
            session.setAttribute("schedule",schedule);
        } else {
            PersonalTrainer personalTrainer = (PersonalTrainer) session.getAttribute("personalTrainer");
            List<SlotExercise> slotExercises = slotExeRepository.findSlotExeByPTIdAndIsPending(personalTrainer.getId(),false);
            session.setAttribute("slotExercises", slotExercises);
        }
        List<Exercise> exercises = exerciseRepository.findAll();
        session.setAttribute("exercises",exercises);

        List<Nutrition> nutritions = nutritionRepository.findAll();
        session.setAttribute("nutritions",nutritions);

        session.setAttribute("week", week);
        session.setAttribute("year", year);
        return "redirect:/view-personal-schedule?year=" + year + "&week=" + week;
    }

    @PostMapping(value = "/view-personal-schedule")
    public String addSlot(@RequestParam("typeOfSlot") String typeOfSlot,
                          @RequestParam("day") String day,
                          @RequestParam("slot") String slot,
                          @RequestParam(value = "exerciseSet", required = false) String exerciseSet,
                          @RequestParam(value = "exerciseRep", required = false) String exerciseRep,
                          @RequestParam(value = "nutritionAmount", required = false) String nutritionAmount,
                          @RequestParam(value = "exerciseSelect", required = false) List<String> selectedExercises,
                          @RequestParam(value = "nutritionSelect", required = false) List<String> selectedNutritions,
                          HttpSession session) {

        int week = (int) session.getAttribute("week");
        int year = (int) session.getAttribute("year");
        Schedule schedule = (Schedule) session.getAttribute("schedule");

        if ("Exercise".equals(typeOfSlot)) {
            if (selectedExercises != null) {
                //Create slot exercise
                SlotExercise slotExercise = new SlotExercise();
                slotExercise.setDay(day);
                slotExercise.setWeek(week);
                slotExercise.setYear(year);
                String[] startEnd = slot.split("-");
                slotExercise.setStart_hour(startEnd[0]);
                slotExercise.setEnd_hour(startEnd[1]);
                slotExercise.setSchedule(schedule);
                slotExeRepository.save(slotExercise);

                int i = 0;
//                for (String idExercise : selectedExercises) {
//                    //Create slot exercise details
//                    SlotExerciseDetail slotExerciseDetail = new SlotExerciseDetail();
//                    Exercise exercise = exerciseRepository.findById(Integer.parseInt(idExercise));
//                    String[] set = exerciseSet.split(",");
//                    slotExerciseDetail.setSetExe(Integer.parseInt(set[i]));
//
//                    String[] rep = exerciseRep.split(",");
//                    slotExerciseDetail.setRep(Integer.parseInt(rep[i]));
//
//                    // Set the reference to slotExercise here
//                    slotExerciseDetail.setSlotExercise(slotExercise);
//
//                    slotExerciseDetail.setExercise(exercise);
//                    slotExeDetailService.save(slotExerciseDetail);
//                    i++;
//                }
            }
        }
        else if ("Nutrition".equals(typeOfSlot)) {
//            if (selectedNutritions != null) {
//                //Create slot exercise
//                SlotNutrition slotNutrition = new SlotNutrition();
//                slotNutrition.setDay(day);
//                slotNutrition.setWeek(week);
//                slotNutrition.setYear(year);
//                String[] startEnd = slot.split("-");
//                slotNutrition.setStart_hour(startEnd[0]);
//                slotNutrition.setEnd_hour(startEnd[1]);
//                slotNutrition.setSchedule(schedule);
//                for (String nutrition : selectedNutritions) {
//                    System.out.println("Selected Nutrition: " + nutrition);
//                }
//            }
        }

        return "redirect:/view-personal-schedule?year=" + year + "&week=" + week;
    }

}

