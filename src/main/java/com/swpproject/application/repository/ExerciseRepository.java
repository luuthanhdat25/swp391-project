package com.swpproject.application.repository;

import com.swpproject.application.model.Exercise;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ExerciseRepository {

    private final JdbcTemplate jdbcTemplate;

    public ExerciseRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public Exercise save(Exercise exercise) {
        String sql = "INSERT INTO exercise (description, equipment, image_description, is_private, level, name, type, video_description, personal_trainer_id) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql,
                exercise.getDescription(),
                exercise.getEquipment(),
                exercise.getImageDescription(),
                exercise.getIsPrivate(),
                exercise.getLevel(),
                exercise.getName(),
                exercise.getType(),
                exercise.getVideoDescription(),
                exercise.getPersonalTrainer().getId());
        return exercise;
    }

    public Exercise findById(Integer id) {
        String sql = "SELECT * FROM exercise WHERE id = ?";
        return jdbcTemplate.queryForObject(sql, BeanPropertyRowMapper.newInstance(Exercise.class), id);
    }

    public List<Exercise> findAll() {
        String sql = "SELECT * FROM exercise";
        return jdbcTemplate.query(sql, BeanPropertyRowMapper.newInstance(Exercise.class));
    }

    public void delete(Integer id) {
        String sql = "DELETE FROM exercise WHERE id = ?";
        jdbcTemplate.update(sql, id);
    }
}

//@Repository
//public interface ExerciseRepository extends JpaRepository<Exercise, Integer> {
//}

