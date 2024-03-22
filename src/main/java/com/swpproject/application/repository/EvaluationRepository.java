package com.swpproject.application.repository;

import com.swpproject.application.model.Evaluation;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface EvaluationRepository extends JpaRepository<Evaluation, Integer> {

    public List<Evaluation> findAllByPersonalTrainer_Id(Integer id);

}
