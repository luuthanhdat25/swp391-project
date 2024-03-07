package com.swpproject.application.repository;

import com.swpproject.application.model.SlotExercise;
import com.swpproject.application.model.SlotNutrition;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SlotNutriRepository {

    private final JdbcTemplate jdbcTemplate;

    public SlotNutriRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public SlotNutrition save(SlotNutrition slotNutrition) {
        String sql = "INSERT INTO slot_nutrition (day, week, year, start_hour, end_hour, schedule_id) " +
                "VALUES (?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, slotNutrition.getDay(), slotNutrition.getWeek(),
                slotNutrition.getYear(), slotNutrition.getStart_hour(), slotNutrition.getEnd_hour(),
                slotNutrition.getSchedule().getId());
        return slotNutrition;
    }

    public List<SlotNutrition> findSlotNutriByWeekAndYearAndScheduleId(int week, int year, Integer id) {
        String sql = "SELECT * FROM slot_nutrition WHERE week = ? AND year = ? AND schedule_id = ?";
        return jdbcTemplate.query(sql, new Object[]{week, year, id}, new BeanPropertyRowMapper<>(SlotNutrition.class));
    }


    public List<SlotNutrition> findAll() {
        String sql = "SELECT * FROM slot_nutrition";
        return jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(SlotNutrition.class));
    }

}
