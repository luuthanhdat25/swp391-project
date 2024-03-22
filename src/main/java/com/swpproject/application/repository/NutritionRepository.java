package com.swpproject.application.repository;

import com.swpproject.application.model.Nutrition;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface NutritionRepository extends JpaRepository<Nutrition, Integer> {
    @Query("SELECT n FROM Nutrition n WHERE n.isPrivate = 0")
    List<Nutrition> findAllNonPrivate();

    @Query("SELECT n FROM Nutrition n WHERE n.isPrivate = 0 AND n.nutritionId = :nutritionId ")
    Optional<Nutrition> findNonPrivateById(Integer nutritionId);


    @Query("SELECT DISTINCT n FROM Nutrition n " +
            "LEFT JOIN n.personalTrainer pt " +
            "LEFT JOIN Orders o ON pt.id = o.personalTrainer.id " +
            "LEFT JOIN o.gymer g " +
            "WHERE n.isPrivate = 0 OR g.gymerId = :gymerId")
    List<Nutrition> findAllNonPrivateOrPrivateForOrdersOnGoing(Integer gymerId);

    @Query("SELECT DISTINCT n FROM Nutrition n " +
            "LEFT JOIN n.personalTrainer pt " +
            "LEFT JOIN Orders o ON pt.id = o.personalTrainer.id " +
            "LEFT JOIN o.gymer g " +
            "WHERE (n.isPrivate = 0 OR g.gymerId = :gymerId) AND n.nutritionId = :nutritionId")
    Optional<Nutrition> findNonPrivateOrPrivateForOrdersOnGoingById(Integer gymerId, Integer nutritionId);


    @Query("SELECT n FROM Nutrition n " +
            "WHERE n.isPrivate = 0 OR n.personalTrainer.id = :personalTrainerId")
    List<Nutrition> findAllNonPrivateOrByPersonalTrainerId(Integer personalTrainerId);

    @Query("SELECT n FROM Nutrition n " +
            "WHERE (n.isPrivate = 0 OR n.personalTrainer.id = :personalTrainerId) AND n.nutritionId = :nutritionId")
    Optional<Nutrition> findNonPrivateOrByPersonalTrainerId(Integer personalTrainerId, Integer nutritionId);

    public List<Nutrition> findAllByIsPrivate(int isPrivate);
}
