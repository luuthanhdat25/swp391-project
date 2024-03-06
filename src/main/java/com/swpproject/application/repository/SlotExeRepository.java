package com.swpproject.application.repository;

import com.swpproject.application.model.SlotExercise;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SlotExeRepository {

    private final JdbcTemplate jdbcTemplate;

    public SlotExeRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public SlotExercise save(SlotExercise slotExercise) {
        String sql = "INSERT INTO slot_exercise (attendant_status, day, week, year, start_hour, end_hour, is_pending, schedule_id) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, slotExercise.getAttendantStatus(), slotExercise.getDay(), slotExercise.getWeek(),
                slotExercise.getYear(), slotExercise.getStart_hour(), slotExercise.getEnd_hour(),
                slotExercise.isPending(), slotExercise.getSchedule().getId());
        return slotExercise;
    }

    public List<SlotExercise> findSlotExeByWeekAndYearAndScheduleId(int week, int year, Integer id) {
        String sql = "SELECT * FROM slot_exercise WHERE week = ? AND year = ? AND schedule_id = ?";
        return jdbcTemplate.query(sql, new Object[]{week, year, id}, new BeanPropertyRowMapper<>(SlotExercise.class));
    }


    public List<SlotExercise> findAll() {
        String sql = "SELECT * FROM slot_exercise";
        return jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(SlotExercise.class));
    }

    public void deleteExeById(Long id) {
        String sql = "DELETE FROM slot_exercise WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }
}
