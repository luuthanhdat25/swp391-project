package com.swpproject.application.utils;

import com.swpproject.application.dto.EvaluationDto;
import com.swpproject.application.dto.GymerDto;
import com.swpproject.application.dto.PersonalTrainerDto;
import com.swpproject.application.model.Evaluation;
import com.swpproject.application.model.Gymer;
import com.swpproject.application.model.PersonalTrainer;
import com.swpproject.application.service.CertificateService;
import com.swpproject.application.service.EvaluationService;
import com.swpproject.application.service.GymerService;
import com.swpproject.application.service.PersonalTrainerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class DtoUtils {

    private final CertificateService certificateService;
    private final PersonalTrainerService personalTrainerService;
    private final GymerService gymerService;
    private final EvaluationService evaluationService;

    @Autowired
    public DtoUtils(
            CertificateService certificateService,
            PersonalTrainerService personalTrainerService,
            GymerService gymerService,
            EvaluationService evaluationService

    ) {
        this.evaluationService = evaluationService;
        this.certificateService = certificateService;
        this.personalTrainerService = personalTrainerService;
        this.gymerService = gymerService;
    }

    public static GymerDto convertGymerToGymerDto(Gymer gymer) {
          return GymerDto.builder().id(gymer.getGymerId())
                                            .fullName(gymer.getAccount().getFullName())
                                            .address(gymer.getAccount().getAddress())
                                            .height(gymer.getHeight())
                                            .goal(gymer.getGoal().getLabel())
                                            .weight(gymer.getWeight())
                                            .gender(gymer.getAccount().getGender().getDesc())
                                            .description(gymer.getDescription())
                                            .avatarImage(gymer.getAccount().getAvatarImage())
                                            .phone(gymer.getAccount().getPhone())
                                            .birthday(gymer.getAccount().getBirthday().toString())
                                            .isBan(gymer.getAccount().getIsBan().toString())
                                            .email(gymer.getAccount().getEmail())
                                            .build();
    }

    public List<GymerDto> getGymerDtoList() {
        return gymerService.getAll().stream()
                                    .map(DtoUtils::convertGymerToGymerDto)
                                    .toList();
    }


    public PersonalTrainerDto convertPersonalTrainerToPersonalTrainerDto(PersonalTrainer personalTrainer) {
        List<byte[]> certificatList = certificateService.getAllCertificatesData(personalTrainer);
        return  PersonalTrainerDto.builder().id(personalTrainer.getId())
                                            .description(personalTrainer.getDescription())
                                            .price(personalTrainer.getPrice())
                                            .fullName(personalTrainer.getAccount().getFullName())
                                            .address(personalTrainer.getAccount().getAddress())
                                            .gender(personalTrainer.getAccount().getGender().getDesc())
                                            .avatarImage(personalTrainer.getAccount().getAvatarImage())
                                            .numberOfVotes(5)
                                            .averageVotes(4.7f)
                                            .phone(personalTrainer.getAccount().getPhone())
                                            .birthday(personalTrainer.getAccount().getBirthday().toString())
                                            .bankName(personalTrainer.getBankName())
                                            .bankNumber(personalTrainer.getBankNumber())
                                            .email(personalTrainer.getAccount().getEmail())
                                            .isBan(personalTrainer.getAccount().getIsBan().toString())
                                            .certificateList(certificatList)
                                            .build();
    }

    public List<PersonalTrainerDto> getPersonalTrainerDtoList() {
        List<PersonalTrainer> personalTrainers = personalTrainerService.getAll();
        return  personalTrainers.stream()
                                .map(personalTrainer -> convertPersonalTrainerToPersonalTrainerDto(personalTrainer))
                                .toList();
    }

    public static EvaluationDto convertEvaluationToEvaluationDto(Evaluation evaluation) {
        return EvaluationDto.builder()  .id(evaluation.getId())
                                        .evaluationDateTime(evaluation.getEvaluationDate())
                                        .commentFeedback(evaluation.getContent())
                                        .starRating(evaluation.getStar())
                                        .gymer(evaluation.getGymer())
                                        .gymerDto(convertGymerToGymerDto(evaluation.getGymer()))
                                        .personalTrainer(evaluation.getPersonalTrainer())
                                        .build();
    }

    public static Evaluation revertEvaluationDtoToEvaluation(EvaluationDto evaluationDto) {
        return Evaluation.builder() .id(evaluationDto.getId())
                                    .evaluationDate(evaluationDto.getEvaluationDateTime())
                                    .content(evaluationDto.getCommentFeedback())
                                    .star(evaluationDto.getStarRating())
                                    .gymer(evaluationDto.getGymer())
                                    .personalTrainer(evaluationDto.getPersonalTrainer())
                                    .build();
    }



}
