package com.swpproject.application.repository;

import com.swpproject.application.model.SlotExercise;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SlotExcerciseEntityRepository extends JpaRepository<SlotExercise,Long> {
}
