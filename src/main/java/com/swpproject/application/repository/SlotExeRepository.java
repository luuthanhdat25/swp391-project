package com.swpproject.application.repository;

import com.swpproject.application.enums.Attendant;
import com.swpproject.application.model.SlotExercise;
import org.springframework.dao.EmptyResultDataAccessException;
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

    public void save(SlotExercise slotExercise) {
        String sql = "INSERT INTO slot_exercise (attendant_status, day, week, year, start_hour, end_hour, is_pending, description, schedule_id) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, slotExercise.getAttendantStatus(), slotExercise.getDay(), slotExercise.getWeek(),
                slotExercise.getYear(), slotExercise.getStart_hour(), slotExercise.getEnd_hour(),
                slotExercise.isPending(), slotExercise.getDescription(), slotExercise.getSchedule().getId());
    }

    public SlotExercise findLastSlotExercise() {
        String sql = "SELECT TOP 1 * FROM slot_exercise ORDER BY id DESC";
        try {
            return jdbcTemplate.queryForObject(sql, BeanPropertyRowMapper.newInstance(SlotExercise.class));
        } catch (EmptyResultDataAccessException e) {
            return null; // Trả về null nếu không có bản ghi nào
        }
    }

    public List<SlotExercise> findSlotExeByWeekAndYearAndScheduleId(int week, int year, Integer id) {
        String sql = "SELECT * FROM slot_exercise WHERE week = ? AND year = ? AND schedule_id = ?";
        return jdbcTemplate.query(sql, new Object[]{week, year, id}, new BeanPropertyRowMapper<>(SlotExercise.class));
    }

    public List<SlotExercise> findSlotExeByWeekAndYearAndPTIdAndIsPending(int week, int year, Integer id, int isPending) {
        String sql = "SELECT * FROM slot_exercise WHERE week = ? AND year = ? AND personal_trainer_id = ? AND is_pending = ?";
        return jdbcTemplate.query(sql, new Object[]{week,year, id, isPending}, new BeanPropertyRowMapper<>(SlotExercise.class));
    }

    public List<SlotExercise> findSlotExeByWeekAndYearAndGymerIdAndIsPending(int week, int year, Integer id, boolean isPending) {
        String sql = "SELECT * FROM slot_exercise WHERE week = ? AND year = ? AND gymer_id = ? AND is_pending = ?";
        return jdbcTemplate.query(sql, new Object[]{week,year, id, isPending}, new BeanPropertyRowMapper<>(SlotExercise.class));
    }

    public List<SlotExercise> findAll() {
        String sql = "SELECT * FROM slot_exercise";
        return jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(SlotExercise.class));
    }

    public SlotExercise findById(int id) {
        String sql = "SELECT * FROM slot_exercise WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{id}, BeanPropertyRowMapper.newInstance(SlotExercise.class));
    }

    public boolean existsByWeekAndSlot(int week, int year, String startHour, String endHour) {
        String sql = "SELECT COUNT(*) FROM slot_exercise " +
                "WHERE week = ? AND year = ? " +
                "AND start_hour = ? AND end_hour = ?";
        int count = jdbcTemplate.queryForObject(sql, Integer.class, week, year, startHour, endHour);
        return count > 0;
    }

}
