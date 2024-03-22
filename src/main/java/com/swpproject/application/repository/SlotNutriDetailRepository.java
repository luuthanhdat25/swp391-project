package com.swpproject.application.repository;

import com.swpproject.application.model.SlotNutritionDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Repository
public interface SlotNutriDetailRepository extends JpaRepository<SlotNutritionDetail,Integer> {
    public List<SlotNutritionDetail> findAllBySlotNutrition_Id(Integer id);

    public Optional<SlotNutritionDetail> findSlotNutritionDetailById(Integer id);

    public void deleteAllBySlotNutrition_Id(Integer id);

    @Transactional
    @Query(value = "SELECT SND " +
           "  FROM SlotNutritionDetail SND\n" +
           "  JOIN SlotNutrition SN\n" +
           "    ON SN.id = SND.slotNutrition.id\n" +
           "  JOIN Schedule sc\n" +
           "    ON sc.id = sn.schedule.id\n" +
           "  JOIN Gymer gy\n" +
           "    ON gy.gymerId = sc.gymer.gymerId\n" +
           " WHERE gy.gymerId = :id AND sc.personalTrainer IS NULL", nativeQuery = true)
    public List<SlotNutritionDetail> getSlotNutritionDetailsByGymerId(Integer id);

}
