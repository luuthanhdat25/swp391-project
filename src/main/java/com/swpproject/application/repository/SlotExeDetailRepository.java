package com.swpproject.application.repository;

import com.swpproject.application.model.SlotExerciseDetail;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SlotExeDetailRepository extends JpaRepository<SlotExerciseDetail, Integer> {
    public List<SlotExerciseDetail> findAllBySlotExercise_Id(Integer id);
}
