package com.swpproject.application.controller.personal_trainer;

import com.swpproject.application.dto.EvaluationDto;
import com.swpproject.application.dto.GymerDto;
import com.swpproject.application.dto.PersonalTrainerDto;
import com.swpproject.application.dto.RoleDTO;
import com.swpproject.application.enums.Gender;
import com.swpproject.application.enums.Goal;
import com.swpproject.application.enums.Role;
import com.swpproject.application.model.Account;
import com.swpproject.application.model.Evaluation;
import com.swpproject.application.model.Gymer;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.service.*;
import com.swpproject.application.utils.DtoUtils;
import com.swpproject.application.utils.JsonUtils;
import com.swpproject.application.repository.PersonalTrainerRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/personal-trainer")
public class PersonalTrainerController {
    private static final DateTimeFormatter DATETIME_PATTERN = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    private final PersonalTrainerRepository personalTrainerRepository;
    private final CertificateService certificateService;
    private final DtoUtils dtoUtils;
    private final PersonalTrainerService personalTrainerService;

    @Autowired
    private OrderRequestService orderRequestService;
    private final GymerService gymerService;
    private final EvaluationService evaluationService;
    private final AccountService accountService;

    @Autowired
    public PersonalTrainerController(
            PersonalTrainerRepository personalTrainerRepository,
            CertificateService certificateService,
            DtoUtils dtoUtils, PersonalTrainerService personalTrainerService,
            AccountService accountService,
            EvaluationService evaluationService,
            GymerService gymerService
    ) {
        this.gymerService = gymerService;
        this.personalTrainerRepository = personalTrainerRepository;
        this.certificateService = certificateService;
        this.dtoUtils = dtoUtils;
        this.personalTrainerService = personalTrainerService;
        this.accountService = accountService;
        this.evaluationService = evaluationService;
    }

    @RequestMapping(value = "", method = RequestMethod.GET, produces = "text/html; charset=UTF-8")
    public String getPersonalTrainerListPage(ModelMap model, HttpServletRequest request) {
        RoleDTO roleDTO = RoleDTO.getRoleDTOFromHttpServletRequest(request);
        List<PersonalTrainerDto> personalTrainerDTOList = personalTrainerService.getPersonalTrainerDTOList(roleDTO);
        for(PersonalTrainerDto personalTrainerDto : personalTrainerDTOList){
            List<Evaluation> evaluationList = evaluationService.findAllEvaluationsByPersonalTrainerId(personalTrainerDto.getId());
            int evaluationNumber = evaluationList.size();
            float average = 0f;
            if(evaluationNumber != 0){
                int totalStar = 0;
                for(Evaluation evaluation : evaluationList){
                    totalStar += evaluation.getStar();
                }
                average = (float) totalStar / evaluationNumber;
            }
            personalTrainerDto.setNumberOfVotes(evaluationNumber);
            personalTrainerDto.setAverageVotes(average);
        }

        String json = JsonUtils.jsonConvert(personalTrainerDTOList);

        model.addAttribute("canSearchDistance", canSearchDistance(roleDTO, request));
        model.addAttribute("personalTrainerList", json);
        return "personal-trainer-list";
    }

    private boolean canSearchDistance(RoleDTO roleDTO, HttpServletRequest request){
        if(roleDTO == null || roleDTO.getRole() != Role.GYMER) return false;
        HttpSession session = request.getSession();
        Account account = (Account)  session.getAttribute("account");
        String originAddress = account.getAddress();
        return originAddress != null && !originAddress.isEmpty();
    }

    @RequestMapping(value = "/details", method = RequestMethod.GET)
    public String view_profile_details(@RequestParam(name = "id", required = false) int id, ModelMap model,
                                       HttpSession session) {
        if((Account) session.getAttribute("account") == null) {
            Optional<PersonalTrainer> personalTrainer = personalTrainerRepository.findById(id);
            List<Evaluation> evaluationList = evaluationService.findAllEvaluationsByPersonalTrainerId(id);
            List<EvaluationDto> evaluationDtoList = evaluationService.findAllEvaluationsByPersonalTrainerId(personalTrainer.get().getId())
                    .stream()
                    .map(evaluation -> dtoUtils.convertEvaluationToEvaluationDto(evaluation))
                    .sorted(Comparator.comparing(EvaluationDto::getEvaluationDateTime).reversed())
                    .toList();
            PersonalTrainerDto personalTrainerDTO = dtoUtils.convertPersonalTrainerToPersonalTrainerDto(personalTrainer.get());
            String json = JsonUtils.jsonConvert(personalTrainerDTO);
            model.addAttribute("gymerAsView", new Gymer());
            model.addAttribute("personaltrainer", json);
            model.addAttribute("evaluations", evaluationDtoList);
            return "pt-profile-details";
        }
        Optional<PersonalTrainer> personalTrainer = personalTrainerRepository.findById(id);
        List<Evaluation> evaluationList = evaluationService.findAllEvaluationsByPersonalTrainerId(id);
        List<EvaluationDto> evaluationDtoList = evaluationService.findAllEvaluationsByPersonalTrainerId(personalTrainer.get().getId())
                .stream()
                .map(evaluation -> dtoUtils.convertEvaluationToEvaluationDto(evaluation))
                .sorted(Comparator.comparing(EvaluationDto::getEvaluationDateTime).reversed())
                .toList();
        PersonalTrainerDto personalTrainerDTO = dtoUtils.convertPersonalTrainerToPersonalTrainerDto(personalTrainer.get());
        String json = JsonUtils.jsonConvert(personalTrainerDTO);
        Account account = (Account) session.getAttribute("account");
        model.addAttribute("gymerAsView", new Gymer());
        model.addAttribute("personaltrainer", json);
        model.addAttribute("evaluations", evaluationDtoList);
        if(account == null ) {
            return "pt-profile-details";
        }
        if(Role.GYMER.equals(account.getRole())) {
            Gymer gymer = gymerService.getGymerByAccount(account).get();
            boolean canEvaluate = orderRequestService.getOrderHistoryGymer(gymer).stream()
                    .filter(order -> order.getPersonalTrainer().getId() == personalTrainer.get().getId())
                    .filter(order -> order.getTracking() >= 80).count() > 0;

            boolean canReport = orderRequestService.getOrderHistoryGymer(gymer).stream()
                    .filter(order -> order.getPersonalTrainer().getId() == personalTrainer.get().getId())
                    .filter(order -> order.getTracking() >= 5).count() > 0;
            if(canEvaluate) {
                GymerDto gymerDto = DtoUtils.convertGymerToGymerDto(gymer);
                gymerDto.setGoal(Goal.fromLabel(gymerDto.getGoal()));
                String gymerJson = JsonUtils.jsonConvert(gymerDto);
                model.addAttribute("gymerAsView", gymerJson);
                model.addAttribute("canEvaluate", canEvaluate);
            }
            if(canReport) {
                model.addAttribute("canReport", canReport);
            }
        }
        model.addAttribute("isPt", Role.PT.equals(account.getRole()));
        return "pt-profile-details";
    }

    @PostMapping("/feedback")
    public ResponseEntity<String> getFeedBack(@RequestBody EvaluationDto evaluationDto) {
        PersonalTrainer personalTrainer = personalTrainerService.getPersonalTrainerById(evaluationDto.getPersonalTrainer().getId()).get();
        evaluationDto.setEvaluationDateTime(LocalDateTime.now());
        evaluationDto.setPersonalTrainer(personalTrainer);
        evaluationDto.setGymer(gymerService.getGymerById(evaluationDto.getGymerDto().getId()).get());
        Evaluation evaluation = DtoUtils.revertEvaluationDtoToEvaluation(evaluationDto);
        evaluationService.save(evaluation);
        return ResponseEntity.ok("Evaluate personal trainer successfully!");
    }


    // UPDATE PROFILE
    @GetMapping("update")
    public String showFormUpdate(@RequestParam int id,
                                 ModelMap model,
                                 HttpSession session) {
        PersonalTrainerDto personalTrainerDTO = dtoUtils.convertPersonalTrainerToPersonalTrainerDto(personalTrainerRepository.findById(id).get());
        String json = JsonUtils.jsonConvert(personalTrainerDTO);
        model.addAttribute("personalTrainerDto", json);
        session.setAttribute("personalTrainer", personalTrainerRepository.findById(id).get());
        return "profile-update";
    }

    @PostMapping("update")
    public String updateProfile(@RequestParam int id,
                                @ModelAttribute PersonalTrainerDto personalTrainerDto,
                                @RequestParam("avatar") MultipartFile avatar,
                                HttpSession session) throws IOException {
        PersonalTrainer personalTrainer = personalTrainerRepository.getPersonalTrainerById(personalTrainerDto.getId()).get() .toBuilder()
                .description(personalTrainerDto.getDescription())
                .bankName(personalTrainerDto.getBankName())
                .bankNumber(personalTrainerDto.getBankNumber())
                .price(personalTrainerDto.getPrice())
                .build();
        Account account = accountService.getAccountByEmail(personalTrainer.getAccount().getEmail()).get();
        account = account.toBuilder()
                .fullName(personalTrainerDto.getFullName())
                .phone(personalTrainerDto.getPhone())
                .birthday(LocalDate.parse(personalTrainerDto.getBirthday(),DATETIME_PATTERN))
                .gender(Gender.valueOf(personalTrainerDto.getGender()))
                .address(personalTrainerDto.getAddress())
                .build();

        if(!avatar.isEmpty()) {
            account.setAvatarImage(avatar.getBytes());
        }
        personalTrainer.setAccount(account);

        personalTrainer.setPrice(Integer.valueOf(personalTrainerDto.getPrice()));
        session.setAttribute("account", account);
        session.setAttribute("personalTrainer", personalTrainer);
        accountService.save(account);
        personalTrainerRepository.save(personalTrainer);
        return "redirect:/profile/details?ptid=" + id;
    }


}


