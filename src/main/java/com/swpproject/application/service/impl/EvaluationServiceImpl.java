package com.swpproject.application.service.impl;

import com.swpproject.application.model.Evaluation;
import com.swpproject.application.repository.EvaluationRepository;
import com.swpproject.application.service.EvaluationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class EvaluationServiceImpl implements EvaluationService {

    @Autowired
    EvaluationRepository evaluationRepository;

    @Override
    public Optional<Evaluation> getEvaluationById(Integer id) {
        return evaluationRepository.findById(id);
    }
}
