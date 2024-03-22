package com.swpproject.application.repository;

import com.swpproject.application.model.SlotExercise;
import com.swpproject.application.model.SlotNutrition;
import org.springframework.dao.EmptyResultDataAccessException;
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

    public void save(SlotNutrition slotNutrition) {
        String sql = "INSERT INTO slot_nutrition (day, week, year, start_hour, end_hour, description, schedule_id) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, slotNutrition.getDay(), slotNutrition.getWeek(),
                slotNutrition.getYear(), slotNutrition.getStart_hour(), slotNutrition.getEnd_hour(), slotNutrition.getDescription(),
                slotNutrition.getSchedule().getId());
    }

    public SlotNutrition findLastSlotNutrition() {
        String sql = "SELECT TOP 1 * FROM slot_nutrition ORDER BY id DESC";
        try {
            return jdbcTemplate.queryForObject(sql, BeanPropertyRowMapper.newInstance(SlotNutrition.class));
        } catch (EmptyResultDataAccessException e) {
            return null; // Trả về null nếu không có bản ghi nào
        }
    }

    public SlotNutrition findSlotNutritionById(int id) {
        String sql = "SELECT * FROM slot_nutrition WHERE id = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new Object[]{id}, BeanPropertyRowMapper.newInstance(SlotNutrition.class));
        } catch (EmptyResultDataAccessException e) {
            return null; // Trả về null nếu không có bản ghi nào
        }
    }

    public List<SlotNutrition> findSlotNutriByWeekAndYearAndScheduleId(int week, int year, Integer id) {
        String sql = "SELECT * FROM slot_nutrition WHERE week = ? AND year = ? AND schedule_id = ?";
        return jdbcTemplate.query(sql, new Object[]{week, year, id}, new BeanPropertyRowMapper<>(SlotNutrition.class));
    }


    public List<SlotNutrition> findAll() {
        String sql = "SELECT * FROM slot_nutrition";
        return jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(SlotNutrition.class));
    }

    public void deleteById(int id) {
        String sql = "DELETE FROM slot_nutrition WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }

}
