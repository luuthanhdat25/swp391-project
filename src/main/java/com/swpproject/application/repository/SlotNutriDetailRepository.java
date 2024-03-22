package com.swpproject.application.repository;

import com.swpproject.application.model.SlotNutritionDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface SlotNutriDetailRepository extends JpaRepository<SlotNutritionDetail,Integer> {
    public List<SlotNutritionDetail> findAllBySlotNutrition_Id(Integer id);

    public Optional<SlotNutritionDetail> findSlotNutritionDetailById(Integer id);

    public void deleteAllBySlotNutrition_Id(Integer id);

    @Query(value = "SELECT SND " +
           "  FROM slot_nutrition_detail SND\n" +
           "  JOIN slot_nutrition SN\n" +
           "    ON SN.id = SND.slot_nutrition_id\n" +
           "  JOIN schedule sc\n" +
           "    ON sc.id = sn.schedule_id\n" +
           "  JOIN gymer gy\n" +
           "    ON gy.id = sc.gymer_id\n" +
           " WHERE gy.id = ? AND sc.personal_trainer_id IS NULL", nativeQuery = true)
    public List<SlotNutritionDetail> getSlotNutritionDetailsByGymerId(Integer id);

}
