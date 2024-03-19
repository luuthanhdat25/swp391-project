package com.swpproject.application.repository;

import com.swpproject.application.model.SlotExercise;
import com.swpproject.application.model.SlotExerciseDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.relational.core.sql.In;

import java.util.List;
import java.util.Optional;

public interface SlotExeDetailRepository extends JpaRepository<SlotExerciseDetail, Integer> {
    public List<SlotExerciseDetail> findAllBySlotExercise_Id(Integer id);

    public Optional<SlotExerciseDetail> findSlotExerciseDetailById(Integer id);

    public void deleteAllBySlotExercise_Id(Integer id);
}
