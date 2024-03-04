package com.swpproject.application.controller;

import com.swpproject.application.model.Account;
import com.swpproject.application.model.Gymer;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.repository.PersonalTrainerRepository;
import com.swpproject.application.service.AccountService;
import com.swpproject.application.service.PersonalTrainerService;
import com.swpproject.application.service.impl.AccountServiceImpl;
import jakarta.servlet.http.HttpSession;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Calendar;
import java.util.GregorianCalendar;

@Controller
public class BookController {
    @Autowired
    private PersonalTrainerService personalTrainerService;

    @RequestMapping(value = "/SelectWeek", method = RequestMethod.POST)
    public String selectWeek(@RequestParam("week") int week,
                             @RequestParam("year") int year,
                             HttpSession session, Model model) {
        model.addAttribute("selectedWeek", week);
        model.addAttribute("selectedYear", year);

        // Return the name of the view to render
        return "book-pt";
    }

    @RequestMapping(value = "book-pt", method = RequestMethod.GET)
    public String bookPT(HttpSession session, Model model){
        PersonalTrainer personalTrainer = personalTrainerService.findPersonalTrainerByAccountID(1);
        model.addAttribute("pt", personalTrainer);
        return "book-pt";
    }

}
