package com.swpproject.application.controller.admin;

import com.swpproject.application.dto.EvaluationDto;
import com.swpproject.application.dto.GymerDto;
import com.swpproject.application.dto.PersonalTrainerDto;
import com.swpproject.application.enums.Role;
import com.swpproject.application.model.Account;
import com.swpproject.application.model.Gymer;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.service.AccountService;
import com.swpproject.application.service.EvaluationService;
import com.swpproject.application.service.GymerService;
import com.swpproject.application.service.PersonalTrainerService;
import com.swpproject.application.utils.DtoUtils;
import com.swpproject.application.utils.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class AdminController {

    @Autowired
    private AccountService accountService;

    @Autowired
    private GymerService gymerService;

    @Autowired
    private PersonalTrainerService personalTrainerService;

    @Autowired
    private EvaluationService evaluationService;

    @Autowired
    private DtoUtils dtoUtils;

    @GetMapping("admin-home/manage-account")
    public String viewAllAccount(Model model){
        List<Account> accountList = accountService.getAccounts()
                .stream()
                .filter(account -> !Role.ADMIN.equals(account.getRole())).toList();
        model.addAttribute("accountList",accountList);
        return "admin-view-accounts";
    }

    @GetMapping("admin-home/manage-account/details")
    public String viewDetails(@RequestParam("id") int id,
                                Model model){
        Account accountView = accountService.getAccountById(id).get();
        model.addAttribute("accountView", accountView);
        if(accountView.getRole().equals(Role.GYMER)) {
            Gymer gymer = gymerService.getGymerByAccount(accountView).get();
            GymerDto gymerDto = dtoUtils.convertGymerToGymerDto(gymer);
            String gymerDtoJson = JsonUtils.jsonConvert(gymerDto);
            model.addAttribute("gymerDtoJson", gymerDtoJson);
            return "profile/profile-details";
        } else {
            PersonalTrainer personalTrainer = personalTrainerService.findPersonalTrainerByAccountID(accountView.getId());
            PersonalTrainerDto personalTrainerDto = dtoUtils.convertPersonalTrainerToPersonalTrainerDto(personalTrainer);
            List<EvaluationDto> evaluationDtoList = evaluationService.findAllEvaluationsByPersonalTrainerId(personalTrainerDto.getId())
                    .stream()
                    .map(evaluation -> dtoUtils.convertEvaluationToEvaluationDto(evaluation))
                    .toList();
            model.addAttribute("evaluations", evaluationDtoList);
            model.addAttribute("personalDtoJson", JsonUtils.jsonConvert(dtoUtils.convertPersonalTrainerToPersonalTrainerDto(personalTrainer)));
            return "profile/pt-profile-details";
        }
    }

    @GetMapping("admin-home/lock-account")
    public String lockAccount(@RequestParam("id") int id) {
        Account account = accountService.getAccountById(id).get();
        System.out.println("Before -->" + account.getIsBan());
        account.setIsBan(true);
        System.out.println("After -->" + account.getIsBan());
        accountService.save(account);
        return "redirect:/admin-home/manage-account?locked";
    }

    @GetMapping("admin-home/unlock-account")
    public String unlockAccount(@RequestParam("id") int id) {
        Account account = accountService.getAccountById(id).get();
        account.setIsBan(false);
        accountService.save(account);
        return "redirect:/admin-home/manage-account?unlocked";
    }

}
