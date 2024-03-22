package com.swpproject.application.repository;

import com.swpproject.application.model.Exercise;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ExerciseRepository extends JpaRepository<Exercise, Integer> {

    @Query("SELECT e FROM Exercise e WHERE e.isPrivate = 0")
    List<Exercise> findAllNonPrivate();

    @Query("SELECT e FROM Exercise e WHERE e.isPrivate = 0 AND e.id = :exerciseId ")
    Optional<Exercise> findNonPrivateById(Integer exerciseId);


    @Query("SELECT DISTINCT e FROM Exercise e " +
            "LEFT JOIN e.personalTrainer pt " +
            "LEFT JOIN Orders o ON pt.id = o.personalTrainer.id " +
            "LEFT JOIN o.gymer g " +
            "WHERE e.isPrivate = 0 OR g.id = :gymerId")
    List<Exercise> findAllNonPrivateOrPrivateForOrdersOnGoing(Integer gymerId);

    @Query("SELECT DISTINCT e FROM Exercise e " +
            "LEFT JOIN e.personalTrainer pt " +
            "LEFT JOIN Orders o ON pt.id = o.personalTrainer.id " +
            "LEFT JOIN o.gymer g " +
            "WHERE (e.isPrivate = 0 OR g.id = :gymerId) AND e.id = :exerciseId")
    Optional<Exercise> findNonPrivateOrPrivateForOrdersOnGoingById(Integer gymerId, Integer exerciseId);


    @Query("SELECT e FROM Exercise e " +
            "WHERE e.isPrivate = 0 OR e.personalTrainer.id = :personalTrainerId")
    List<Exercise> findAllNonPrivateOrByPersonalTrainerId(Integer personalTrainerId);

    @Query("SELECT e FROM Exercise e " +
            "WHERE (e.isPrivate = 0 OR e.personalTrainer.id = :personalTrainerId) AND e.id = :exerciseId")
    Optional<Exercise> findNonPrivateOrByPersonalTrainerId(Integer personalTrainerId, Integer exerciseId);

    Optional<Exercise> findById(Integer id);


    public List<Exercise> findAllByIsPrivate(int isPrivate);
}

