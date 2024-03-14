package com.swpproject.application.service;

import com.swpproject.application.model.Evaluation;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public interface EvaluationService {

    Optional<Evaluation> getEvaluationById(Integer id);

}
